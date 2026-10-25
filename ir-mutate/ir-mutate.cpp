// Standalone driver for llvm/FuzzMutate: reads textual IR, applies N random
// mutations, and prints the mutated module. llvm-isel-fuzzer exposes the same
// mutator but only when linked against libFuzzer.
//
// Usage: ir-mutate [-seed=S] [-n=N] [-max-size=M] [-keep-unchanged] [-scalable] < in.ll
//
// Two extra modes support the execution (miscompile) oracle in isel_diff.py:
//
//   ir-mutate -sanitize < in.ll
//     Removes sources of undefined behaviour so that every correct instruction
//     selector must produce the same observable results: undef/poison
//     operands become zero, poison-generating flags, UB-implying attributes and
//     fast-math flags are dropped, shift amounts are reduced modulo the bit
//     width, divisors of 0 (and -1 for signed division) become 1, ...
//     All defined functions get external linkage so a harness can call them.
//
//   ir-mutate -harness -xlen=64 -inputs=64 [-funcs=a,b] [-describe=I] < sanitized.ll
//     Prints a freestanding RISC-V Linux harness (no libc) that calls each
//     eligible function on -inputs pseudo-random argument tuples and writes an
//     8-byte hash of the return value and of a memory arena (where pointer
//     arguments point) per call to stdout. argv[1] is the first test to run,
//     so a driver can resume after a test crashes. "; test K name" lines list
//     the tests; -describe=I adds "; input K: args" lines for input I.
//     Declarations used by the module get stub definitions (functions return
//     zero, globals are zero-initialized).

#include "llvm/ADT/APFloat.h"
#include "llvm/AsmParser/Parser.h"
#include "llvm/IR/AttributeMask.h"
#include "llvm/FuzzMutate/IRMutator.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PatternMatch.h"
#include "llvm/IR/StructuralHash.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include <random>

using namespace llvm;
using namespace llvm::PatternMatch;

static cl::opt<int> Seed("seed", cl::init(1));
static cl::opt<unsigned> NumMutations("n", cl::init(3));
static cl::opt<unsigned> MaxSize("max-size", cl::init(1 << 20));
static cl::opt<bool> KeepUnchanged(
    "keep-unchanged",
    cl::desc("Keep bodies of functions the mutations did not touch"));
static cl::opt<bool>
    Scalable("scalable", cl::desc("Also let mutations use scalable vectors"));

static cl::opt<bool> Sanitize("sanitize",
                              cl::desc("Remove undefined behaviour"));
static cl::opt<bool> Harness("harness", cl::desc("Print an execution harness"));
static cl::list<std::string> Funcs("funcs", cl::CommaSeparated,
                                   cl::desc("Functions to test (default all)"));
static cl::opt<unsigned> NumInputs("inputs", cl::init(64));
static cl::opt<unsigned> XLen("xlen", cl::init(64));
static cl::opt<int> Describe("describe", cl::init(-1),
                             cl::desc("Describe the arguments of input I"));

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
  // Appended so that the default type list (and therefore every mutant of
  // the fixed-seed "main" campaign) stays the same.
  if (Scalable) {
    Types.push_back([](LLVMContext &C) {
      return ScalableVectorType::get(Type::getInt32Ty(C), 2);
    });
    Types.push_back([](LLVMContext &C) {
      return ScalableVectorType::get(Type::getInt8Ty(C), 8);
    });
    Types.push_back([](LLVMContext &C) {
      return ScalableVectorType::get(Type::getInt64Ty(C), 1);
    });
    Types.push_back([](LLVMContext &C) {
      return ScalableVectorType::get(Type::getFloatTy(C), 2);
    });
    Types.push_back([](LLVMContext &C) {
      return ScalableVectorType::get(Type::getInt1Ty(C), 4);
    });
  }

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

// --------------------------------------------------------------------------
// -sanitize
// --------------------------------------------------------------------------

