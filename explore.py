#!/usr/bin/env python3
"""The "explore" campaign: keep mutating until the time budget runs out.

The default campaign runs a fixed number of mutants per configuration so that
its numbers can be compared day to day. This one is the opposite: it varies
seeds, mutation counts and llc flags, and runs for as long as it is given.

Three mechanisms keep that affordable:

Collector   A result is kept only when it adds something: a category that has
            fewer than --keep-per-key occurrences so far, a category never
            seen in any earlier run (--history), or a new top regression.
            Everything else is counted into one aggregate entry and its mutant
            file is deleted, so report.json and the disk stay bounded.

Energy      Configurations whose mutants keep hitting categories that are
            already saturated are sampled less often; configurations that
            produce novelty are sampled more often. The weights are written
            back to --energy, so the next run starts where this one stopped.

Corpus      Mutants that hit a never-seen category are saved to --corpus-out
            (with the llc flags they were found with) and are used as inputs
            on later runs, which stacks mutations over days.
"""

import collections
import concurrent.futures as cf
import dataclasses
import hashlib
import json
import os
import random
import shlex
import shutil
import sys
import time

CONFIG_MARKER = "; isel-diff-config: "

# Extensions the explore pass adds to or removes from a configuration. Kept to
# ones llc accepts on its own; anything invalid just makes SDAG fail and the
# configuration is skipped.
MATTRS = ["m", "a", "f", "d", "c", "zba", "zbb", "zbs", "zbkb", "zicond", "zfh",
          "zfhmin", "zfa", "zfinx", "zdinx", "zhinx", "v", "zve32x", "zve64d",
          "zvfh", "zvbb", "zvkb", "zicsr", "zihintpause", "zcb", "xtheadba"]
OPT_LEVELS = ["-O0", "-O1", "-O2", "-O3"]
CODE_MODELS = ["-code-model=small", "-code-model=medium"]


def add_arguments(ap):
    ap.add_argument("--explore", action="store_true",
                    help="mutate until --time-budget runs out instead of running a "
                         "fixed number of mutants per configuration")
    ap.add_argument("--explore-seed", type=int, default=0,
                    help="first mutation seed (0: derived from the current day)")
    ap.add_argument("--keep-per-key", type=int, default=3,
                    help="occurrences kept per category before results are only counted")
    ap.add_argument("--max-mutations", type=int, default=8,
                    help="upper end of the mutations-per-mutant range")
    ap.add_argument("--no-flag-mutation", dest="flag_mutation", action="store_false",
                    help="keep the llc flags of the RUN line")
    ap.add_argument("--corpus", help="directory of saved mutants to mutate further")
    ap.add_argument("--corpus-out", help="where to save mutants that hit a new category")
    ap.add_argument("--corpus-max", type=int, default=200, help="files kept in the corpus")
    ap.add_argument("--energy", help="JSON file of per-configuration weights, read and updated")
    return ap


# --------------------------------------------------------------------------
# Flag mutation
# --------------------------------------------------------------------------

def _mattrs_of(flags):
    for f in flags:
        if f.startswith(("-mattr=", "--mattr=")):
            return [a.lstrip("+") for a in f.split("=", 1)[1].split(",") if a.strip("+-")]
    return []


def mutate_flags(flags, rnd):
    """A variation of one RUN line's llc flags: -O level, extensions, code model."""
    out = [f for f in flags
           if not f.startswith(("-O", "-code-model=", "-mattr=", "--mattr="))
           or f.startswith("-O") and len(f) > 3]
    attrs = _mattrs_of(flags)
    for _ in range(rnd.randint(0, 2)):
        if attrs and rnd.random() < 0.25:
            attrs.pop(rnd.randrange(len(attrs)))
        else:
            a = rnd.choice(MATTRS)
            if a not in attrs:
                attrs.append(a)
    if attrs:
        out.append("-mattr=" + ",".join("+" + a for a in attrs))
    out.append(rnd.choice(OPT_LEVELS))
    if rnd.random() < 0.15:
        out.append(rnd.choice(CODE_MODELS))
    if not any(f.startswith("-verify-machineinstrs") for f in out):
        out.append("-verify-machineinstrs")
    return out


def has_vectors(flags):
    attrs = _mattrs_of(flags)
    return any(a == "v" or a.startswith("zve") for a in attrs)


# --------------------------------------------------------------------------
# Corpus
# --------------------------------------------------------------------------

def corpus_jobs(args, Job):
    """Saved mutants as inputs, with the flags they were found with."""
    jobs = []
    if not args.corpus or not os.path.isdir(args.corpus):
        return jobs
    for name in sorted(os.listdir(args.corpus)):
        if not name.endswith(".ll"):
            continue
        path = os.path.join(args.corpus, name)
        flags = None
        with open(path) as f:
            for line in f:
                if line.startswith(CONFIG_MARKER):
                    flags = shlex.split(line[len(CONFIG_MARKER):].strip())
                    break
                if not line.startswith(";"):
                    break
        if flags:
            jobs.append(Job(path, [], flags))
    return jobs


