; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+m,+v,+zvfh,+zvfbfmin -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i32 65536
@G.2 = global <8 x i8> splat (i8 -1)
@G.3 = global <8 x i1> zeroinitializer
@G.4 = global i1 true
@G.5 = global ptr poison
@G.6 = global i1 false

declare <vscale x 1 x i8> @strided_vpload_nxv1i8_i8(ptr, i8 signext, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i8> @strided_vpload_nxv1i8_i16(ptr, i16 signext, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i8> @strided_vpload_nxv1i8_i64(ptr, i64 signext, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i8> @strided_vpload_nxv1i8_i64_allones_mask(ptr, i64 signext, i32 zeroext)

define <vscale x 1 x i8> @strided_vpload_nxv1i8(ptr %ptr, i32 signext %stride, <vscale x 1 x i1> %m, i32 zeroext %evl) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %load = call <vscale x 1 x i8> @llvm.experimental.vp.strided.load.nxv1i8.p0.i32(ptr %ptr, i32 signext %stride, <vscale x 1 x i1> %m, i32 %evl)
  %B = ashr i1 false, false
  store i1 %B, ptr %A, align 1
  ret <vscale x 1 x i8> %load
}

declare <vscale x 1 x i8> @strided_vpload_nxv1i8_allones_mask(ptr, i32 signext, i32 zeroext)

declare <vscale x 2 x i8> @strided_vpload_nxv2i8(ptr, i32 signext, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 4 x i8> @strided_vpload_nxv4i8(ptr, i32 signext, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 8 x i8> @strided_vpload_nxv8i8(ptr, i32 signext, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i8> @strided_vpload_nxv8i8_unit_stride(ptr, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x i8> @strided_vpload_nxv8i8_allones_mask(ptr, i32 signext, i32 zeroext)

declare <vscale x 1 x i16> @strided_vpload_nxv1i16(ptr, i32 signext, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 2 x i16> @strided_vpload_nxv2i16(ptr, i32 signext, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x i16> @strided_vpload_nxv2i16_allones_mask(ptr, i32 signext, i32 zeroext)

define <vscale x 4 x i16> @strided_vpload_nxv4i16(ptr %ptr, i32 signext %stride, <vscale x 4 x i1> %m, i32 zeroext %evl) {
  %E = extractelement <vscale x 4 x i1> %m, i128 1
  %load = call <vscale x 4 x i16> @llvm.experimental.vp.strided.load.nxv4i16.p0.i32(ptr %ptr, i32 signext %stride, <vscale x 4 x i1> %m, i32 %evl)
  store i1 %E, ptr @G.6, align 1
  ret <vscale x 4 x i16> %load
}

declare <vscale x 4 x i16> @strided_vpload_nxv4i16_unit_stride(ptr, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 8 x i16> @strided_vpload_nxv8i16(ptr, i32 signext, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 1 x i32> @strided_vpload_nxv1i32(ptr, i32 signext, <vscale x 1 x i1>, i32 zeroext)

define <vscale x 2 x i32> @strided_vpload_nxv2i32(ptr %ptr, i32 signext %stride, <vscale x 2 x i1> %m, i32 zeroext %evl) {
  %LGV = load i1, ptr @G.4, align 1
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  %load = call <vscale x 2 x i32> @llvm.experimental.vp.strided.load.nxv2i32.p0.i32(ptr %ptr, i32 signext %stride, <vscale x 2 x i1> %m, i32 %evl)
  ret <vscale x 2 x i32> %load

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  br i1 %LGV, label %F, label %BB
}

declare <vscale x 2 x i32> @strided_vpload_nxv2i32_unit_stride(ptr, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 4 x i32> @strided_vpload_nxv4i32(ptr, i32 signext, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x i32> @strided_vpload_nxv4i32_allones_mask(ptr, i32 signext, i32 zeroext)

declare <vscale x 8 x i32> @strided_vpload_nxv8i32(ptr, i32 signext, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 1 x i64> @strided_vpload_nxv1i64(ptr, i32 signext, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x i64> @strided_vpload_nxv1i64_unit_stride(ptr, <vscale x 1 x i1>, i32 zeroext)

define <vscale x 1 x i64> @strided_vpload_nxv1i64_allones_mask(ptr %ptr, i32 signext %stride, i32 zeroext %evl) {
  %LGV = load i32, ptr @G.1, align 4
  %load = call <vscale x 1 x i64> @llvm.experimental.vp.strided.load.nxv1i64.p0.i32(ptr %ptr, i32 signext %stride, <vscale x 1 x i1> splat (i1 true), i32 %evl)
  %C = icmp eq i32 42, %LGV
  store i1 %C, ptr poison, align 1
  ret <vscale x 1 x i64> %load
}

declare <vscale x 2 x i64> @strided_vpload_nxv2i64(ptr, i32 signext, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 4 x i64> @strided_vpload_nxv4i64(ptr, i32 signext, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 8 x i64> @strided_vpload_nxv8i64(ptr, i32 signext, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 1 x bfloat> @strided_vpload_nxv1bf16(ptr, i32 signext, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 2 x bfloat> @strided_vpload_nxv2bf16(ptr, i32 signext, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x bfloat> @strided_vpload_nxv2bf16_allones_mask(ptr, i32 signext, i32 zeroext)

declare <vscale x 4 x bfloat> @strided_vpload_nxv4bf16(ptr, i32 signext, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x bfloat> @strided_vpload_nxv4bf16_unit_stride(ptr, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 8 x bfloat> @strided_vpload_nxv8bf16(ptr, i32 signext, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 1 x half> @strided_vpload_nxv1f16(ptr, i32 signext, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 2 x half> @strided_vpload_nxv2f16(ptr, i32 signext, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x half> @strided_vpload_nxv2f16_allones_mask(ptr, i32 signext, i32 zeroext)

declare <vscale x 4 x half> @strided_vpload_nxv4f16(ptr, i32 signext, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 4 x half> @strided_vpload_nxv4f16_unit_stride(ptr, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 8 x half> @strided_vpload_nxv8f16(ptr, i32 signext, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 1 x float> @strided_vpload_nxv1f32(ptr, i32 signext, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 2 x float> @strided_vpload_nxv2f32(ptr, i32 signext, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 2 x float> @strided_vpload_nxv2f32_unit_stride(ptr, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 4 x float> @strided_vpload_nxv4f32(ptr, i32 signext, <vscale x 4 x i1>, i32 zeroext)

declare <vscale x 8 x float> @strided_vpload_nxv8f32(ptr, i32 signext, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 8 x float> @strided_vpload_nxv8f32_allones_mask(ptr, i32 signext, i32 zeroext)

declare <vscale x 1 x double> @strided_vpload_nxv1f64(ptr, i32 signext, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 1 x double> @strided_vpload_nxv1f64_unit_stride(ptr, <vscale x 1 x i1>, i32 zeroext)

declare <vscale x 2 x double> @strided_vpload_nxv2f64(ptr, i32 signext, <vscale x 2 x i1>, i32 zeroext)

declare <vscale x 4 x double> @strided_vpload_nxv4f64(ptr, i32 signext, <vscale x 4 x i1>, i32 zeroext)

define <vscale x 4 x double> @strided_vpload_nxv4f64_allones_mask(ptr %ptr, i32 signext %stride, i32 zeroext %evl) {
  %LGV = load <8 x i8>, ptr @G.2, align 8
  %load = call <vscale x 4 x double> @llvm.experimental.vp.strided.load.nxv4f64.p0.i32(ptr %ptr, i32 signext %stride, <vscale x 4 x i1> splat (i1 true), i32 %evl)
  %C = icmp ne i32 %stride, 1
  %C1 = icmp ne <8 x i8> %LGV, zeroinitializer
  store i1 %C, ptr @G, align 1
  store <8 x i1> %C1, ptr @G.3, align 1
  ret <vscale x 4 x double> %load
}

declare <vscale x 8 x double> @strided_vpload_nxv8f64(ptr, i32 signext, <vscale x 8 x i1>, i32 zeroext)

declare <vscale x 3 x double> @strided_vpload_nxv3f64(ptr, i32 signext, <vscale x 3 x i1>, i32 zeroext)

declare <vscale x 3 x double> @strided_vpload_nxv3f64_allones_mask(ptr, i32 signext, i32 zeroext)

declare <vscale x 16 x double> @strided_load_nxv16f64(ptr, i64, <vscale x 16 x i1>, i32 zeroext)

declare <vscale x 16 x double> @strided_load_nxv16f64_allones_mask(ptr, i64, i32 zeroext)

declare <vscale x 16 x double> @strided_load_nxv17f64(ptr, i64, <vscale x 17 x i1>, i32 zeroext, ptr)

declare <vscale x 1 x i8> @zero_strided_unmasked_vpload_nxv1i8_i8(ptr)

declare <vscale x 1 x half> @zero_strided_unmasked_vpload_nxv1f16(ptr)

declare <vscale x 1 x i64> @zero_strided_vadd_nxv1i64(<vscale x 1 x i64>, ptr)

declare <vscale x 16 x i64> @zero_strided_vadd_nxv16i64(<vscale x 16 x i64>, ptr)

define <vscale x 1 x ptr> @zero_strided_vadd_nxv1p0(<vscale x 1 x ptr> %v, ptr %ptr) {
  %LGV = load ptr, ptr @G.5, align 8
  %I = insertelement <vscale x 1 x ptr> %v, ptr %LGV, i16 -32768
  ret <vscale x 1 x ptr> %I
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 16 x double> @llvm.vector.extract.nxv16f64.nxv17f64(<vscale x 17 x double>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 1 x double> @llvm.vector.extract.nxv1f64.nxv17f64(<vscale x 17 x double>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 16 x double> @llvm.experimental.vp.strided.load.nxv16f64.p0.i64(ptr captures(none), i64, <vscale x 16 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 16 x i64> @llvm.experimental.vp.strided.load.nxv16i64.p0.i32(ptr captures(none), i32, <vscale x 16 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 17 x double> @llvm.experimental.vp.strided.load.nxv17f64.p0.i64(ptr captures(none), i64, <vscale x 17 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x bfloat> @llvm.experimental.vp.strided.load.nxv1bf16.p0.i32(ptr captures(none), i32, <vscale x 1 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x half> @llvm.experimental.vp.strided.load.nxv1f16.p0.i32(ptr captures(none), i32, <vscale x 1 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x float> @llvm.experimental.vp.strided.load.nxv1f32.p0.i32(ptr captures(none), i32, <vscale x 1 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x double> @llvm.experimental.vp.strided.load.nxv1f64.p0.i32(ptr captures(none), i32, <vscale x 1 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i16> @llvm.experimental.vp.strided.load.nxv1i16.p0.i32(ptr captures(none), i32, <vscale x 1 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i32> @llvm.experimental.vp.strided.load.nxv1i32.p0.i32(ptr captures(none), i32, <vscale x 1 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i64> @llvm.experimental.vp.strided.load.nxv1i64.p0.i32(ptr captures(none), i32, <vscale x 1 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i8> @llvm.experimental.vp.strided.load.nxv1i8.p0.i16(ptr captures(none), i16, <vscale x 1 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i8> @llvm.experimental.vp.strided.load.nxv1i8.p0.i32(ptr captures(none), i32, <vscale x 1 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i8> @llvm.experimental.vp.strided.load.nxv1i8.p0.i64(ptr captures(none), i64, <vscale x 1 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x i8> @llvm.experimental.vp.strided.load.nxv1i8.p0.i8(ptr captures(none), i8, <vscale x 1 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 1 x ptr> @llvm.experimental.vp.strided.load.nxv1p0.p0.i32(ptr captures(none), i32, <vscale x 1 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x bfloat> @llvm.experimental.vp.strided.load.nxv2bf16.p0.i32(ptr captures(none), i32, <vscale x 2 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x half> @llvm.experimental.vp.strided.load.nxv2f16.p0.i32(ptr captures(none), i32, <vscale x 2 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x float> @llvm.experimental.vp.strided.load.nxv2f32.p0.i32(ptr captures(none), i32, <vscale x 2 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x double> @llvm.experimental.vp.strided.load.nxv2f64.p0.i32(ptr captures(none), i32, <vscale x 2 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x i16> @llvm.experimental.vp.strided.load.nxv2i16.p0.i32(ptr captures(none), i32, <vscale x 2 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x i32> @llvm.experimental.vp.strided.load.nxv2i32.p0.i32(ptr captures(none), i32, <vscale x 2 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x i64> @llvm.experimental.vp.strided.load.nxv2i64.p0.i32(ptr captures(none), i32, <vscale x 2 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 2 x i8> @llvm.experimental.vp.strided.load.nxv2i8.p0.i32(ptr captures(none), i32, <vscale x 2 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 3 x double> @llvm.experimental.vp.strided.load.nxv3f64.p0.i32(ptr captures(none), i32, <vscale x 3 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x bfloat> @llvm.experimental.vp.strided.load.nxv4bf16.p0.i32(ptr captures(none), i32, <vscale x 4 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x half> @llvm.experimental.vp.strided.load.nxv4f16.p0.i32(ptr captures(none), i32, <vscale x 4 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x float> @llvm.experimental.vp.strided.load.nxv4f32.p0.i32(ptr captures(none), i32, <vscale x 4 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x double> @llvm.experimental.vp.strided.load.nxv4f64.p0.i32(ptr captures(none), i32, <vscale x 4 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x i16> @llvm.experimental.vp.strided.load.nxv4i16.p0.i32(ptr captures(none), i32, <vscale x 4 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x i32> @llvm.experimental.vp.strided.load.nxv4i32.p0.i32(ptr captures(none), i32, <vscale x 4 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x i64> @llvm.experimental.vp.strided.load.nxv4i64.p0.i32(ptr captures(none), i32, <vscale x 4 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 4 x i8> @llvm.experimental.vp.strided.load.nxv4i8.p0.i32(ptr captures(none), i32, <vscale x 4 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x bfloat> @llvm.experimental.vp.strided.load.nxv8bf16.p0.i32(ptr captures(none), i32, <vscale x 8 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x half> @llvm.experimental.vp.strided.load.nxv8f16.p0.i32(ptr captures(none), i32, <vscale x 8 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x float> @llvm.experimental.vp.strided.load.nxv8f32.p0.i32(ptr captures(none), i32, <vscale x 8 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x double> @llvm.experimental.vp.strided.load.nxv8f64.p0.i32(ptr captures(none), i32, <vscale x 8 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x i16> @llvm.experimental.vp.strided.load.nxv8i16.p0.i32(ptr captures(none), i32, <vscale x 8 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x i32> @llvm.experimental.vp.strided.load.nxv8i32.p0.i32(ptr captures(none), i32, <vscale x 8 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x i64> @llvm.experimental.vp.strided.load.nxv8i64.p0.i32(ptr captures(none), i32, <vscale x 8 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <vscale x 8 x i8> @llvm.experimental.vp.strided.load.nxv8i8.p0.i32(ptr captures(none), i32, <vscale x 8 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vscale.i32() #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }
