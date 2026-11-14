; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zhinx -O2 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 42
@G.1 = global i16 32767
@G.2 = global float 1.000000e+00
@G.3 = global <2 x ptr> poison
@G.4 = global <4 x i1> splat (i1 true)
@G.5 = global i128 1
@G.6 = global i1 true

define <4 x i32> @load_v4i32_align1(ptr %ptr) {
  %G = getelementptr float, ptr %ptr, i128 -1
  %z = load <4 x i32>, ptr %G, align 1
  ret <4 x i32> %z
}

define <4 x i32> @load_v4i32_align2(ptr %ptr) {
  %LGV = load i16, ptr @G, align 2
  %z = load <4 x i32>, ptr %ptr, align 2
  %B = xor i16 %LGV, 0
  store i16 %B, ptr @G.1, align 2
  ret <4 x i32> %z
}

declare void @store_v4i32_align1(<4 x i32>, ptr)

define void @store_v4i32_align2(<4 x i32> %x, ptr %ptr) {
  %C = fcmp ule <4 x float> splat (float 1.000000e+00), splat (float 1.401300e-45)
  %C1 = icmp ult <4 x i1> %C, %C
  store <4 x i32> %x, ptr %ptr, align 2
  store <4 x i1> %C1, ptr @G.4, align 1
  ret void
}

define <2 x i16> @mgather_v2i16_align1(<2 x ptr> %ptrs, <2 x i1> %m, <2 x i16> %passthru) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C = fcmp une bfloat 3.389530e+38, 3.389530e+38
  %v = call <2 x i16> @llvm.masked.gather.v2i16.v2p0(<2 x ptr> align 1 %ptrs, <2 x i1> %m, <2 x i16> %passthru)
  store i1 %C, ptr %A, align 1
  ret <2 x i16> %v
}

declare <2 x i64> @mgather_v2i64_align4(<2 x ptr>, <2 x i1>, <2 x i64>)

declare void @mscatter_v4i16_align1(<4 x i16>, <4 x ptr>, <4 x i1>)

define void @mscatter_v2i32_align2(<2 x i32> %val, <2 x ptr> %ptrs, <2 x i1> %m) {
  %S = shufflevector <2 x ptr> %ptrs, <2 x ptr> poison, <2 x i32> poison
  call void @llvm.masked.scatter.v2i32.v2p0(<2 x i32> %val, <2 x ptr> align 2 %S, <2 x i1> %m)
  %I = insertelement <2 x ptr> %S, ptr poison, i8 16
  store <2 x ptr> %I, ptr @G.3, align 16
  ret void
}

; Function Attrs: nounwind
declare void @masked_load_v2i32_align1(ptr, <2 x i32>, ptr) #0

; Function Attrs: nounwind
define void @masked_store_v2i32_align2(<2 x i32> %val, ptr %a, <2 x i32> %m) #0 {
  %LGV = load i128, ptr @G.5, align 4
  %mask = icmp eq <2 x i32> %m, zeroinitializer
  call void @llvm.masked.store.v2i32.p0(<2 x i32> %val, ptr align 2 %a, <2 x i1> %mask)
  switch i128 %LGV, label %SW_D [
    i128 18062003894815608257, label %SW_C
    i128 7653114304840661213, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_C, %SW_D
  ret void

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %SW_C1, %0
  %LGV2 = load i1, ptr @G.6, align 1
  br i1 %LGV2, label %SW_C1, label %BB
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(read)
declare <2 x i16> @llvm.masked.gather.v2i16.v2p0(<2 x ptr>, <2 x i1>, <2 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(read)
declare <2 x i64> @llvm.masked.gather.v2i64.v2p0(<2 x ptr>, <2 x i1>, <2 x i64>) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <2 x i32> @llvm.masked.load.v2i32.p0(ptr captures(none), <2 x i1>, <2 x i32>) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v2i32.v2p0(<2 x i32>, <2 x ptr>, <2 x i1>) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(write)
declare void @llvm.masked.scatter.v4i16.v4p0(<4 x i16>, <4 x ptr>, <4 x i1>) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.masked.store.v2i32.p0(<2 x i32>, ptr captures(none), <2 x i1>) #4

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(read) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(write) }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