static Constant *fixConst(Constant *C) {
  if (isa<UndefValue>(C))
    return Constant::getNullValue(C->getType());
  if (!isa<ConstantVector>(C) && !isa<ConstantStruct>(C) &&
      !isa<ConstantArray>(C))
    return C;
  SmallVector<Constant *> Ops;
  bool Changed = false;
  for (Use &U : C->operands()) {
    auto *E = cast<Constant>(U.get());
    Constant *N = fixConst(E);
    Changed |= N != E;
    Ops.push_back(N);
  }
  if (!Changed)
    return C;
  if (isa<ConstantVector>(C))
    return ConstantVector::get(Ops);
  if (auto *ST = dyn_cast<StructType>(C->getType()))
    return ConstantStruct::get(ST, Ops);
  return ConstantArray::get(cast<ArrayType>(C->getType()), Ops);
}

static void sanitizeModule(Module &M) {
  AttributeMask UB = AttributeFuncs::getUBImplyingAttributes();
  UB.addAttribute(Attribute::Range);
  UB.addAttribute(Attribute::NonNull);
  UB.addAttribute(Attribute::NoFPClass);
  static const char *FPAttrs[] = {
      "unsafe-fp-math",          "no-nans-fp-math",     "no-infs-fp-math",
      "no-signed-zeros-fp-math", "approx-func-fp-math", "less-precise-fpmad"};

  for (GlobalVariable &G : M.globals())
    if (G.hasInitializer())
      G.setInitializer(fixConst(G.getInitializer()));

  for (Function &F : M) {
    for (const char *A : FPAttrs)
      F.removeFnAttr(A);
    if (F.isDeclaration())
      continue;
    F.setLinkage(GlobalValue::ExternalLinkage);
    F.setVisibility(GlobalValue::DefaultVisibility);
    F.setComdat(nullptr);
    F.removeRetAttrs(UB);
    for (unsigned I = 0; I < F.arg_size(); ++I)
      F.removeParamAttrs(I, UB);

    std::vector<Instruction *> Insts;
    for (BasicBlock &BB : F)
      for (Instruction &I : BB)
        Insts.push_back(&I);
    std::vector<Instruction *> Dead;
    for (Instruction *I : Insts) {
      I->dropPoisonGeneratingAnnotations();
      I->dropUBImplyingAttrsAndMetadata();
      if (isa<FPMathOperator>(I))
        I->copyFastMathFlags(FastMathFlags());
      for (Use &U : I->operands())
        if (auto *C = dyn_cast<Constant>(U.get()))
          if (!C->getType()->isTokenTy() && !C->getType()->isLabelTy())
            U.set(fixConst(C));
      if (auto *SV = dyn_cast<ShuffleVectorInst>(I)) {
        SmallVector<int> Mask(SV->getShuffleMask());
        bool Changed = false;
        for (int &E : Mask)
          if (E < 0) {
            E = 0;
            Changed = true;
          }
        if (Changed)
          SV->setShuffleMask(Mask);
      }
      if (auto *BO = dyn_cast<BinaryOperator>(I)) {
        Type *T = BO->getType();
        Value *R = BO->getOperand(1);
        unsigned BW = T->getScalarSizeInBits();
        const APInt *C;
        IRBuilder<> B(BO);
        if (BO->isShift()) {
          if (!match(R, m_APInt(C)) || C->uge(BW))
            BO->setOperand(1, isPowerOf2_32(BW)
                                  ? B.CreateAnd(R, ConstantInt::get(T, BW - 1))
                                  : B.CreateURem(R, ConstantInt::get(T, BW)));
        } else if (BO->isIntDivRem()) {
          bool Signed = BO->getOpcode() == Instruction::SDiv ||
                        BO->getOpcode() == Instruction::SRem;
          if (!match(R, m_APInt(C)) || C->isZero() ||
              (Signed && C->isAllOnes())) {
            Value *Bad = B.CreateICmpEQ(R, Constant::getNullValue(T));
            if (Signed)
              Bad = B.CreateOr(
                  Bad, B.CreateICmpEQ(R, Constant::getAllOnesValue(T)));
            BO->setOperand(1, B.CreateSelect(Bad, ConstantInt::get(T, 1), R));
          }
        }
      }
      if (auto *II = dyn_cast<IntrinsicInst>(I)) {
        switch (II->getIntrinsicID()) {
        case Intrinsic::assume:
          Dead.push_back(II);
          break;
        case Intrinsic::ctlz:
        case Intrinsic::cttz:
        case Intrinsic::abs:
          II->setArgOperand(1, ConstantInt::getFalse(II->getContext()));
          break;
        case Intrinsic::fmuladd: {
          // SelectionDAG and GlobalISel may legitimately disagree on fusing.
          IRBuilder<> B(II);
          Value *Mul = B.CreateFMul(II->getArgOperand(0), II->getArgOperand(1));
          II->replaceAllUsesWith(B.CreateFAdd(Mul, II->getArgOperand(2)));
          Dead.push_back(II);
          break;
        }
        default:
          break;
        }
      }
    }
    for (Instruction *I : Dead)
      I->eraseFromParent();
  }
}