def drop_mutant(args, res):
    """Delete the mutant file of a result that is not kept.

    Only files the mutator wrote are ever removed: a result can carry the path
    of an input test (a mutant that was never generated, for instance), and
    those must not be touched.
    """
    path = res.get("file", "")
    mutants = os.path.join(os.path.abspath(args.out), "mutants") + os.sep
    if res.get("mutant_of") and os.path.abspath(path).startswith(mutants):
        try:
            os.remove(path)
        except OSError:
            pass


def corpus_save(args, res, src_path):
    """Keep a mutant that found something new, so later runs can build on it."""
    mutants = os.path.join(os.path.abspath(args.out), "mutants") + os.sep
    if not args.corpus_out or not os.path.abspath(src_path).startswith(mutants) \
            or not os.path.exists(src_path):
        return
    os.makedirs(args.corpus_out, exist_ok=True)
    files = [os.path.join(args.corpus_out, n) for n in os.listdir(args.corpus_out)
             if n.endswith(".ll")]
    if len(files) >= args.corpus_max:
        files.sort(key=lambda p: os.path.getmtime(p))
        for p in files[: len(files) - args.corpus_max + 1]:
            os.remove(p)
    with open(src_path) as f:
        body = f.read()
    tag = hashlib.sha1((res["file"] + res["config"]).encode()).hexdigest()[:8]
    out = os.path.join(args.corpus_out,
                       f"{os.path.basename(res.get('mutant_of') or res['file'])[:-3]}.{tag}.ll")
    with open(out, "w") as f:
        f.write(CONFIG_MARKER + res["config"] + "\n" + body)


# --------------------------------------------------------------------------
# Scheduling
# --------------------------------------------------------------------------

class Scheduler:
    """Picks the configuration to mutate next, by weight."""

    MIN, MAX = 0.05, 8.0

    def __init__(self, args, jobs):
        self.jobs = jobs
        self.weights = [1.0] * len(jobs)
        self.index = {self.key(j): i for i, j in enumerate(jobs)}
        self.saved = {}
        if args.energy and os.path.exists(args.energy):
            with open(args.energy) as f:
                self.saved = json.load(f)
            for k, i in self.index.items():
                self.weights[i] = min(max(float(self.saved.get(k, 1.0)), self.MIN), self.MAX)

    @staticmethod
    def key(job):
        return f"{os.path.basename(job.path)}|{job.config}"

    def pick(self, rnd):
        return rnd.choices(self.jobs, weights=self.weights, k=1)[0]

    def feedback(self, job, factor):
        i = self.index.get(self.key(job))
        if i is not None:
            self.weights[i] = min(max(self.weights[i] * factor, self.MIN), self.MAX)

    def save(self, args):
        if not args.energy:
            return
        out = dict(self.saved)
        # Normalized: a run where everything saturates would otherwise push
        # every weight to the floor and lose the relative ordering.
        mean = sum(self.weights) / len(self.weights)
        for k, i in self.index.items():
            out[k] = round(min(max(self.weights[i] / mean, self.MIN), self.MAX), 4)
        # Bound the file: only configurations that drifted from 1.0 matter.
        out = {k: v for k, v in out.items() if abs(v - 1.0) > 0.01}
        with open(args.energy, "w") as f:
            json.dump(out, f, indent=0, sort_keys=True)


class Collector:
    """Decides which results are worth keeping; counts the rest."""

    def __init__(self, args, result_keys, top):
        self.args = args
        self.result_keys = result_keys
        self.top = top
        self.counts = collections.Counter()
        self.results = []
        self.deltas = []
        self.seen_new = set()
        self.dropped = 0
        self.agg_status = collections.Counter()
        self.agg_reasons = collections.Counter()
        self.agg_crashes = collections.Counter()
        self.skipped = collections.Counter()

    def _reg_cut(self):
        if len(self.deltas) < self.top:
            return 0
        return self.deltas[self.top - 1]

    def _note_delta(self, res):
        d = max((fn["gisel"] - fn["sdag"] for fn in res.get("functions", [])
                 if fn["status"] == "gisel-worse"), default=0)
        if d > 0:
            self.deltas.append(d)
            self.deltas.sort(reverse=True)
            del self.deltas[self.top * 4:]
        return d

    def add(self, res, job=None, always=False):
        """Returns ("kept"|"dropped", [novel keys])."""
        keys = [f"{k}|{v}" for k, v in self.result_keys(res)]
        novel = [k for k in keys
                 if k not in self.args.history_keys and k not in self.seen_new]
        delta = self._note_delta(res)
        keep = always or bool(novel) or (delta > 0 and delta > self._reg_cut()) \
            or any(self.counts[k] < self.args.keep_per_key for k in keys)
        if "skipped" in res:
            self.skipped[res["skipped"]] += 1
            keep = always
        self.seen_new.update(novel)
        if keep:
            for k in keys:
                self.counts[k] += 1
            self.results.append(res)
            if novel and job is not None and res.get("mutant_of"):
                corpus_save(self.args, res, res["file"])
            return "kept", novel
        self.dropped += 1
        for kind, key in self.result_keys(res):
            if kind == "fallback":
                self.agg_reasons[key] += 1
            elif kind == "crash":
                self.agg_crashes[key] += 1
        for fn in res.get("functions", []):
            self.agg_status[fn["status"]] += 1
        if res.get("miscompiles"):
            self.agg_status["miscompile"] += len(res["miscompiles"])
        drop_mutant(self.args, res)
        return "dropped", novel

    def aggregate(self):
        """One synthetic result carrying the counts of everything dropped."""
        if not self.dropped:
            return None
        return {"file": "(dropped mutants)", "config": "(aggregate)", "dropped": True,
                "results": self.dropped, "status": dict(self.agg_status),
                "reasons": dict(self.agg_reasons), "crashes": dict(self.agg_crashes)}


