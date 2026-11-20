; isel-diff-config: -mtriple=riscv64 -target-abi=lp64d -verify-machineinstrs -mattr=+zvfh -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 0
@G.1 = global i1 false
@G.2 = global <2 x i64> splat (i64 -1)
@G.3 = global float 4.200000e+01
@G.4 = global float +qnan

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oeq_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oeq_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oeq_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ogt_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ogt_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ogt_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oge_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oge_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oge_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_olt_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_olt_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_olt_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ole_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ole_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ole_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_one_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_one_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_one_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ord_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ord_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ord_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
define <1 x i1> @fcmp_ueq_vv_v1f16(<1 x half> %va, <1 x half> %vb) #0 {
  %LGV = load <2 x i64>, ptr @G.2, align 16
  %1 = call <1 x i1> @llvm.experimental.constrained.fcmp.v1f16(<1 x half> %va, <1 x half> %vb, metadata !"ueq", metadata !"fpexcept.strict") #2
  %E = extractelement <2 x i64> %LGV, i8 -1
  store i64 %E, ptr poison, align 4
  ret <1 x i1> %1
}

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ueq_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ueq_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ugt_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ugt_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ugt_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uge_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uge_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uge_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ult_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ult_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ult_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ule_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ule_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ule_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_une_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_une_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_une_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uno_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uno_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uno_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oeq_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oeq_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oeq_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ogt_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ogt_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ogt_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oge_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oge_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oge_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_olt_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_olt_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
define <2 x i1> @fcmp_olt_fv_v2f16(<2 x half> %va, half %b) #0 {
  %LGV1 = load float, ptr @G.4, align 4
  %LGV = load float, ptr @G.3, align 4
  %head = insertelement <2 x half> poison, half %b, i32 0
  %splat = shufflevector <2 x half> %head, <2 x half> poison, <2 x i32> zeroinitializer
  %C = fcmp uge float %LGV, %LGV1
  %1 = call <2 x i1> @llvm.experimental.constrained.fcmp.v2f16(<2 x half> %splat, <2 x half> %va, metadata !"olt", metadata !"fpexcept.strict") #2
  store i1 %C, ptr poison, align 1
  ret <2 x i1> %1
}

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ole_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ole_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ole_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_one_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
define <2 x i1> @fcmp_one_vf_v2f16(<2 x half> %va, half %b) #0 {
  %LGV = load i32, ptr @G, align 4
  %head = insertelement <2 x half> poison, half %b, i32 0
  %splat = shufflevector <2 x half> %head, <2 x half> poison, <2 x i32> zeroinitializer
  %C = icmp ugt i32 %LGV, -2147483648
  %1 = call <2 x i1> @llvm.experimental.constrained.fcmp.v2f16(<2 x half> %va, <2 x half> %splat, metadata !"one", metadata !"fpexcept.strict") #2
  store i1 %C, ptr @G.1, align 1
  ret <2 x i1> %1
}

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_one_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ord_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ord_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ord_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ueq_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ueq_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ueq_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ugt_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ugt_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ugt_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uge_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uge_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uge_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ult_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ult_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ult_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ule_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ule_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ule_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_une_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_une_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_une_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uno_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uno_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uno_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oeq_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oeq_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oeq_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ogt_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ogt_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ogt_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oge_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oge_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oge_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_olt_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_olt_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_olt_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ole_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ole_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ole_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_one_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_one_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_one_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ord_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ord_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ord_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ueq_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ueq_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ueq_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ugt_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ugt_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ugt_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uge_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uge_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uge_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ult_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ult_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ult_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ule_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ule_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ule_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_une_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_une_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_une_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uno_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uno_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uno_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oeq_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oeq_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oeq_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ogt_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ogt_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ogt_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oge_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oge_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oge_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_olt_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_olt_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_olt_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ole_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ole_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ole_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_one_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_one_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_one_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ord_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ord_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ord_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ueq_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ueq_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ueq_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ugt_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ugt_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ugt_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uge_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uge_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uge_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ult_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ult_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ult_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ule_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ule_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ule_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_une_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_une_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_une_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uno_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uno_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uno_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_oeq_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_oeq_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_oeq_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ogt_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ogt_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ogt_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_oge_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_oge_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_oge_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_olt_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_olt_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_olt_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ole_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ole_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ole_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_one_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_one_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_one_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ord_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ord_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ord_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ueq_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ueq_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ueq_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ugt_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ugt_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ugt_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_uge_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_uge_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_uge_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ult_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ult_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ult_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ule_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ule_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ule_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_une_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_une_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_une_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_uno_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_uno_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_uno_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_oeq_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_oeq_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_oeq_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ogt_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ogt_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ogt_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_oge_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_oge_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_oge_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_olt_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_olt_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_olt_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ole_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ole_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ole_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_one_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_one_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_one_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ord_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ord_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ord_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ueq_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ueq_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ueq_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ugt_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ugt_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ugt_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_uge_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_uge_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_uge_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ult_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ult_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ult_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ule_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ule_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_ule_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_une_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_une_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_une_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_uno_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_uno_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmp_uno_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oeq_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oeq_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oeq_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ogt_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ogt_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ogt_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oge_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oge_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oge_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_olt_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_olt_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_olt_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ole_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ole_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ole_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_one_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_one_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_one_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ord_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ord_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ord_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ueq_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ueq_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ueq_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ugt_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ugt_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ugt_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uge_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uge_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uge_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ult_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ult_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ult_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ule_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ule_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ule_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_une_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_une_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_une_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uno_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uno_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uno_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oeq_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oeq_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oeq_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ogt_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ogt_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ogt_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oge_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oge_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oge_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_olt_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_olt_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_olt_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ole_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ole_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ole_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_one_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_one_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_one_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ord_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ord_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ord_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ueq_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ueq_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ueq_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ugt_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ugt_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ugt_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uge_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uge_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uge_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ult_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ult_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ult_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ule_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ule_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ule_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_une_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_une_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_une_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uno_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uno_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uno_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oeq_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oeq_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oeq_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ogt_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ogt_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ogt_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oge_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oge_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oge_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_olt_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_olt_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_olt_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ole_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ole_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ole_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_one_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_one_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_one_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ord_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ord_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ord_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ueq_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ueq_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ueq_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ugt_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ugt_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ugt_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uge_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uge_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uge_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ult_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ult_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ult_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ule_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ule_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ule_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_une_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_une_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_une_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uno_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uno_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uno_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oeq_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oeq_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oeq_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ogt_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ogt_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ogt_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oge_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oge_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oge_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_olt_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_olt_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_olt_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ole_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ole_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ole_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_one_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_one_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_one_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ord_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ord_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ord_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ueq_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ueq_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ueq_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ugt_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ugt_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ugt_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uge_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uge_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uge_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ult_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ult_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ult_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ule_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ule_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ule_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_une_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_une_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_une_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uno_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uno_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uno_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_oeq_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_oeq_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_oeq_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ogt_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ogt_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ogt_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_oge_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_oge_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_oge_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_olt_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_olt_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_olt_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ole_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ole_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ole_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_one_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_one_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_one_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ord_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ord_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ord_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ueq_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ueq_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ueq_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ugt_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ugt_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ugt_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_uge_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_uge_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_uge_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ult_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ult_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ult_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ule_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ule_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_ule_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_une_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_une_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_une_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_uno_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_uno_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmp_uno_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oeq_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oeq_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oeq_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ogt_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ogt_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ogt_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oge_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oge_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_oge_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_olt_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_olt_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_olt_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ole_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ole_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ole_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_one_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_one_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_one_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ord_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ord_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ord_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ueq_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ueq_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ueq_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ugt_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ugt_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ugt_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uge_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uge_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uge_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ult_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ult_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ult_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ule_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ule_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_ule_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_une_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_une_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_une_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uno_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uno_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmp_uno_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oeq_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oeq_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oeq_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ogt_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ogt_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ogt_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oge_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oge_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_oge_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_olt_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_olt_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_olt_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ole_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ole_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ole_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_one_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_one_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_one_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ord_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ord_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ord_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ueq_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ueq_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ueq_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ugt_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ugt_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ugt_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uge_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uge_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uge_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ult_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ult_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ult_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ule_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ule_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_ule_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_une_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_une_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_une_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uno_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uno_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmp_uno_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oeq_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oeq_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oeq_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ogt_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ogt_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ogt_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oge_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oge_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_oge_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_olt_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_olt_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_olt_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ole_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ole_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ole_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_one_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_one_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_one_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ord_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ord_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ord_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ueq_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ueq_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ueq_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ugt_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ugt_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ugt_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uge_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uge_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uge_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ult_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ult_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ult_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ule_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ule_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_ule_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_une_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_une_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_une_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uno_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uno_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmp_uno_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oeq_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oeq_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oeq_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ogt_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ogt_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ogt_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oge_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oge_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_oge_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_olt_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_olt_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_olt_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ole_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ole_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ole_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_one_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_one_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_one_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ord_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ord_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ord_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ueq_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ueq_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ueq_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ugt_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ugt_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ugt_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uge_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uge_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uge_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ult_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ult_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ult_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ule_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ule_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_ule_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_une_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_une_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_une_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uno_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uno_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmp_uno_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x i1> @llvm.experimental.constrained.fcmp.v16f16(<16 x half>, <16 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x i1> @llvm.experimental.constrained.fcmp.v16f32(<16 x float>, <16 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x i1> @llvm.experimental.constrained.fcmp.v1f16(<1 x half>, <1 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x i1> @llvm.experimental.constrained.fcmp.v1f32(<1 x float>, <1 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x i1> @llvm.experimental.constrained.fcmp.v1f64(<1 x double>, <1 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x i1> @llvm.experimental.constrained.fcmp.v2f16(<2 x half>, <2 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x i1> @llvm.experimental.constrained.fcmp.v2f32(<2 x float>, <2 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x i1> @llvm.experimental.constrained.fcmp.v2f64(<2 x double>, <2 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x i1> @llvm.experimental.constrained.fcmp.v32f16(<32 x half>, <32 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x i1> @llvm.experimental.constrained.fcmp.v4f16(<4 x half>, <4 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x i1> @llvm.experimental.constrained.fcmp.v4f32(<4 x float>, <4 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x i1> @llvm.experimental.constrained.fcmp.v4f64(<4 x double>, <4 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x i1> @llvm.experimental.constrained.fcmp.v8f16(<8 x half>, <8 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x i1> @llvm.experimental.constrained.fcmp.v8f32(<8 x float>, <8 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x i1> @llvm.experimental.constrained.fcmp.v8f64(<8 x double>, <8 x double>, metadata, metadata) #1

attributes #0 = { nounwind strictfp }
attributes #1 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { strictfp }