// --------------------------------------------------------------------------
// -harness
// --------------------------------------------------------------------------

static bool eligibleType(Type *T, bool AllowVoid) {
  if (T->isVoidTy())
    return AllowVoid;
  if (T->isIntegerTy())
    return T->getIntegerBitWidth() <= 256;
  if (T->isHalfTy() || T->isBFloatTy() || T->isFloatTy() || T->isDoubleTy() ||
      T->isFP128Ty() || T->isPointerTy())
    return true;
  if (auto *VT = dyn_cast<FixedVectorType>(T))
    return VT->getNumElements() <= 64 &&
           eligibleType(VT->getElementType(), false);
  if (auto *AT = dyn_cast<ArrayType>(T))
    return AT->getNumElements() <= 16 &&
           eligibleType(AT->getElementType(), false);
  if (auto *ST = dyn_cast<StructType>(T)) {
    if (ST->isOpaque() || ST->getNumElements() > 16)
      return false;
    for (Type *E : ST->elements())
      if (!eligibleType(E, false))
        return false;
    return true;
  }
  return false;
}

static const unsigned ArenaBytes = 8192;

struct Gen {
  std::mt19937_64 Rng;
  GlobalVariable *Arena;
  Type *IXL;

  Constant *arenaPtr(Type *PtrTy, unsigned ArgNo) {
    Constant *P = ConstantExpr::getPtrAdd(
        Arena, ConstantInt::get(IXL, 2048 + 512 * (ArgNo % 8)));
    if (PtrTy->getPointerAddressSpace() != 0)
      P = ConstantExpr::getAddrSpaceCast(P, PtrTy);
    return P;
  }

