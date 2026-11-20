; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+d,+zvfh -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global half 4.200000e+01
@G.2 = global i32 0
@G.3 = global i1 false

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oeq_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oeq_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oeq_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ogt_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ogt_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ogt_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oge_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oge_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oge_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_olt_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_olt_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_olt_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ole_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ole_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ole_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_one_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_one_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_one_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ord_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ord_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ord_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ueq_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ueq_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ueq_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ugt_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ugt_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ugt_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uge_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uge_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uge_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ult_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ult_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ult_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ule_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ule_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ule_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_une_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_une_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_une_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uno_vv_v1f16(<1 x half>, <1 x half>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uno_vf_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uno_fv_v1f16(<1 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oeq_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oeq_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oeq_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ogt_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ogt_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ogt_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oge_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oge_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oge_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_olt_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_olt_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_olt_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ole_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ole_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ole_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_one_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_one_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_one_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ord_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ord_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ord_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ueq_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ueq_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ueq_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ugt_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
define <2 x i1> @fcmps_ugt_vf_v2f16(<2 x half> %va, half %b) #0 {
  %head = insertelement <2 x half> poison, half %b, i32 0
  %splat = shufflevector <2 x half> %head, <2 x half> poison, <2 x i32> zeroinitializer
  %C = fcmp false <2 x half> %va, %head
  %1 = call <2 x i1> @llvm.experimental.constrained.fcmps.v2f16(<2 x half> %va, <2 x half> %splat, metadata !"ugt", metadata !"fpexcept.strict") #2
  ret <2 x i1> %C
}

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ugt_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uge_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uge_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uge_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ult_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ult_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ult_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ule_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ule_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ule_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_une_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_une_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_une_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uno_vv_v2f16(<2 x half>, <2 x half>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uno_vf_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uno_fv_v2f16(<2 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oeq_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oeq_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oeq_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ogt_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ogt_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ogt_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oge_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oge_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oge_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_olt_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_olt_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_olt_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ole_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ole_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ole_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_one_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_one_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_one_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ord_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ord_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ord_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ueq_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ueq_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ueq_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ugt_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ugt_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ugt_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uge_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uge_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uge_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ult_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ult_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ult_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ule_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ule_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ule_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_une_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_une_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_une_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uno_vv_v4f16(<4 x half>, <4 x half>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uno_vf_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uno_fv_v4f16(<4 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oeq_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oeq_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oeq_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ogt_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ogt_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ogt_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oge_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oge_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oge_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_olt_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_olt_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_olt_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ole_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ole_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ole_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_one_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_one_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_one_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ord_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ord_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ord_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ueq_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ueq_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ueq_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ugt_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ugt_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ugt_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uge_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uge_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uge_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ult_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ult_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ult_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ule_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ule_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ule_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_une_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_une_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_une_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uno_vv_v8f16(<8 x half>, <8 x half>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uno_vf_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uno_fv_v8f16(<8 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_oeq_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_oeq_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_oeq_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ogt_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ogt_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ogt_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_oge_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_oge_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_oge_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_olt_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_olt_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_olt_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ole_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ole_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ole_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_one_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_one_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_one_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ord_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ord_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ord_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ueq_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ueq_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ueq_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ugt_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ugt_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ugt_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_uge_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_uge_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_uge_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ult_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ult_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ult_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ule_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ule_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ule_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_une_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_une_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_une_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_uno_vv_v16f16(<16 x half>, <16 x half>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_uno_vf_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_uno_fv_v16f16(<16 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_oeq_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_oeq_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_oeq_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ogt_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ogt_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ogt_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_oge_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_oge_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_oge_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_olt_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_olt_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_olt_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ole_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ole_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ole_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_one_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
define <32 x i1> @fcmps_one_vf_v32f16(<32 x half> %va, half %b) #0 {
  %LGV = load half, ptr @G.1, align 2
  %C = fcmp uge half %b, %LGV
  %head = insertelement <32 x half> poison, half %b, i32 0
  %splat = shufflevector <32 x half> %head, <32 x half> poison, <32 x i32> zeroinitializer
  %1 = call <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(<32 x half> %va, <32 x half> %splat, metadata !"one", metadata !"fpexcept.strict") #2
  store i1 %C, ptr poison, align 1
  ret <32 x i1> %1
}

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_one_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ord_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ord_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ord_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ueq_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ueq_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ueq_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ugt_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ugt_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ugt_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_uge_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_uge_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_uge_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ult_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ult_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ult_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ule_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ule_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_ule_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_une_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_une_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_une_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_uno_vv_v32f16(<32 x half>, <32 x half>) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_uno_vf_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <32 x i1> @fcmps_uno_fv_v32f16(<32 x half>, half) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oeq_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oeq_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oeq_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ogt_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ogt_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ogt_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oge_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oge_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oge_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_olt_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_olt_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_olt_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ole_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ole_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ole_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_one_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_one_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_one_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ord_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ord_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ord_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ueq_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ueq_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ueq_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ugt_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ugt_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ugt_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uge_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uge_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uge_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ult_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ult_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ult_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ule_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ule_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ule_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_une_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_une_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_une_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uno_vv_v1f32(<1 x float>, <1 x float>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uno_vf_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uno_fv_v1f32(<1 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oeq_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oeq_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oeq_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ogt_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ogt_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ogt_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oge_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oge_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oge_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_olt_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_olt_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_olt_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ole_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ole_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ole_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_one_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_one_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_one_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ord_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ord_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ord_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ueq_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ueq_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ueq_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ugt_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ugt_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ugt_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uge_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uge_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uge_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ult_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ult_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ult_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ule_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ule_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ule_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_une_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_une_vf_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_une_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uno_vv_v2f32(<2 x float>, <2 x float>) #0

; Function Attrs: nounwind strictfp
define <2 x i1> @fcmps_uno_vf_v2f32(<2 x float> %va, float %b) #0 {
  %LGV = load i1, ptr @G, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F
  %head = insertelement <2 x float> poison, float %b, i32 0
  %splat = shufflevector <2 x float> %head, <2 x float> poison, <2 x i32> zeroinitializer
  %1 = call <2 x i1> @llvm.experimental.constrained.fcmps.v2f32(<2 x float> %va, <2 x float> %splat, metadata !"uno", metadata !"fpexcept.strict") #2
  ret <2 x i1> %1

T:                                                ; preds = %0
  ret <2 x i1> zeroinitializer

F:                                                ; preds = %0
  br label %BB
}

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uno_fv_v2f32(<2 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oeq_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oeq_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oeq_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ogt_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ogt_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ogt_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oge_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oge_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oge_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_olt_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_olt_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_olt_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ole_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ole_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ole_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_one_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_one_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_one_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ord_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ord_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ord_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ueq_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ueq_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ueq_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ugt_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ugt_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ugt_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uge_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uge_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uge_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ult_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ult_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ult_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ule_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ule_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ule_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_une_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_une_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_une_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uno_vv_v4f32(<4 x float>, <4 x float>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uno_vf_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uno_fv_v4f32(<4 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oeq_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
define <8 x i1> @fcmps_oeq_vf_v8f32(<8 x float> %va, float %b) #0 {
  %A2 = alloca i1, align 1
  store i1 true, ptr %A2, align 1
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %head = insertelement <8 x float> poison, float %b, i32 0
  %splat = shufflevector <8 x float> %head, <8 x float> poison, <8 x i32> zeroinitializer
  %1 = call <8 x i1> @llvm.experimental.constrained.fcmps.v8f32(<8 x float> %va, <8 x float> %splat, metadata !"oeq", metadata !"fpexcept.strict") #2
  %L = load i1, ptr %A, align 1
  switch i1 %L, label %SW_D [
    i1 false, label %SW_C
    i1 true, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_C, %SW_D
  ret <8 x i1> %1

SW_D:                                             ; preds = %SW_D, %0
  br i1 %L, label %BB, label %SW_D

SW_C:                                             ; preds = %SW_C, %0
  %L3 = load i1, ptr %A2, align 1
  br i1 %L3, label %BB, label %SW_C

SW_C1:                                            ; preds = %0
  br label %BB
}

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oeq_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ogt_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ogt_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ogt_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oge_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oge_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oge_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_olt_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_olt_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_olt_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ole_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ole_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ole_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_one_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_one_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_one_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ord_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ord_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ord_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ueq_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ueq_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ueq_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ugt_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ugt_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ugt_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uge_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uge_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uge_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ult_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ult_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ult_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ule_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ule_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ule_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_une_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_une_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_une_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uno_vv_v8f32(<8 x float>, <8 x float>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uno_vf_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uno_fv_v8f32(<8 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_oeq_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_oeq_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_oeq_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ogt_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ogt_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ogt_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_oge_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_oge_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_oge_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_olt_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_olt_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_olt_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ole_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ole_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ole_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_one_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_one_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_one_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ord_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ord_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ord_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ueq_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ueq_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ueq_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ugt_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ugt_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ugt_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_uge_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_uge_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_uge_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ult_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ult_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ult_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ule_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ule_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_ule_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_une_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_une_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_une_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_uno_vv_v16f32(<16 x float>, <16 x float>) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_uno_vf_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <16 x i1> @fcmps_uno_fv_v16f32(<16 x float>, float) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oeq_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oeq_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oeq_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ogt_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ogt_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ogt_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oge_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oge_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_oge_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_olt_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_olt_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_olt_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ole_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ole_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ole_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_one_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_one_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_one_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ord_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ord_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ord_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ueq_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ueq_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ueq_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ugt_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ugt_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ugt_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uge_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uge_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
define <1 x i1> @fcmps_uge_fv_v1f64(<1 x double> %va, double %b) #0 {
  %LGV = load i32, ptr @G.2, align 4
  %C = icmp sge i32 2147483647, %LGV
  %head = insertelement <1 x double> poison, double %b, i32 0
  %splat = shufflevector <1 x double> %head, <1 x double> poison, <1 x i32> zeroinitializer
  %1 = call <1 x i1> @llvm.experimental.constrained.fcmps.v1f64(<1 x double> %splat, <1 x double> %va, metadata !"uge", metadata !"fpexcept.strict") #2
  store i1 %C, ptr @G.3, align 1
  ret <1 x i1> %1
}

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ult_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ult_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ult_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ule_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ule_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_ule_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_une_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_une_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_une_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uno_vv_v1f64(<1 x double>, <1 x double>) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uno_vf_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <1 x i1> @fcmps_uno_fv_v1f64(<1 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oeq_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oeq_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oeq_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ogt_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ogt_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ogt_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oge_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oge_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_oge_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_olt_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_olt_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_olt_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ole_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ole_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ole_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_one_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_one_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_one_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ord_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ord_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ord_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ueq_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ueq_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
define <2 x i1> @fcmps_ueq_fv_v2f64(<2 x double> %va, double %b) #0 {
  %head = insertelement <2 x double> poison, double %b, i32 0
  %C = fcmp ule <2 x double> %va, %head
  %splat = shufflevector <2 x double> %head, <2 x double> poison, <2 x i32> zeroinitializer
  %1 = call <2 x i1> @llvm.experimental.constrained.fcmps.v2f64(<2 x double> %splat, <2 x double> %va, metadata !"ueq", metadata !"fpexcept.strict") #2
  ret <2 x i1> %C
}

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ugt_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ugt_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ugt_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uge_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uge_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uge_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ult_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ult_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ult_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ule_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ule_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_ule_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_une_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_une_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_une_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uno_vv_v2f64(<2 x double>, <2 x double>) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uno_vf_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <2 x i1> @fcmps_uno_fv_v2f64(<2 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oeq_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oeq_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oeq_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ogt_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ogt_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ogt_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oge_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oge_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_oge_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_olt_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_olt_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_olt_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ole_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ole_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ole_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_one_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_one_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_one_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ord_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ord_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ord_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ueq_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ueq_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ueq_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ugt_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ugt_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ugt_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uge_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uge_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uge_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ult_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ult_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ult_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ule_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ule_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_ule_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_une_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_une_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_une_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uno_vv_v4f64(<4 x double>, <4 x double>) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uno_vf_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <4 x i1> @fcmps_uno_fv_v4f64(<4 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oeq_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oeq_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oeq_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ogt_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ogt_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ogt_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oge_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oge_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_oge_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_olt_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_olt_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_olt_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ole_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ole_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ole_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_one_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_one_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_one_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ord_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ord_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ord_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ueq_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ueq_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ueq_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ugt_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ugt_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ugt_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uge_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uge_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uge_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ult_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ult_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ult_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ule_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ule_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_ule_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_une_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_une_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_une_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uno_vv_v8f64(<8 x double>, <8 x double>) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uno_vf_v8f64(<8 x double>, double) #0

; Function Attrs: nounwind strictfp
declare <8 x i1> @fcmps_uno_fv_v8f64(<8 x double>, double) #0

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x i1> @llvm.experimental.constrained.fcmps.v16f16(<16 x half>, <16 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <16 x i1> @llvm.experimental.constrained.fcmps.v16f32(<16 x float>, <16 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x i1> @llvm.experimental.constrained.fcmps.v1f16(<1 x half>, <1 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x i1> @llvm.experimental.constrained.fcmps.v1f32(<1 x float>, <1 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <1 x i1> @llvm.experimental.constrained.fcmps.v1f64(<1 x double>, <1 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x i1> @llvm.experimental.constrained.fcmps.v2f16(<2 x half>, <2 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x i1> @llvm.experimental.constrained.fcmps.v2f32(<2 x float>, <2 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <2 x i1> @llvm.experimental.constrained.fcmps.v2f64(<2 x double>, <2 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <32 x i1> @llvm.experimental.constrained.fcmps.v32f16(<32 x half>, <32 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x i1> @llvm.experimental.constrained.fcmps.v4f16(<4 x half>, <4 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x i1> @llvm.experimental.constrained.fcmps.v4f32(<4 x float>, <4 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <4 x i1> @llvm.experimental.constrained.fcmps.v4f64(<4 x double>, <4 x double>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x i1> @llvm.experimental.constrained.fcmps.v8f16(<8 x half>, <8 x half>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x i1> @llvm.experimental.constrained.fcmps.v8f32(<8 x float>, <8 x float>, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite)
declare <8 x i1> @llvm.experimental.constrained.fcmps.v8f64(<8 x double>, <8 x double>, metadata, metadata) #1

attributes #0 = { nounwind strictfp }
attributes #1 = { nocallback nofree nosync nounwind strictfp willreturn memory(inaccessiblemem: readwrite) }
attributes #2 = { strictfp }
