; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global bfloat +qnan
@G.1 = global i1 true
@G.2 = global i16 32767
@G.3 = global <8 x i1> splat (i1 true)

declare <vscale x 8 x i7> @vmaxu_vx_nxv8i7(<vscale x 8 x i7>, i7 signext, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 1 x i8> @vmaxu_vv_nxv1i8(<vscale x 1 x i8>, <vscale x 1 x i8>, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i8> @vmaxu_vv_nxv1i8_unmasked(<vscale x 1 x i8>, <vscale x 1 x i8>, i32 zeroext)

declare <vscale x 1 x i8> @vmaxu_vx_nxv1i8(<vscale x 1 x i8>, i8, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i8> @vmaxu_vx_nxv1i8_commute(<vscale x 1 x i8>, i8, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i8> @vmaxu_vx_nxv1i8_unmasked(<vscale x 1 x i8>, i8, i32 zeroext)

define <vscale x 2 x i8> @vmaxu_vv_nxv2i8(<vscale x 2 x i8> %va, <vscale x 2 x i8> %b, <vscale x 2 x i1> %m, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %B = add i1 true, false
  %v = call <vscale x 2 x i8> @llvm.umax.nxv2i8(<vscale x 2 x i8> %va, <vscale x 2 x i8> %b)
  store i1 %B, ptr %A, align 1
  ret <vscale x 2 x i8> %v
}

declare <vscale x 2 x i8> @vmaxu_vv_nxv2i8_unmasked(<vscale x 2 x i8>, <vscale x 2 x i8>, i32 zeroext)

declare <vscale x 2 x i8> @vmaxu_vx_nxv2i8(<vscale x 2 x i8>, i8, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i8> @vmaxu_vx_nxv2i8_unmasked(<vscale x 2 x i8>, i8, i32 zeroext)

declare <vscale x 3 x i8> @vmaxu_vv_nxv3i8(<vscale x 3 x i8>, <vscale x 3 x i8>, <vscale x 3 x i1>, i32 zeroext)

declare <vscale x 3 x i8> @vmaxu_vv_nxv3i8_unmasked(<vscale x 3 x i8>, <vscale x 3 x i8>, i32 zeroext)

declare <vscale x 3 x i8> @vmaxu_vx_nxv3i8(<vscale x 3 x i8>, i8, <vscale x 3 x i1>, i32 zeroext)

declare <vscale x 3 x i8> @vmaxu_vx_nxv3i8_unmasked(<vscale x 3 x i8>, i8, i32 zeroext)

declare <vscale x 4 x i8> @vmaxu_vv_nxv4i8(<vscale x 4 x i8>, <vscale x 4 x i8>, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i8> @vmaxu_vv_nxv4i8_unmasked(<vscale x 4 x i8>, <vscale x 4 x i8>, i32 zeroext)

declare <vscale x 4 x i8> @vmaxu_vx_nxv4i8(<vscale x 4 x i8>, i8, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i8> @vmaxu_vx_nxv4i8_unmasked(<vscale x 4 x i8>, i8, i32 zeroext)

declare <vscale x 8 x i8> @vmaxu_vv_nxv8i8(<vscale x 8 x i8>, <vscale x 8 x i8>, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i8> @vmaxu_vv_nxv8i8_unmasked(<vscale x 8 x i8>, <vscale x 8 x i8>, i32 zeroext)

declare <vscale x 8 x i8> @vmaxu_vx_nxv8i8(<vscale x 8 x i8>, i8, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i8> @vmaxu_vx_nxv8i8_unmasked(<vscale x 8 x i8>, i8, i32 zeroext)

declare <vscale x 16 x i8> @vmaxu_vv_nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i8> @vmaxu_vv_nxv16i8_unmasked(<vscale x 16 x i8>, <vscale x 16 x i8>, i32 zeroext)

declare <vscale x 16 x i8> @vmaxu_vx_nxv16i8(<vscale x 16 x i8>, i8, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i8> @vmaxu_vx_nxv16i8_unmasked(<vscale x 16 x i8>, i8, i32 zeroext)

declare <vscale x 32 x i8> @vmaxu_vv_nxv32i8(<vscale x 32 x i8>, <vscale x 32 x i8>, <vscale x 32 x i1>, i32 zeroext)

declare <vscale x 32 x i8> @vmaxu_vv_nxv32i8_unmasked(<vscale x 32 x i8>, <vscale x 32 x i8>, i32 zeroext)

declare <vscale x 32 x i8> @vmaxu_vx_nxv32i8(<vscale x 32 x i8>, i8, <vscale x 32 x i1>, i32 zeroext)

declare <vscale x 32 x i8> @vmaxu_vx_nxv32i8_unmasked(<vscale x 32 x i8>, i8, i32 zeroext)

declare <vscale x 64 x i8> @vmaxu_vv_nxv64i8(<vscale x 64 x i8>, <vscale x 64 x i8>, <vscale x 64 x i1>, i32 zeroext)

define <vscale x 64 x i8> @vmaxu_vv_nxv64i8_unmasked(<vscale x 64 x i8> %va, <vscale x 64 x i8> %b, i32 zeroext %evl) {
  %v = call <vscale x 64 x i8> @llvm.umax.nxv64i8(<vscale x 64 x i8> %va, <vscale x 64 x i8> %b)
  %C = icmp uge <8 x i8> splat (i8 42), splat (i8 42)
  store <8 x i1> %C, ptr @G.3, align 1
  ret <vscale x 64 x i8> %v
}

declare <vscale x 64 x i8> @vmaxu_vx_nxv64i8(<vscale x 64 x i8>, i8, <vscale x 64 x i1>, i32 zeroext)

declare <vscale x 64 x i8> @vmaxu_vx_nxv64i8_unmasked(<vscale x 64 x i8>, i8, i32 zeroext)

declare <vscale x 128 x i8> @vmaxu_vx_nxv128i8(<vscale x 128 x i8>, i8, <vscale x 128 x i1>, i32 zeroext)

declare <vscale x 128 x i8> @vmaxu_vx_nxv128i8_unmasked(<vscale x 128 x i8>, i8, i32 zeroext)

declare <vscale x 1 x i16> @vmaxu_vv_nxv1i16(<vscale x 1 x i16>, <vscale x 1 x i16>, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i16> @vmaxu_vv_nxv1i16_unmasked(<vscale x 1 x i16>, <vscale x 1 x i16>, i32 zeroext)

declare <vscale x 1 x i16> @vmaxu_vx_nxv1i16(<vscale x 1 x i16>, i16, <vscale x 1 x i1>, i32 zeroext)

define <vscale x 1 x i16> @vmaxu_vx_nxv1i16_unmasked(<vscale x 1 x i16> %va, i16 %b, i32 zeroext %evl) {
  %LGV = load bfloat, ptr @G, align 2
  %elt.head = insertelement <vscale x 1 x i16> poison, i16 %b, i32 0
  %vb = shufflevector <vscale x 1 x i16> %elt.head, <vscale x 1 x i16> poison, <vscale x 1 x i32> zeroinitializer
  %C = fcmp oeq bfloat %LGV, 3.389530e+38
  %v = call <vscale x 1 x i16> @llvm.umax.nxv1i16(<vscale x 1 x i16> %va, <vscale x 1 x i16> %vb)
  store i1 %C, ptr @G.1, align 1
  ret <vscale x 1 x i16> %v
}

declare <vscale x 2 x i16> @vmaxu_vv_nxv2i16(<vscale x 2 x i16>, <vscale x 2 x i16>, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i16> @vmaxu_vv_nxv2i16_unmasked(<vscale x 2 x i16>, <vscale x 2 x i16>, i32 zeroext)

declare <vscale x 2 x i16> @vmaxu_vx_nxv2i16(<vscale x 2 x i16>, i16, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i16> @vmaxu_vx_nxv2i16_unmasked(<vscale x 2 x i16>, i16, i32 zeroext)

declare <vscale x 4 x i16> @vmaxu_vv_nxv4i16(<vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i16> @vmaxu_vv_nxv4i16_unmasked(<vscale x 4 x i16>, <vscale x 4 x i16>, i32 zeroext)

declare <vscale x 4 x i16> @vmaxu_vx_nxv4i16(<vscale x 4 x i16>, i16, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i16> @vmaxu_vx_nxv4i16_unmasked(<vscale x 4 x i16>, i16, i32 zeroext)

declare <vscale x 8 x i16> @vmaxu_vv_nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i16> @vmaxu_vv_nxv8i16_unmasked(<vscale x 8 x i16>, <vscale x 8 x i16>, i32 zeroext)

declare <vscale x 8 x i16> @vmaxu_vx_nxv8i16(<vscale x 8 x i16>, i16, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i16> @vmaxu_vx_nxv8i16_unmasked(<vscale x 8 x i16>, i16, i32 zeroext)

declare <vscale x 16 x i16> @vmaxu_vv_nxv16i16(<vscale x 16 x i16>, <vscale x 16 x i16>, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i16> @vmaxu_vv_nxv16i16_unmasked(<vscale x 16 x i16>, <vscale x 16 x i16>, i32 zeroext)

declare <vscale x 16 x i16> @vmaxu_vx_nxv16i16(<vscale x 16 x i16>, i16, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i16> @vmaxu_vx_nxv16i16_unmasked(<vscale x 16 x i16>, i16, i32 zeroext)

declare <vscale x 32 x i16> @vmaxu_vv_nxv32i16(<vscale x 32 x i16>, <vscale x 32 x i16>, <vscale x 32 x i1>, i32 zeroext)

declare <vscale x 32 x i16> @vmaxu_vv_nxv32i16_unmasked(<vscale x 32 x i16>, <vscale x 32 x i16>, i32 zeroext)

declare <vscale x 32 x i16> @vmaxu_vx_nxv32i16(<vscale x 32 x i16>, i16, <vscale x 32 x i1>, i32 zeroext)

declare <vscale x 32 x i16> @vmaxu_vx_nxv32i16_unmasked(<vscale x 32 x i16>, i16, i32 zeroext)

declare <vscale x 1 x i32> @vmaxu_vv_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i32> @vmaxu_vv_nxv1i32_unmasked(<vscale x 1 x i32>, <vscale x 1 x i32>, i32 zeroext)

declare <vscale x 1 x i32> @vmaxu_vx_nxv1i32(<vscale x 1 x i32>, i32, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i32> @vmaxu_vx_nxv1i32_unmasked(<vscale x 1 x i32>, i32, i32 zeroext)

declare <vscale x 2 x i32> @vmaxu_vv_nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i32> @vmaxu_vv_nxv2i32_unmasked(<vscale x 2 x i32>, <vscale x 2 x i32>, i32 zeroext)

declare <vscale x 2 x i32> @vmaxu_vx_nxv2i32(<vscale x 2 x i32>, i32, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i32> @vmaxu_vx_nxv2i32_unmasked(<vscale x 2 x i32>, i32, i32 zeroext)

declare <vscale x 4 x i32> @vmaxu_vv_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i32> @vmaxu_vv_nxv4i32_unmasked(<vscale x 4 x i32>, <vscale x 4 x i32>, i32 zeroext)

declare <vscale x 4 x i32> @vmaxu_vx_nxv4i32(<vscale x 4 x i32>, i32, <vscale x 4 x i1>, i32 zeroext)

define <vscale x 4 x i32> @vmaxu_vx_nxv4i32_unmasked(<vscale x 4 x i32> %va, i32 %b, i32 zeroext %evl) {
  %LGV = load i16, ptr @G.2, align 2
  %elt.head = insertelement <vscale x 4 x i32> poison, i32 %b, i32 0
  %B = udiv i16 %LGV, -1
  %vb = shufflevector <vscale x 4 x i32> %elt.head, <vscale x 4 x i32> poison, <vscale x 4 x i32> zeroinitializer
  %v = call <vscale x 4 x i32> @llvm.umax.nxv4i32(<vscale x 4 x i32> %va, <vscale x 4 x i32> %vb)
  store i16 %B, ptr poison, align 2
  ret <vscale x 4 x i32> %v
}

declare <vscale x 8 x i32> @vmaxu_vv_nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i32> @vmaxu_vv_nxv8i32_unmasked(<vscale x 8 x i32>, <vscale x 8 x i32>, i32 zeroext)

define <vscale x 8 x i32> @vmaxu_vx_nxv8i32(<vscale x 8 x i32> %va, i32 %b, <vscale x 8 x i1> %m, i32 zeroext %evl) {
  %elt.head = insertelement <vscale x 8 x i32> poison, i32 %b, i32 0
  %B = or <vscale x 8 x i32> %elt.head, %elt.head
  %v = call <vscale x 8 x i32> @llvm.umax.nxv8i32(<vscale x 8 x i32> %va, <vscale x 8 x i32> %B)
  ret <vscale x 8 x i32> %v
}

declare <vscale x 8 x i32> @vmaxu_vx_nxv8i32_unmasked(<vscale x 8 x i32>, i32, i32 zeroext)

declare <vscale x 16 x i32> @vmaxu_vv_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i32> @vmaxu_vv_nxv16i32_unmasked(<vscale x 16 x i32>, <vscale x 16 x i32>, i32 zeroext)

declare <vscale x 16 x i32> @vmaxu_vx_nxv16i32(<vscale x 16 x i32>, i32, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x i32> @vmaxu_vx_nxv16i32_unmasked(<vscale x 16 x i32>, i32, i32 zeroext)

declare <vscale x 32 x i32> @vmaxu_vx_nxv32i32(<vscale x 32 x i32>, i32, <vscale x 32 x i1>, i32 zeroext)

declare <vscale x 32 x i32> @vmaxu_vx_nxv32i32_unmasked(<vscale x 32 x i32>, i32, i32 zeroext)

declare <vscale x 32 x i32> @vmaxu_vx_nxv32i32_evl_nx8(<vscale x 32 x i32>, i32, <vscale x 32 x i1>)

; Function Attrs: vscale_range(2,1024)
define <vscale x 32 x i32> @vmaxu_vx_nxv32i32_evl_nx16(<vscale x 32 x i32> %va, i32 %b, <vscale x 32 x i1> %m) #0 {
  %elt.head = insertelement <vscale x 32 x i32> poison, i32 %b, i32 0
  %vb = shufflevector <vscale x 32 x i32> %elt.head, <vscale x 32 x i32> poison, <vscale x 32 x i32> zeroinitializer
  %B = sub <vscale x 32 x i32> %vb, zeroinitializer
  ret <vscale x 32 x i32> %B
}

declare <vscale x 1 x i64> @vmaxu_vv_nxv1i64(<vscale x 1 x i64>, <vscale x 1 x i64>, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i64> @vmaxu_vv_nxv1i64_unmasked(<vscale x 1 x i64>, <vscale x 1 x i64>, i32 zeroext)

declare <vscale x 1 x i64> @vmaxu_vx_nxv1i64(<vscale x 1 x i64>, i64, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i64> @vmaxu_vx_nxv1i64_unmasked(<vscale x 1 x i64>, i64, i32 zeroext)

declare <vscale x 2 x i64> @vmaxu_vv_nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i64> @vmaxu_vv_nxv2i64_unmasked(<vscale x 2 x i64>, <vscale x 2 x i64>, i32 zeroext)

declare <vscale x 2 x i64> @vmaxu_vx_nxv2i64(<vscale x 2 x i64>, i64, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i64> @vmaxu_vx_nxv2i64_unmasked(<vscale x 2 x i64>, i64, i32 zeroext)

declare <vscale x 4 x i64> @vmaxu_vv_nxv4i64(<vscale x 4 x i64>, <vscale x 4 x i64>, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i64> @vmaxu_vv_nxv4i64_unmasked(<vscale x 4 x i64>, <vscale x 4 x i64>, i32 zeroext)

declare <vscale x 4 x i64> @vmaxu_vx_nxv4i64(<vscale x 4 x i64>, i64, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i64> @vmaxu_vx_nxv4i64_unmasked(<vscale x 4 x i64>, i64, i32 zeroext)

declare <vscale x 8 x i64> @vmaxu_vv_nxv8i64(<vscale x 8 x i64>, <vscale x 8 x i64>, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i64> @vmaxu_vv_nxv8i64_unmasked(<vscale x 8 x i64>, <vscale x 8 x i64>, i32 zeroext)

declare <vscale x 8 x i64> @vmaxu_vx_nxv8i64(<vscale x 8 x i64>, i64, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i64> @vmaxu_vx_nxv8i64_unmasked(<vscale x 8 x i64>, i64, i32 zeroext)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 128 x i8> @llvm.umax.nxv128i8(<vscale x 128 x i8>, <vscale x 128 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i16> @llvm.umax.nxv16i16(<vscale x 16 x i16>, <vscale x 16 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i32> @llvm.umax.nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x i8> @llvm.umax.nxv16i8(<vscale x 16 x i8>, <vscale x 16 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x i16> @llvm.umax.nxv1i16(<vscale x 1 x i16>, <vscale x 1 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x i32> @llvm.umax.nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x i64> @llvm.umax.nxv1i64(<vscale x 1 x i64>, <vscale x 1 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x i8> @llvm.umax.nxv1i8(<vscale x 1 x i8>, <vscale x 1 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i16> @llvm.umax.nxv2i16(<vscale x 2 x i16>, <vscale x 2 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i32> @llvm.umax.nxv2i32(<vscale x 2 x i32>, <vscale x 2 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i64> @llvm.umax.nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 2 x i8> @llvm.umax.nxv2i8(<vscale x 2 x i8>, <vscale x 2 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 32 x i16> @llvm.umax.nxv32i16(<vscale x 32 x i16>, <vscale x 32 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 32 x i32> @llvm.umax.nxv32i32(<vscale x 32 x i32>, <vscale x 32 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 32 x i8> @llvm.umax.nxv32i8(<vscale x 32 x i8>, <vscale x 32 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 3 x i8> @llvm.umax.nxv3i8(<vscale x 3 x i8>, <vscale x 3 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i16> @llvm.umax.nxv4i16(<vscale x 4 x i16>, <vscale x 4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i32> @llvm.umax.nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i64> @llvm.umax.nxv4i64(<vscale x 4 x i64>, <vscale x 4 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i8> @llvm.umax.nxv4i8(<vscale x 4 x i8>, <vscale x 4 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 64 x i8> @llvm.umax.nxv64i8(<vscale x 64 x i8>, <vscale x 64 x i8>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i16> @llvm.umax.nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i32> @llvm.umax.nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i64> @llvm.umax.nxv8i64(<vscale x 8 x i64>, <vscale x 8 x i64>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i7> @llvm.umax.nxv8i7(<vscale x 8 x i7>, <vscale x 8 x i7>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 8 x i8> @llvm.umax.nxv8i8(<vscale x 8 x i8>, <vscale x 8 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vscale.i32() #2

attributes #0 = { vscale_range(2,1024) }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