  Constant *random(Type *T, unsigned ArgNo) {
    if (auto *IT = dyn_cast<IntegerType>(T)) {
      unsigned W = IT->getBitWidth();
      APInt V;
      switch (Rng() % 12) {
      case 0:
        V = APInt(W, 0);
        break;
      case 1:
        V = APInt(W, 1);
        break;
      case 2:
        V = APInt::getAllOnes(W);
        break;
      case 3:
        V = APInt::getSignedMinValue(W);
        break;
      case 4:
        V = APInt::getSignedMaxValue(W);
        break;
      case 5:
      case 6:
      case 7:
      case 8: // small values keep loops short
        V = APInt(64, (int64_t)(Rng() % 41) - 8, true).sextOrTrunc(W);
        break;
      default: {
        uint64_t Words[4] = {Rng(), Rng(), Rng(), Rng()};
        V = APInt(W, ArrayRef<uint64_t>(Words, (W + 63) / 64));
        break;
      }
      }
      return ConstantInt::get(IT, V);
    }
    if (T->isFloatingPointTy()) {
      static const double Vals[] = {0.0,   -0.0,  1.0,     -1.0,    0.5,
                                    2.0,   3.0,   -7.25,   100.0,   1e10,
                                    -1e-7, 65504, INFINITY, -INFINITY, NAN};
      double D;
      if (Rng() % 2)
        D = Vals[Rng() % std::size(Vals)];
      else
        D = (double)((int64_t)(Rng() % 4001) - 2000) / 16.0;
      return ConstantFP::get(T, D);
    }
    if (T->isPointerTy())
      return arenaPtr(T, ArgNo);
    if (auto *VT = dyn_cast<FixedVectorType>(T)) {
      SmallVector<Constant *> E;
      for (unsigned I = 0; I < VT->getNumElements(); ++I)
        E.push_back(random(VT->getElementType(), ArgNo));
      return ConstantVector::get(E);
    }
    if (auto *AT = dyn_cast<ArrayType>(T)) {
      SmallVector<Constant *> E;
      for (unsigned I = 0; I < AT->getNumElements(); ++I)
        E.push_back(random(AT->getElementType(), ArgNo));
      return ConstantArray::get(AT, E);
    }
    auto *ST = cast<StructType>(T);
    SmallVector<Constant *> E;
    for (Type *ET : ST->elements())
      E.push_back(random(ET, ArgNo));
    return ConstantStruct::get(ST, E);
  }
};

// Multiplication-free mixing so that the harness links on targets without M.
static Value *mix(IRBuilder<> &B, Value *H, Value *X) {
  H = B.CreateXor(H, X);
  H = B.CreateXor(H, B.CreateShl(H, 13));
  H = B.CreateXor(H, B.CreateLShr(H, 7));
  return B.CreateXor(H, B.CreateShl(H, 17));
}

static Value *hashValue(IRBuilder<> &B, Value *H, Value *V) {
  Type *T = V->getType();
  Type *I64 = B.getInt64Ty();
  if (auto *IT = dyn_cast<IntegerType>(T)) {
    unsigned W = IT->getBitWidth();
    if (W <= 64)
      return mix(B, H, B.CreateZExt(V, I64));
    for (unsigned Off = 0; Off < W; Off += 64)
      H = mix(B, H, B.CreateTrunc(Off ? B.CreateLShr(V, Off) : V, I64));
    return H;
  }
  if (T->isFloatingPointTy()) {
    // Canonicalize NaNs with integer operations only (no soft-float calls).
    const fltSemantics &S = T->getFltSemantics();
    unsigned W = APFloat::semanticsSizeInBits(S);
    unsigned Man = APFloat::semanticsPrecision(S) - 1;
    Type *IT = B.getIntNTy(W);
    Value *Bits = B.CreateBitCast(V, IT);
    APInt Exp = APInt::getBitsSet(W, Man, W - 1);
    APInt ManMask = APInt::getLowBitsSet(W, Man);
    Value *IsNaN = B.CreateAnd(
        B.CreateICmpEQ(B.CreateAnd(Bits, ConstantInt::get(IT, Exp)),
                       ConstantInt::get(IT, Exp)),
        B.CreateICmpNE(B.CreateAnd(Bits, ConstantInt::get(IT, ManMask)),
                       ConstantInt::get(IT, 0)));
    Bits = B.CreateSelect(IsNaN, ConstantInt::get(IT, APInt::getAllOnes(W)),
                          Bits);
    return hashValue(B, H, Bits);
  }
  if (T->isPointerTy())
    return mix(B, H, B.CreatePtrToInt(V, I64));
  if (auto *VT = dyn_cast<FixedVectorType>(T)) {
    for (unsigned I = 0; I < VT->getNumElements(); ++I)
      H = hashValue(B, H, B.CreateExtractElement(V, I));
    return H;
  }
  unsigned N = isa<ArrayType>(T) ? T->getArrayNumElements()
                                 : T->getStructNumElements();
  for (unsigned I = 0; I < N; ++I)
    H = hashValue(B, H, B.CreateExtractValue(V, I));
  return H;
}