# --------------------------------------------------------------------------

def run(args, process_job):
    """Explore until the deadline; returns (results, jobs run, meta extras)."""
    import isel_diff as ID

    def process(job, args):
        # A corpus file can be evicted while it is queued as an input, and a
        # mutant of a mutant can hit anything; one bad job must not stop the
        # campaign.
        try:
            return process_job(job, args)
        except (OSError, UnicodeDecodeError) as e:
            return {"file": job.path, "config": job.config, "skipped": f"{type(e).__name__}"}

    seed = args.explore_seed or 1000 + int(time.time()) // 86400 * 97
    rnd = random.Random(seed)
    base = ID.base_jobs(args)
    corpus = corpus_jobs(args, ID.Job)
    for j in base + corpus:
        j.exec_ok = True if args.exec_originals_only else ID.exec_sampled(j, args)
    print(f"{len(base)} configurations, {len(corpus)} corpus inputs, seeds from {seed}",
          file=sys.stderr)
    if not base and not corpus:
        return [], 0, None

    sched = Scheduler(args, base + corpus)
    col = Collector(args, ID.result_keys, args.top)
    deadline = args.deadline or (time.time() + 30 * 60)
    njobs = 0

    def stream():
        """(configuration, mutant job) pairs; the configuration gets the feedback."""
        n = 0
        while True:
            j = sched.pick(rnd)
            flags = mutate_flags(j.flags, rnd) if args.flag_mutation else list(j.flags)
            m = dataclasses.replace(
                j, flags=flags, seed=seed + n, mutations=rnd.randint(1, args.max_mutations),
                scalable=has_vectors(flags) and rnd.random() < 0.5)
            m.exec_ok = not args.exec_originals_only and ID.exec_sampled(m, args)
            n += 1
            yield j, m

    with cf.ThreadPoolExecutor(args.jobs) as ex:
        # The unmutated inputs are the baseline: always kept, never dropped.
        for res in ex.map(lambda j: process(j, args), base + corpus):
            col.add(res, always=True)
            njobs += 1
        print(f"  baseline done ({njobs} configurations), "
              f"{(deadline - time.time()) / 60:.0f} min left", file=sys.stderr)

        gen, inflight, window = stream(), {}, max(4 * args.jobs, 16)
        last = time.time()
        while time.time() < deadline:
            while len(inflight) < window:
                cfg, jb = next(gen)
                inflight[ex.submit(process, jb, args)] = (cfg, jb)
                njobs += 1
            done, _ = cf.wait(inflight, return_when=cf.FIRST_COMPLETED, timeout=30)
            for fu in done:
                cfg, jb = inflight.pop(fu)
                how, novel = col.add(fu.result(), jb)
                # Gentle: a configuration is mutated hundreds of times, so a
                # single result should barely move its weight.
                sched.feedback(cfg, 1.5 if novel else (0.97 if how == "dropped" else 1.02))
            if time.time() - last > 120:
                last = time.time()
                print(f"  {njobs} jobs, {len(col.results)} kept, {col.dropped} dropped, "
                      f"{len(col.seen_new)} new categories, "
                      f"{(deadline - time.time()) / 60:.0f} min left", file=sys.stderr)
        # Finish what is already running; nothing new is started.
        for fu, (cfg, jb) in inflight.items():
            col.add(fu.result(), jb)

    sched.save(args)
    results = col.results
    agg = col.aggregate()
    if agg:
        results = results + [agg]
    extra = {"explore_seed": seed, "kept": len(col.results), "dropped": col.dropped,
             "new_categories": sorted(col.seen_new)[:200],
             "new_category_count": len(col.seen_new),
             "skipped_reasons": dict(col.skipped),
             "corpus_in": len(corpus),
             "corpus_out": len([n for n in os.listdir(args.corpus_out)
                                if n.endswith(".ll")]) if args.corpus_out
                           and os.path.isdir(args.corpus_out) else 0}
    print(f"explore: {njobs} jobs, {len(col.results)} kept, {col.dropped} dropped, "
          f"{len(col.seen_new)} new categories", file=sys.stderr)
    return results, njobs, extra
