; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32d -verify-machineinstrs -mattr=+m,+d,+zfhmin,+zvfhmin,+zfbfmin,+zvfbfmin,+v -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

declare void @mscatter_v1i8(<1 x i8>, <1 x ptr>, <1 x i1>)

declare void @mscatter_v2i8(<2 x i8>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v2i16_truncstore_v2i8(<2 x i16>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v2i32_truncstore_v2i8(<2 x i32>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v2i64_truncstore_v2i8(<2 x i64>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v4i8(<4 x i8>, <4 x ptr>, <4 x i1>)

declare void @mscatter_truemask_v4i8(<4 x i8>, <4 x ptr>)

declare void @mscatter_falsemask_v4i8(<4 x i8>, <4 x ptr>)

declare void @mscatter_v8i8(<8 x i8>, <8 x ptr>, <8 x i1>)

declare void @mscatter_baseidx_v8i8(<8 x i8>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_v1i16(<1 x i16>, <1 x ptr>, <1 x i1>)

declare void @mscatter_v2i16(<2 x i16>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v2i32_truncstore_v2i16(<2 x i32>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v2i64_truncstore_v2i16(<2 x i64>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v4i16(<4 x i16>, <4 x ptr>, <4 x i1>)

declare void @mscatter_truemask_v4i16(<4 x i16>, <4 x ptr>)

declare void @mscatter_falsemask_v4i16(<4 x i16>, <4 x ptr>)

declare void @mscatter_v8i16(<8 x i16>, <8 x ptr>, <8 x i1>)

declare void @mscatter_baseidx_v8i8_v8i16(<8 x i16>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_sext_v8i8_v8i16(<8 x i16>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i8_v8i16(<8 x i16>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_v8i16(<8 x i16>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_v1i32(<1 x i32>, <1 x ptr>, <1 x i1>)

declare void @mscatter_v2i32(<2 x i32>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v2i64_truncstore_v2i32(<2 x i64>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v4i32(<4 x i32>, <4 x ptr>, <4 x i1>)

declare void @mscatter_truemask_v4i32(<4 x i32>, <4 x ptr>)

declare void @mscatter_falsemask_v4i32(<4 x i32>, <4 x ptr>)

declare void @mscatter_v8i32(<8 x i32>, <8 x ptr>, <8 x i1>)

declare void @mscatter_baseidx_v8i8_v8i32(<8 x i32>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_sext_v8i8_v8i32(<8 x i32>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i8_v8i32(<8 x i32>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_v8i16_v8i32(<8 x i32>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_baseidx_sext_v8i16_v8i32(<8 x i32>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i16_v8i32(<8 x i32>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_baseidx_v8i32(<8 x i32>, ptr, <8 x i32>, <8 x i1>)

declare void @mscatter_v1i64(<1 x i64>, <1 x ptr>, <1 x i1>)

declare void @mscatter_v2i64(<2 x i64>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v4i64(<4 x i64>, <4 x ptr>, <4 x i1>)

declare void @mscatter_truemask_v4i64(<4 x i64>, <4 x ptr>)

declare void @mscatter_falsemask_v4i64(<4 x i64>, <4 x ptr>)

declare void @mscatter_v8i64(<8 x i64>, <8 x ptr>, <8 x i1>)

declare void @mscatter_baseidx_v8i8_v8i64(<8 x i64>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_sext_v8i8_v8i64(<8 x i64>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i8_v8i64(<8 x i64>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_v8i16_v8i64(<8 x i64>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_baseidx_sext_v8i16_v8i64(<8 x i64>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i16_v8i64(<8 x i64>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_baseidx_v8i32_v8i64(<8 x i64>, ptr, <8 x i32>, <8 x i1>)

declare void @mscatter_baseidx_sext_v8i32_v8i64(<8 x i64>, ptr, <8 x i32>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i32_v8i64(<8 x i64>, ptr, <8 x i32>, <8 x i1>)

declare void @mscatter_baseidx_v8i64(<8 x i64>, ptr, <8 x i64>, <8 x i1>)

declare void @mscatter_v1bf16(<1 x bfloat>, <1 x ptr>, <1 x i1>)

declare void @mscatter_v2bf16(<2 x bfloat>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v4bf16(<4 x bfloat>, <4 x ptr>, <4 x i1>)

declare void @mscatter_truemask_v4bf16(<4 x bfloat>, <4 x ptr>)

declare void @mscatter_falsemask_v4bf16(<4 x bfloat>, <4 x ptr>)

declare void @mscatter_v8bf16(<8 x bfloat>, <8 x ptr>, <8 x i1>)

declare void @mscatter_baseidx_v8i8_v8bf16(<8 x bfloat>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_sext_v8i8_v8bf16(<8 x bfloat>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i8_v8bf16(<8 x bfloat>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_v8bf16(<8 x bfloat>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_v1f16(<1 x half>, <1 x ptr>, <1 x i1>)

declare void @mscatter_v2f16(<2 x half>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v4f16(<4 x half>, <4 x ptr>, <4 x i1>)

declare void @mscatter_truemask_v4f16(<4 x half>, <4 x ptr>)

declare void @mscatter_falsemask_v4f16(<4 x half>, <4 x ptr>)

declare void @mscatter_v8f16(<8 x half>, <8 x ptr>, <8 x i1>)

define void @mscatter_baseidx_v8i8_v8f16(<8 x half> %val, ptr %base, <8 x i8> %idxs, <8 x i1> %m) {
  %ptrs = getelementptr inbounds half, ptr %base, <8 x i8> %idxs
  %B = mul <8 x i1> %m, zeroinitializer
  call void @llvm.masked.scatter.v8f16.v8p0(<8 x half> %val, <8 x ptr> align 2 %ptrs, <8 x i1> %B)
  ret void
}

declare void @mscatter_baseidx_sext_v8i8_v8f16(<8 x half>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i8_v8f16(<8 x half>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_v8f16(<8 x half>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_v1f32(<1 x float>, <1 x ptr>, <1 x i1>)

declare void @mscatter_v2f32(<2 x float>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v4f32(<4 x float>, <4 x ptr>, <4 x i1>)

declare void @mscatter_truemask_v4f32(<4 x float>, <4 x ptr>)

declare void @mscatter_falsemask_v4f32(<4 x float>, <4 x ptr>)

declare void @mscatter_v8f32(<8 x float>, <8 x ptr>, <8 x i1>)

declare void @mscatter_baseidx_v8i8_v8f32(<8 x float>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_sext_v8i8_v8f32(<8 x float>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i8_v8f32(<8 x float>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_v8i16_v8f32(<8 x float>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_baseidx_sext_v8i16_v8f32(<8 x float>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i16_v8f32(<8 x float>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_baseidx_v8f32(<8 x float>, ptr, <8 x i32>, <8 x i1>)

declare void @mscatter_v1f64(<1 x double>, <1 x ptr>, <1 x i1>)

declare void @mscatter_v2f64(<2 x double>, <2 x ptr>, <2 x i1>)

declare void @mscatter_v4f64(<4 x double>, <4 x ptr>, <4 x i1>)

declare void @mscatter_truemask_v4f64(<4 x double>, <4 x ptr>)

declare void @mscatter_falsemask_v4f64(<4 x double>, <4 x ptr>)

declare void @mscatter_v8f64(<8 x double>, <8 x ptr>, <8 x i1>)

declare void @mscatter_baseidx_v8i8_v8f64(<8 x double>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_sext_v8i8_v8f64(<8 x double>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i8_v8f64(<8 x double>, ptr, <8 x i8>, <8 x i1>)

declare void @mscatter_baseidx_v8i16_v8f64(<8 x double>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_baseidx_sext_v8i16_v8f64(<8 x double>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i16_v8f64(<8 x double>, ptr, <8 x i16>, <8 x i1>)

declare void @mscatter_baseidx_v8i32_v8f64(<8 x double>, ptr, <8 x i32>, <8 x i1>)

declare void @mscatter_baseidx_sext_v8i32_v8f64(<8 x double>, ptr, <8 x i32>, <8 x i1>)

declare void @mscatter_baseidx_zext_v8i32_v8f64(<8 x double>, ptr, <8 x i32>, <8 x i1>)

declare void @mscatter_baseidx_v8f64(<8 x double>, ptr, <8 x i64>, <8 x i1>)

declare void @mscatter_baseidx_v16i8(<16 x i8>, ptr, <16 x i8>, <16 x i1>)

declare void @mscatter_baseidx_v32i8(<32 x i8>, ptr, <32 x i8>, <32 x i1>)

declare void @mscatter_unit_stride(<8 x i16>, ptr)

declare void @mscatter_unit_stride_with_offset(<8 x i16>, ptr)

declare void @mscatter_shuffle_reverse(<8 x i16>, ptr)

declare void @mscatter_shuffle_rotate(<8 x i16>, ptr)

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v16i8.v16p0(<16 x i8>, <16 x ptr>, <16 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v1bf16.v1p0(<1 x bfloat>, <1 x ptr>, <1 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v1f16.v1p0(<1 x half>, <1 x ptr>, <1 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v1f32.v1p0(<1 x float>, <1 x ptr>, <1 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v1f64.v1p0(<1 x double>, <1 x ptr>, <1 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v1i16.v1p0(<1 x i16>, <1 x ptr>, <1 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v1i32.v1p0(<1 x i32>, <1 x ptr>, <1 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v1i64.v1p0(<1 x i64>, <1 x ptr>, <1 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v1i8.v1p0(<1 x i8>, <1 x ptr>, <1 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v2bf16.v2p0(<2 x bfloat>, <2 x ptr>, <2 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v2f16.v2p0(<2 x half>, <2 x ptr>, <2 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v2f32.v2p0(<2 x float>, <2 x ptr>, <2 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v2f64.v2p0(<2 x double>, <2 x ptr>, <2 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v2i16.v2p0(<2 x i16>, <2 x ptr>, <2 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v2i32.v2p0(<2 x i32>, <2 x ptr>, <2 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v2i64.v2p0(<2 x i64>, <2 x ptr>, <2 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v2i8.v2p0(<2 x i8>, <2 x ptr>, <2 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v32i8.v32p0(<32 x i8>, <32 x ptr>, <32 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v4bf16.v4p0(<4 x bfloat>, <4 x ptr>, <4 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v4f16.v4p0(<4 x half>, <4 x ptr>, <4 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v4f32.v4p0(<4 x float>, <4 x ptr>, <4 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v4f64.v4p0(<4 x double>, <4 x ptr>, <4 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v4i16.v4p0(<4 x i16>, <4 x ptr>, <4 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v4i32.v4p0(<4 x i32>, <4 x ptr>, <4 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v4i64.v4p0(<4 x i64>, <4 x ptr>, <4 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v4i8.v4p0(<4 x i8>, <4 x ptr>, <4 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v8bf16.v8p0(<8 x bfloat>, <8 x ptr>, <8 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v8f16.v8p0(<8 x half>, <8 x ptr>, <8 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v8f32.v8p0(<8 x float>, <8 x ptr>, <8 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v8f64.v8p0(<8 x double>, <8 x ptr>, <8 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v8i16.v8p0(<8 x i16>, <8 x ptr>, <8 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v8i32.v8p0(<8 x i32>, <8 x ptr>, <8 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v8i64.v8p0(<8 x i64>, <8 x ptr>, <8 x i1>) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v8i8.v8p0(<8 x i8>, <8 x ptr>, <8 x i1>) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(write) }