static const char *Runtime = R"IR(
module asm ".text"
module asm ".globl _start"
module asm "_start:"
module asm "  mv a0, sp"
module asm "  call __llvm_fuzz_main"

@__arena = global [@AB@ x i8] zeroinitializer, align 64

define internal iXL @__sys(iXL %n, iXL %a, iXL %b, iXL %c) noinline {
  %r = call iXL asm sideeffect "ecall", "={x10},{x17},0,{x11},{x12},~{memory}"(iXL %n, iXL %a, iXL %b, iXL %c)
  ret iXL %r
}

; Zero the stack the callee will use and refill the arena, so that every call
; starts from the same memory state in every binary.
define internal void @__prep(iXL %i) noinline {
entry:
  %sp = call ptr asm sideeffect "mv $0, sp", "=r"()
  %lo = getelementptr i8, ptr %sp, iXL -8192
  %end = getelementptr i8, ptr %sp, iXL -64
  br label %zloop
zloop:
  %p = phi ptr [ %lo, %entry ], [ %pn, %zloop ]
  store iXL 0, ptr %p
  %pn = getelementptr iXL, ptr %p, iXL 1
  %zc = icmp ult ptr %pn, %end
  br i1 %zc, label %zloop, label %floop
floop:
  %k = phi iXL [ 0, %zloop ], [ %kn, %floop ]
  %a = shl iXL %k, 9
  %b = shl iXL %i, 3
  %c = xor iXL %a, %b
  %d = add iXL %c, %k
  %q = getelementptr iXL, ptr @__arena, iXL %k
  store iXL %d, ptr %q
  %kn = add iXL %k, 1
  %fc = icmp ult iXL %kn, @AW@
  br i1 %fc, label %floop, label %done
done:
  ret void
}

define internal i64 @__hash_arena(i64 %h0) noinline {
entry:
  br label %loop
loop:
  %k = phi iXL [ 0, %entry ], [ %kn, %loop ]
  %h = phi i64 [ %h0, %entry ], [ %h4, %loop ]
  %q = getelementptr iXL, ptr @__arena, iXL %k
  %v = load iXL, ptr %q
  @ZEXT64@
  %h1 = xor i64 %h, %w
  %s1 = shl i64 %h1, 13
  %h2 = xor i64 %h1, %s1
  %s2 = lshr i64 %h2, 7
  %h3 = xor i64 %h2, %s2
  %s3 = shl i64 %h3, 17
  %h4 = xor i64 %h3, %s3
  %kn = add iXL %k, 1
  %c = icmp ult iXL %kn, @AW@
  br i1 %c, label %loop, label %done
done:
  ret i64 %h4
}

define void @__llvm_fuzz_main(ptr %sp) noreturn {
entry:
  %buf = alloca i64, align 8
  %argc = load iXL, ptr %sp
  %has = icmp ugt iXL %argc, 1
  br i1 %has, label %parse0, label %go
parse0:
  %a1p = getelementptr iXL, ptr %sp, iXL 2
  %a1 = load ptr, ptr %a1p
  br label %parse
parse:
  %s = phi ptr [ %a1, %parse0 ], [ %sn, %pbody ]
  %acc = phi iXL [ 0, %parse0 ], [ %accn, %pbody ]
  %ch = load i8, ptr %s
  %isd = icmp ne i8 %ch, 0
  br i1 %isd, label %pbody, label %go
pbody:
  %chx = zext i8 %ch to iXL
  %dg = sub iXL %chx, 48
  %a8 = shl iXL %acc, 3
  %a2 = shl iXL %acc, 1
  %a10 = add iXL %a8, %a2
  %accn = add iXL %a10, %dg
  %sn = getelementptr i8, ptr %s, iXL 1
  br label %parse
go:
  %start = phi iXL [ 0, %entry ], [ %acc, %parse ]
  br label %tloop
tloop:
  %t = phi iXL [ %start, %go ], [ %tn, %tnext ]
  %tc = icmp ult iXL %t, @NT@
  br i1 %tc, label %tbody, label %exit
tbody:
  %fp = getelementptr ptr, ptr @__tests, iXL %t
  %f = load ptr, ptr %fp
  br label %iloop
iloop:
  %i = phi iXL [ 0, %tbody ], [ %in, %iloop ]
  call void @__prep(iXL %i)
  %h = call i64 %f(iXL %i)
  store i64 %h, ptr %buf
  %bi = ptrtoint ptr %buf to iXL
  %w = call iXL @__sys(iXL 64, iXL 1, iXL %bi, iXL 8)
  %in = add iXL %i, 1
  %ic = icmp ult iXL %in, @NI@
  br i1 %ic, label %iloop, label %tnext
tnext:
  %tn = add iXL %t, 1
  br label %tloop
exit:
  %e = call iXL @__sys(iXL 93, iXL 0, iXL 0, iXL 0)
  unreachable
}
)IR";

