// Standalone driver for llvm/FuzzMutate: reads textual IR, applies N random
// mutations, and prints the mutated module. llvm-isel-fuzzer exposes the same
// mutator but only when linked against libFuzzer.
//
// Usage: ir-mutate [-seed=S] [-n=N] [-max-size=M] [-keep-unchanged] < in.ll

#include "llvm/AsmParser/Parser.h"
#include "llvm/FuzzMutate/IRMutator.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/StructuralHash.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

static cl::opt<int> Seed("seed", cl::init(1));
static cl::opt<unsigned> NumMutations("n", cl::init(3));
static cl::opt<unsigned> MaxSize("max-size", cl::init(1 << 20));
static cl::opt<bool> KeepUnchanged(
    "keep-unchanged",
    cl::desc("Keep bodies of functions the mutations did not touch"));

static std::unique_ptr<IRMutator> createMutator() {
  std::vector<TypeGetter> Types{
      Type::getInt1Ty,   Type::getInt8Ty,   Type::getInt16Ty,
      Type::getInt32Ty,  Type::getInt64Ty,  Type::getHalfTy,
      Type::getBFloatTy, Type::getFloatTy,  Type::getDoubleTy,
      [](LLVMContext &C) { return Type::getIntNTy(C, 128); },
      [](LLVMContext &C) {
        return FixedVectorType::get(Type::getInt32Ty(C), 4);
      },
      [](LLVMContext &C) {
        return FixedVectorType::get(Type::getInt8Ty(C), 8);
      },
      [](LLVMContext &C) {
        return FixedVectorType::get(Type::getInt64Ty(C), 2);
      },
      [](LLVMContext &C) {
        return FixedVectorType::get(Type::getFloatTy(C), 4);
      }};

  std::vector<std::unique_ptr<IRMutationStrategy>> S;
  S.push_back(std::make_unique<InjectorIRStrategy>());
  S.push_back(std::make_unique<InstDeleterIRStrategy>());
  S.push_back(std::make_unique<InstModificationIRStrategy>());
  S.push_back(std::make_unique<InsertCFGStrategy>());
  S.push_back(std::make_unique<InsertPHIStrategy>());
  S.push_back(std::make_unique<SinkInstructionStrategy>());
  S.push_back(std::make_unique<ShuffleBlockStrategy>());
  return std::make_unique<IRMutator>(std::move(Types), std::move(S));
}

int main(int argc, char **argv) {
  cl::ParseCommandLineOptions(argc, argv, "FuzzMutate IR mutator\n");
  LLVMContext Ctx;
  SMDiagnostic Err;
  auto Buf = MemoryBuffer::getSTDIN();
  if (!Buf) {
    errs() << "cannot read stdin\n";
    return 1;
  }
  std::unique_ptr<Module> M = parseAssembly(**Buf, Err, Ctx);
  if (!M) {
    Err.print(argv[0], errs());
    return 1;
  }

  DenseMap<const Function *, stable_hash> Before;
  for (const Function &F : *M)
    if (!F.isDeclaration())
      Before[&F] = StructuralHash(F, /*DetailedHash=*/true);

  auto Mut = createMutator();
  for (unsigned I = 0; I < NumMutations; ++I)
    Mut->mutateModule(*M, Seed * 7919 + I, MaxSize);

  if (!KeepUnchanged) {
    bool AnyChanged = false;
    for (Function &F : *M) {
      if (F.isDeclaration())
        continue;
      auto It = Before.find(&F);
      if (It != Before.end() &&
          It->second == StructuralHash(F, /*DetailedHash=*/true))
        F.deleteBody();
      else
        AnyChanged = true;
    }
    if (!AnyChanged)
      return 3;
  }

  if (verifyModule(*M, &errs()))
    return 2;
  M->print(outs(), nullptr);
  return 0;
}
