; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+f,+zicond,+zvfh,+a -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i1 true

declare <vscale x 8 x i7> @vminu_vx_nxv8i7(<vscale x 8 x i7>, i7 signext, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 1 x i8> @vminu_vv_nxv1i8(<vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i8> @vminu_vv_nxv1i8_unmasked(<vscale x 1 x i8>, <vscale x 1 x i8>, i32 zeroext)

declare <vscale x 1 x i8> @vminu_vx_nxv1i8(<vscale x 1 x i8>, i8, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i8> @vminu_vx_nxv1i8_commute(<vscale x 1 x i8>, i8, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i8> @vminu_vx_nxv1i8_unmasked(<vscale x 1 x i8>, i8, i32 zeroext)

declare <vscale x 2 x i8> @vminu_vv_nxv2i8(<vscale x 2 x i8>, <vscale x 2 x i8>, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i8> @vminu_vv_nxv2i8_unmasked(<vscale x 2 x i8>, <vscale x 2 x i8>, i32 zeroext)

declare <vscale x 2 x i8> @vminu_vx_nxv2i8(<vscale x 2 x i8>, i8, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i8> @vminu_vx_nxv2i8_unmasked(<vscale x 2 x i8>, i8, i32 zeroext)

declare <vscale x 3 x i8> @vminu_vv_nxv3i8(<vscale x 3 x i8>, <vscale x 3 x i8>, <vscale x 3 x i1>, i32 zeroext)

declare <vscale x 3 x i8> @vminu_vv_nxv3i8_unmasked(<vscale x 3 x i8>, <vscale x 3 x i8>, i32 zeroext)

declare <vscale x 3 x i8> @vminu_vx_nxv3i8(<vscale x 3 x i8>, i8, <vscale x 3 x i1>, i32 zeroext)

declare <vscale x 3 x i8> @vminu_vx_nxv3i8_unmasked(<vscale x 3 x i8>, i8, i32 zeroext)

declare <vscale x 4 x i8> @vminu_vv_nxv4i8(<vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i8> @vminu_vv_nxv4i8_unmasked(<vscale x 4 x i8>, <vscale x 4 x i8>, i32 zeroext)

declare <vscale x 4 x i8> @vminu_vx_nxv4i8(<vscale x 4 x i8>, i8, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i8> @vminu_vx_nxv4i8_unmasked(<vscale x 4 x i8>, i8, i32 zeroext)

declare <vscale x 8 x i8> @vminu_vv_nxv8i8(<vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i8> @vminu_vv_nxv8i8_unmasked(<vscale x 8 x i8>, <vscale x 8 x i8>, i32 zeroext)

declare <vscale x 8 x i8> @vminu_vx_nxv8i8(<vscale x 8 x i8>, i8, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i8> @vminu_vx_nxv8i8_unmasked(<vscale x 8 x i8>, i8, i32 zeroext)

declare <vscale x 16 x i8> @vminu_vv_nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i8> @vminu_vv_nxv16i8_unmasked(<vscale x 16 x i8>, <vscale x 16 x i8>, i32 zeroext)

declare <vscale x 16 x i8> @vminu_vx_nxv16i8(<vscale x 16 x i8>, i8, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i8> @vminu_vx_nxv16i8_unmasked(<vscale x 16 x i8>, i8, i32 zeroext)

declare <vscale x 32 x i8> @vminu_vv_nxv32i8(<vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i1>, i32 zeroext)

declare <vscale x 32 x i8> @vminu_vv_nxv32i8_unmasked(<vscale x 32 x i8>, <vscale x 32 x i8>, i32 zeroext)

declare <vscale x 32 x i8> @vminu_vx_nxv32i8(<vscale x 32 x i8>, i8, <vscale x 32 x i1>, i32 zeroext)

declare <vscale x 32 x i8> @vminu_vx_nxv32i8_unmasked(<vscale x 32 x i8>, i8, i32 zeroext)

declare <vscale x 64 x i8> @vminu_vv_nxv64i8(<vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 64 x i1>, i32 zeroext)

declare <vscale x 64 x i8> @vminu_vv_nxv64i8_unmasked(<vscale x 64 x i8>, <vscale x 64 x i8>, i32 zeroext)

declare <vscale x 64 x i8> @vminu_vx_nxv64i8(<vscale x 64 x i8>, i8, <vscale x 64 x i1>, i32 zeroext)

declare <vscale x 64 x i8> @vminu_vx_nxv64i8_unmasked(<vscale x 64 x i8>, i8, i32 zeroext)

declare <vscale x 128 x i8> @vminu_vx_nxv128i8(<vscale x 128 x i8>, i8, <vscale x 128 x i1>, i32 zeroext)

define <vscale x 128 x i8> @vminu_vx_nxv128i8_unmasked(<vscale x 128 x i8> %va, i8 %b, i32 zeroext %evl) {
  %elt.head = insertelement <vscale x 128 x i8> poison, i8 %b, i32 0
  %B1 = and <vscale x 128 x i8> %elt.head, %elt.head
  %B = and <vscale x 128 x i8> %elt.head, %B1
  ret <vscale x 128 x i8> %B
}

declare <vscale x 1 x i16> @vminu_vv_nxv1i16(<vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i16> @vminu_vv_nxv1i16_unmasked(<vscale x 1 x i16>, <vscale x 1 x i16>, i32 zeroext)

declare <vscale x 1 x i16> @vminu_vx_nxv1i16(<vscale x 1 x i16>, i16, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i16> @vminu_vx_nxv1i16_unmasked(<vscale x 1 x i16>, i16, i32 zeroext)

declare <vscale x 2 x i16> @vminu_vv_nxv2i16(<vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i16> @vminu_vv_nxv2i16_unmasked(<vscale x 2 x i16>, <vscale x 2 x i16>, i32 zeroext)

declare <vscale x 2 x i16> @vminu_vx_nxv2i16(<vscale x 2 x i16>, i16, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i16> @vminu_vx_nxv2i16_unmasked(<vscale x 2 x i16>, i16, i32 zeroext)

declare <vscale x 4 x i16> @vminu_vv_nxv4i16(<vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i16> @vminu_vv_nxv4i16_unmasked(<vscale x 4 x i16>, <vscale x 4 x i16>, i32 zeroext)

declare <vscale x 4 x i16> @vminu_vx_nxv4i16(<vscale x 4 x i16>, i16, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i16> @vminu_vx_nxv4i16_unmasked(<vscale x 4 x i16>, i16, i32 zeroext)

declare <vscale x 8 x i16> @vminu_vv_nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i16> @vminu_vv_nxv8i16_unmasked(<vscale x 8 x i16>, <vscale x 8 x i16>, i32 zeroext)

declare <vscale x 8 x i16> @vminu_vx_nxv8i16(<vscale x 8 x i16>, i16, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i16> @vminu_vx_nxv8i16_unmasked(<vscale x 8 x i16>, i16, i32 zeroext)

declare <vscale x 16 x i16> @vminu_vv_nxv16i16(<vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i16> @vminu_vv_nxv16i16_unmasked(<vscale x 16 x i16>, <vscale x 16 x i16>, i32 zeroext)

declare <vscale x 16 x i16> @vminu_vx_nxv16i16(<vscale x 16 x i16>, i16, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i16> @vminu_vx_nxv16i16_unmasked(<vscale x 16 x i16>, i16, i32 zeroext)

declare <vscale x 32 x i16> @vminu_vv_nxv32i16(<vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 32 x i1>, i32 zeroext)

declare <vscale x 32 x i16> @vminu_vv_nxv32i16_unmasked(<vscale x 32 x i16>, <vscale x 32 x i16>, i32 zeroext)

declare <vscale x 32 x i16> @vminu_vx_nxv32i16(<vscale x 32 x i16>, i16, <vscale x 32 x i1>, i32 zeroext)

declare <vscale x 32 x i16> @vminu_vx_nxv32i16_unmasked(<vscale x 32 x i16>, i16, i32 zeroext)

declare <vscale x 1 x i32> @vminu_vv_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i32> @vminu_vv_nxv1i32_unmasked(<vscale x 1 x i32>, <vscale x 1 x i32>, i32 zeroext)

declare <vscale x 1 x i32> @vminu_vx_nxv1i32(<vscale x 1 x i32>, i32, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i32> @vminu_vx_nxv1i32_unmasked(<vscale x 1 x i32>, i32, i32 zeroext)

declare <vscale x 2 x i32> @vminu_vv_nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i32> @vminu_vv_nxv2i32_unmasked(<vscale x 2 x i32>, <vscale x 2 x i32>, i32 zeroext)

declare <vscale x 2 x i32> @vminu_vx_nxv2i32(<vscale x 2 x i32>, i32, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i32> @vminu_vx_nxv2i32_unmasked(<vscale x 2 x i32>, i32, i32 zeroext)

declare <vscale x 4 x i32> @vminu_vv_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i32> @vminu_vv_nxv4i32_unmasked(<vscale x 4 x i32>, <vscale x 4 x i32>, i32 zeroext)

declare <vscale x 4 x i32> @vminu_vx_nxv4i32(<vscale x 4 x i32>, i32, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i32> @vminu_vx_nxv4i32_unmasked(<vscale x 4 x i32>, i32, i32 zeroext)

declare <vscale x 8 x i32> @vminu_vv_nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i32> @vminu_vv_nxv8i32_unmasked(<vscale x 8 x i32>, <vscale x 8 x i32>, i32 zeroext)

declare <vscale x 8 x i32> @vminu_vx_nxv8i32(<vscale x 8 x i32>, i32, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i32> @vminu_vx_nxv8i32_unmasked(<vscale x 8 x i32>, i32, i32 zeroext)

declare <vscale x 16 x i32> @vminu_vv_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i32> @vminu_vv_nxv16i32_unmasked(<vscale x 16 x i32>, <vscale x 16 x i32>, i32 zeroext)

declare <vscale x 16 x i32> @vminu_vx_nxv16i32(<vscale x 16 x i32>, i32, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i32> @vminu_vx_nxv16i32_unmasked(<vscale x 16 x i32>, i32, i32 zeroext)

declare <vscale x 32 x i32> @vminu_vx_nxv32i32(<vscale x 32 x i32>, i32, <vscale x 32 x i1>, i32 zeroext)

declare <vscale x 32 x i32> @vminu_vx_nxv32i32_unmasked(<vscale x 32 x i32>, i32, i32 zeroext)

declare <vscale x 32 x i32> @vminu_vx_nxv32i32_evl_nx8(<vscale x 32 x i32>, i32, <vscale x 32 x i1>)

; Function Attrs: vscale_range(2,1024)
declare <vscale x 32 x i32> @vminu_vx_nxv32i32_evl_nx16(<vscale x 32 x i32>, i32, <vscale x 32 x i1>) #0

declare <vscale x 1 x i64> @vminu_vv_nxv1i64(<vscale x 1 x i64>, <vscale x 1 x i64>, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i64> @vminu_vv_nxv1i64_unmasked(<vscale x 1 x i64>, <vscale x 1 x i64>, i32 zeroext)

define <vscale x 1 x i64> @vminu_vx_nxv1i64(<vscale x 1 x i64> %va, i64 %b, <vscale x 1 x i1> %m, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %elt.head = insertelement <vscale x 1 x i64> poison, i64 %b, i32 0
  %vb = shufflevector <vscale x 1 x i64> %elt.head, <vscale x 1 x i64> poison, <vscale x 1 x i32> zeroinitializer
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %BB1, %BB5
  %v = call <vscale x 1 x i64> @llvm.umin.nxv1i64(<vscale x 1 x i64> %va, <vscale x 1 x i64> %vb)
  ret <vscale x 1 x i64> %v

T:                                                ; preds = %T, %BB5, %0
  %LGV = load i1, ptr @G, align 1
  br i1 %LGV, label %T, label %BB5

BB5:                                              ; preds = %T
  br i1 %LGV, label %BB, label %T

F:                                                ; preds = %0
  %LGV4 = load i1, ptr @G.1, align 1
  br i1 %LGV4, label %T2, label %F3

BB1:                                              ; preds = %F3, %T2
  br label %BB

T2:                                               ; preds = %F
  br label %BB1

F3:                                               ; preds = %F
  br label %BB1
}

declare <vscale x 1 x i64> @vminu_vx_nxv1i64_unmasked(<vscale x 1 x i64>, i64, i32 zeroext)

declare <vscale x 2 x i64> @vminu_vv_nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i64> @vminu_vv_nxv2i64_unmasked(<vscale x 2 x i64>, <vscale x 2 x i64>, i32 zeroext)

declare <vscale x 2 x i64> @vminu_vx_nxv2i64(<vscale x 2 x i64>, i64, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i64> @vminu_vx_nxv2i64_unmasked(<vscale x 2 x i64>, i64, i32 zeroext)

declare <vscale x 4 x i64> @vminu_vv_nxv4i64(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i64> @vminu_vv_nxv4i64_unmasked(<vscale x 4 x i64>, <vscale x 4 x i64>, i32 zeroext)

declare <vscale x 4 x i64> @vminu_vx_nxv4i64(<vscale x 4 x i64>, i64, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i64> @vminu_vx_nxv4i64_unmasked(<vscale x 4 x i64>, i64, i32 zeroext)

declare <vscale x 8 x i64> @vminu_vv_nxv8i64(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i64> @vminu_vv_nxv8i64_unmasked(<vscale x 8 x i64>, <vscale x 8 x i64>, i32 zeroext)

declare <vscale x 8 x i64> @vminu_vx_nxv8i64(<vscale x 8 x i64>, i64, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i64> @vminu_vx_nxv8i64_unmasked(<vscale x 8 x i64>, i64, i32 zeroext)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 128 x i8> @llvm.umin.nxv128i8(<vscale x 128 x i8>, <vscale x 128 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i16> @llvm.umin.nxv16i16(<vscale x 16 x i16>, <vscale x 16 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i32> @llvm.umin.nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i8> @llvm.umin.nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x i16> @llvm.umin.nxv1i16(<vscale x 1 x i16>, <vscale x 1 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x i32> @llvm.umin.nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x i64> @llvm.umin.nxv1i64(<vscale x 1 x i64>, <vscale x 1 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x i8> @llvm.umin.nxv1i8(<vscale x 1 x i8>, <vscale x 1 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i16> @llvm.umin.nxv2i16(<vscale x 2 x i16>, <vscale x 2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i32> @llvm.umin.nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i64> @llvm.umin.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i8> @llvm.umin.nxv2i8(<vscale x 2 x i8>, <vscale x 2 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 32 x i16> @llvm.umin.nxv32i16(<vscale x 32 x i16>, <vscale x 32 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 32 x i32> @llvm.umin.nxv32i32(<vscale x 32 x i32>, <vscale x 32 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 32 x i8> @llvm.umin.nxv32i8(<vscale x 32 x i8>, <vscale x 32 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 3 x i8> @llvm.umin.nxv3i8(<vscale x 3 x i8>, <vscale x 3 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i16> @llvm.umin.nxv4i16(<vscale x 4 x i16>, <vscale x 4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i32> @llvm.umin.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i64> @llvm.umin.nxv4i64(<vscale x 4 x i64>, <vscale x 4 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i8> @llvm.umin.nxv4i8(<vscale x 4 x i8>, <vscale x 4 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 64 x i8> @llvm.umin.nxv64i8(<vscale x 64 x i8>, <vscale x 64 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i16> @llvm.umin.nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i32> @llvm.umin.nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i64> @llvm.umin.nxv8i64(<vscale x 8 x i64>, <vscale x 8 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i7> @llvm.umin.nxv8i7(<vscale x 8 x i7>, <vscale x 8 x i7>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i8> @llvm.umin.nxv8i8(<vscale x 8 x i8>, <vscale x 8 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vscale.i32() #2

attributes #0 = { vscale_range(2,1024) }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