static void replaceAll(std::string &S, StringRef From, StringRef To) {
  for (size_t P = S.find(From); P != std::string::npos;
       P = S.find(From, P + To.size()))
    S.replace(P, From.size(), To.str());
}

static bool printHarness(Module &M, raw_ostream &OS) {
  LLVMContext &C = M.getContext();
  Module H("harness", C);
  H.setTargetTriple(M.getTargetTriple());
  Type *IXL = Type::getIntNTy(C, XLen);
  Type *I64 = Type::getInt64Ty(C);

  std::vector<Function *> Tests;
  for (Function &F : M) {
    if (F.isDeclaration() || F.isVarArg() || F.isIntrinsic())
      continue;
    if (!Funcs.empty() && !is_contained(Funcs, F.getName()))
      continue;
    bool OK = eligibleType(F.getReturnType(), true);
    for (unsigned I = 0; I < F.arg_size(); ++I)
      OK &= eligibleType(F.getArg(I)->getType(), false) &&
            !F.hasParamAttribute(I, Attribute::InAlloca) &&
            !F.hasParamAttribute(I, Attribute::Preallocated) &&
            !F.hasParamAttribute(I, Attribute::SwiftError);
    if (OK)
      Tests.push_back(&F);
  }
  if (Tests.empty())
    return false;

  std::string RT = Runtime;
  // "zext i64 to i64" is not a valid cast, so the widening is spelled out
  // separately for each XLen.
  replaceAll(RT, "@ZEXT64@",
             XLen == 32 ? "%w = zext i32 %v to i64" : "%w = add i64 %v, 0");
  replaceAll(RT, "iXL", XLen == 32 ? "i32" : "i64");
  replaceAll(RT, "@AB@", std::to_string(ArenaBytes));
  replaceAll(RT, "@AW@", std::to_string(ArenaBytes / (XLen / 8)));
  replaceAll(RT, "@NT@", std::to_string(Tests.size()));
  replaceAll(RT, "@NI@", std::to_string(NumInputs));
  // @__tests is referenced by the runtime, so it must exist before parsing.
  auto *TestsTy = ArrayType::get(PointerType::getUnqual(C), Tests.size());
  auto *TestsGV = new GlobalVariable(H, TestsTy, true,
                                     GlobalValue::InternalLinkage, nullptr,
                                     "__tests");
  SMDiagnostic Err;
  if (parseAssemblyInto(MemoryBufferRef(RT, "runtime"), &H, nullptr, Err)) {
    Err.print("ir-mutate harness runtime", errs());
    return false;
  }
  GlobalVariable *Arena = H.getGlobalVariable("__arena");
  // Its own section so the linker can pin it: pointer arguments are hashed,
  // so the arena must sit at the same address in every build being compared.
  Arena->setSection(".arena");

  // Stubs for everything the module expects from elsewhere.
  for (GlobalVariable &G : M.globals())
    if (G.isDeclaration() && G.getValueType()->isSized() &&
        !H.getNamedValue(G.getName()))
      new GlobalVariable(H, G.getValueType(), false,
                         GlobalValue::ExternalLinkage,
                         Constant::getNullValue(G.getValueType()), G.getName(),
                         nullptr, G.getThreadLocalMode(),
                         G.getAddressSpace());
  for (Function &F : M) {
    if (!F.isDeclaration() || F.isIntrinsic() || H.getNamedValue(F.getName()))
      continue;
    StringRef N = F.getName();
    if (N == "memcpy" || N == "memset" || N == "memmove")
      continue; // see below
    Function *S = Function::Create(F.getFunctionType(),
                                   GlobalValue::ExternalLinkage, N, H);
    S->setCallingConv(F.getCallingConv());
    IRBuilder<> B(BasicBlock::Create(C, "", S));
    if (S->getReturnType()->isVoidTy())
      B.CreateRetVoid();
    else
      B.CreateRet(Constant::getNullValue(S->getReturnType()));
  }
  // Byte loops for the libc calls llc emits for memory intrinsics.
  for (StringRef N : {"memcpy", "memmove", "memset"}) {
    if (M.getFunction(N) && !M.getFunction(N)->isDeclaration())
      continue;
    Type *P = PointerType::getUnqual(C);
    Type *Arg1 = N == "memset" ? Type::getInt32Ty(C) : P;
    Function *F = Function::Create(FunctionType::get(P, {P, Arg1, IXL}, false),
                                   GlobalValue::ExternalLinkage, N, H);
    F->addFnAttr(Attribute::NoBuiltin);
    BasicBlock *Entry = BasicBlock::Create(C, "", F);
    BasicBlock *Loop = BasicBlock::Create(C, "", F);
    BasicBlock *Done = BasicBlock::Create(C, "", F);
    Value *Dst = F->getArg(0), *Src = F->getArg(1), *Len = F->getArg(2);
    IRBuilder<> B(Entry);
    B.CreateCondBr(B.CreateICmpEQ(Len, ConstantInt::get(IXL, 0)), Done, Loop);
    B.SetInsertPoint(Loop);
    PHINode *K = B.CreatePHI(IXL, 2);
    K->addIncoming(ConstantInt::get(IXL, 0), Entry);
    // memmove copies backwards when the destination is above the source.
    Value *Idx = K;
    if (N == "memmove")
      Idx = B.CreateSelect(B.CreateICmpUGT(Dst, Src),
                           B.CreateSub(B.CreateSub(Len, K),
                                       ConstantInt::get(IXL, 1)),
                           K);
    Value *Byte = N == "memset" ? B.CreateTrunc(Src, B.getInt8Ty())
                                : B.CreateLoad(B.getInt8Ty(),
                                               B.CreateGEP(B.getInt8Ty(), Src,
                                                           Idx));
    B.CreateStore(Byte, B.CreateGEP(B.getInt8Ty(), Dst, Idx));
    Value *KN = B.CreateAdd(K, ConstantInt::get(IXL, 1));
    K->addIncoming(KN, Loop);
    B.CreateCondBr(B.CreateICmpULT(KN, Len), Loop, Done);
    B.SetInsertPoint(Done);
    B.CreateRet(Dst);
  }

  Gen G{std::mt19937_64((uint64_t)(uint32_t)Seed), Arena, IXL};
  SmallVector<Constant *> Wrappers;
  std::string Comments;
  raw_string_ostream CS(Comments);
  for (unsigned T = 0; T < Tests.size(); ++T) {
    Function *F = Tests[T];
    CS << "; test " << T << " " << F->getName() << "\n";
    Function *D = Function::Create(F->getFunctionType(),
                                   GlobalValue::ExternalLinkage, F->getName(),
                                   H);
    D->setCallingConv(F->getCallingConv());
    AttributeList Attrs = F->getAttributes();
    SmallVector<AttributeSet> Params;
    for (unsigned I = 0; I < F->arg_size(); ++I)
      Params.push_back(Attrs.getParamAttrs(I));
    AttributeList CallAttrs =
        AttributeList::get(C, AttributeSet(), Attrs.getRetAttrs(), Params);
    D->setAttributes(CallAttrs);

    // One constant table per non-pointer parameter: [NumInputs x Ty].
    std::vector<GlobalVariable *> Tables;
    std::vector<std::vector<Constant *>> Vals(F->arg_size());
    for (unsigned J = 0; J < F->arg_size(); ++J) {
      Type *PT = F->getArg(J)->getType();
      for (unsigned I = 0; I < NumInputs; ++I)
        Vals[J].push_back(G.random(PT, J));
      if (PT->isPointerTy()) {
        Tables.push_back(nullptr);
        continue;
      }
      auto *AT = ArrayType::get(PT, NumInputs);
      Tables.push_back(new GlobalVariable(H, AT, true,
                                          GlobalValue::InternalLinkage,
                                          ConstantArray::get(AT, Vals[J]),
                                          "__in." + Twine(T) + "." + Twine(J)));
    }
    if (Describe >= 0 && (unsigned)Describe < NumInputs) {
      CS << "; input " << T << ":";
      for (unsigned J = 0; J < F->arg_size(); ++J) {
        CS << (J ? ", " : " ");
        if (F->getArg(J)->getType()->isPointerTy())
          CS << "ptr arena+" << 2048 + 512 * (J % 8);
        else
          Vals[J][Describe]->print(CS);
      }
      CS << "\n";
    }

    Function *W = Function::Create(FunctionType::get(I64, {IXL}, false),
                                   GlobalValue::InternalLinkage,
                                   "__w." + Twine(T), H);
    W->addFnAttr(Attribute::NoInline);
    IRBuilder<> B(BasicBlock::Create(C, "", W));
    SmallVector<Value *> Args;
    for (unsigned J = 0; J < F->arg_size(); ++J) {
      Type *PT = F->getArg(J)->getType();
      if (!Tables[J]) {
        Args.push_back(G.arenaPtr(PT, J));
        continue;
      }
      Value *P = B.CreateInBoundsGEP(Tables[J]->getValueType(), Tables[J],
                                     {ConstantInt::get(IXL, 0), W->getArg(0)});
      Args.push_back(B.CreateLoad(PT, P));
    }
    CallInst *CI = B.CreateCall(D, Args);
    CI->setCallingConv(F->getCallingConv());
    CI->setAttributes(CallAttrs);
    Value *Hash = B.getInt64(0xcbf29ce484222325ULL);
    if (!F->getReturnType()->isVoidTy())
      Hash = hashValue(B, Hash, CI);
    B.CreateRet(B.CreateCall(H.getFunction("__hash_arena"), {Hash}));
    Wrappers.push_back(W);
  }
  TestsGV->setInitializer(ConstantArray::get(TestsTy, Wrappers));

  if (verifyModule(H, &errs()))
    return false;
  OS << Comments;
  H.print(OS, nullptr);
  return true;
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

  if (Sanitize) {
    sanitizeModule(*M);
    if (verifyModule(*M, &errs()))
      return 2;
    M->print(outs(), nullptr);
    return 0;
  }
  if (Harness)
    return printHarness(*M, outs()) ? 0 : 3;

  DenseMap<const Function *, stable_hash> Before;
  for (const Function &F : *M)
    if (!F.isDeclaration())
      Before[&F] = StructuralHash(F, /*DetailedHash=*/true);

  auto Mut = createMutator();
  for (unsigned I = 0; I < NumMutations; ++I)
    // Unsigned arithmetic: same values as before for small seeds, no signed
    // overflow for the large rotating seeds of the explore campaign.
    Mut->mutateModule(*M, (int)((unsigned)Seed * 7919u + I), MaxSize);

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
