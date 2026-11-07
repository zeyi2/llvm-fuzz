; isel-diff-config: -mtriple=riscv64 -mattr=+m,+zdinx -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 -128
@G.6 = global ptr poison
@G.7 = global <4 x i32> splat (i32 42)
@G.8 = global i1 false
@G.9 = global <20 x i32> splat (i32 -1)
@G.10 = global <20 x i32> splat (i32 -1)
@G.11 = global <8 x i8> zeroinitializer

declare { <3 x i32>, <3 x i32> } @load_factor2_v3(ptr)

declare { <4 x i32>, <4 x i32> } @load_factor2(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @load_factor3(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @load_factor4(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @load_factor5(ptr)

declare { <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16> } @load_factor6(ptr)

declare { <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16> } @load_factor7(ptr)

declare { <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16> } @load_factor8(ptr)

declare { <4 x i32>, <4 x i32> } @vpload_factor2(ptr)

define { <4 x i32>, <4 x i32> } @vpload_factor2_interleaved_mask_intrinsic(ptr %ptr, <4 x i1> %m) {
  %interleaved.mask = call <8 x i1> @llvm.vector.interleave2.v8i1(<4 x i1> %m, <4 x i1> %m)
  %interleaved.vec = tail call <8 x i32> @llvm.vp.load.v8i32.p0(ptr %ptr, <8 x i1> %interleaved.mask, i32 8)
  %v0 = shufflevector <8 x i32> %interleaved.vec, <8 x i32> poison, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %C = icmp slt i32 1, 2147483647
  %v1 = shufflevector <8 x i32> %interleaved.vec, <8 x i32> poison, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %res0 = insertvalue { <4 x i32>, <4 x i32> } poison, <4 x i32> %v0, 0
  %res1 = insertvalue { <4 x i32>, <4 x i32> } %res0, <4 x i32> %v1, 1
  store i1 %C, ptr @G.8, align 1
  ret { <4 x i32>, <4 x i32> } %res1
}

declare { <2 x i32>, <2 x i32> } @vpload_factor4_interleaved_mask_intrinsic_skip_fields(ptr, <2 x i1>)

declare { <4 x i32>, <4 x i32> } @vpload_factor2_interleaved_mask_shuffle(ptr, <4 x i1>)

declare { <4 x i32>, <4 x i32> } @vpload_factor2_interleaved_mask_shuffle2(ptr, <2 x i1>)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @vpload_factor3(ptr)

declare { <4 x i32>, <4 x i32> } @vpload_factor3_partial(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @vpload_factor3_v16i32(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @vpload_factor3_mask(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @vpload_factor3_poison_shufflemask(ptr)

declare { <4 x i32>, <4 x i32> } @vpload_factor3_skip_fields(ptr)

declare { <4 x i32>, <4 x i32> } @vpload_factor3_mask_skip_fields(ptr)

define { <4 x i32>, <4 x i32> } @vpload_factor3_combined_mask_skip_field(ptr %ptr, <4 x i1> %mask) {
  %LGV = load i8, ptr @G, align 1
  %interleaved.mask = shufflevector <4 x i1> %mask, <4 x i1> poison, <12 x i32> <i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 3, i32 3, i32 3>
  %combined = and <12 x i1> %interleaved.mask, <i1 true, i1 true, i1 false, i1 true, i1 true, i1 false, i1 true, i1 true, i1 false, i1 true, i1 true, i1 false>
  %interleaved.vec = tail call <12 x i32> @llvm.vp.load.v12i32.p0(ptr %ptr, <12 x i1> %combined, i32 12)
  %G = getelementptr <12 x i1>, ptr %ptr, i8 %LGV
  %v0 = shufflevector <12 x i32> %interleaved.vec, <12 x i32> poison, <4 x i32> <i32 0, i32 3, i32 6, i32 9>
  %v1 = shufflevector <12 x i32> %interleaved.vec, <12 x i32> poison, <4 x i32> <i32 1, i32 4, i32 7, i32 10>
  %res0 = insertvalue { <4 x i32>, <4 x i32> } poison, <4 x i32> %v0, 0
  %res1 = insertvalue { <4 x i32>, <4 x i32> } %res0, <4 x i32> %v1, 1
  store ptr %G, ptr @G.6, align 8
  ret { <4 x i32>, <4 x i32> } %res1
}

declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @vpload_factor4(ptr)

declare { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } @vpload_factor4_intrinsics(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @gap_mask_vpload_factor4_intrinsics(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @gap_mask_single_field_vpload_factor4_intrinsics(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @vpload_factor5(ptr)

declare { <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16> } @vpload_factor6(ptr)

declare { <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16> } @vpload_factor7(ptr)

declare { <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16> } @vpload_factor8(ptr)

declare { <8 x i64>, <8 x i64>, <8 x i64>, <8 x i64>, <8 x i64>, <8 x i64> } @load_factor6_too_big(ptr)

declare void @store_factor2(ptr, <4 x i32>, <4 x i32>)

declare void @store_factor3(ptr, <4 x i32>, <4 x i32>, <4 x i32>)

declare void @store_factor4(ptr, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>)

declare void @store_factor5(ptr, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>)

declare void @store_factor6(ptr, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>)

declare void @store_factor7(ptr, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>)

declare void @store_factor8(ptr, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>)

declare void @vpstore_factor2(ptr, <4 x i32>, <4 x i32>)

declare void @vpstore_factor2_interleaved_mask_intrinsic(ptr, <4 x i32>, <4 x i32>, <4 x i1>)

declare void @vpstore_factor3(ptr, <4 x i32>, <4 x i32>, <4 x i32>)

declare void @vpstore_factor3_mask(ptr, <4 x i32>, <4 x i32>, <4 x i32>)

declare void @vpstore_factor3_gap(ptr, <4 x i32>, <4 x i32>, <4 x i32>)

declare void @vpstore_factor3_gap_with_mask(ptr, <4 x i32>, <4 x i32>, <4 x i32>)

declare void @vpstore_factor4(ptr, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>)

declare void @vpstore_factor5(ptr, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>)

declare void @vpstore_factor6(ptr, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>)

declare void @vpstore_factor7(ptr, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>)

declare void @vpstore_factor7_masked(ptr, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i1>)

declare void @vpstore_factor8(ptr, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>)

define <4 x i32> @load_factor2_one_active(ptr %ptr) {
  %A = alloca <4 x i1>, align 1
  store <4 x i1> poison, ptr %A, align 1
  %interleaved.vec = load <8 x i32>, ptr %ptr, align 32
  %v0 = shufflevector <8 x i32> %interleaved.vec, <8 x i32> poison, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %C = icmp sgt <4 x i32> %v0, %v0
  store <4 x i1> %C, ptr %A, align 1
  ret <4 x i32> %v0
}

declare <4 x i32> @load_factor3_one_active(ptr)

declare <4 x i32> @load_factor4_one_active(ptr)

define <4 x i32> @load_factor5_one_active(ptr %ptr) {
  %LGV1 = load <20 x i32>, ptr @G.9, align 128
  %interleaved.vec = load <20 x i32>, ptr %ptr, align 128
  %B = or <20 x i32> %interleaved.vec, %LGV1
  %v0 = shufflevector <20 x i32> %interleaved.vec, <20 x i32> poison, <4 x i32> <i32 0, i32 5, i32 10, i32 15>
  store <20 x i32> %B, ptr @G.10, align 128
  ret <4 x i32> %v0
}

declare <2 x i16> @load_factor6_one_active(ptr)

; Function Attrs: vscale_range(8,1024)
declare <4 x i8> @load_factor7_one_active(ptr) #0

; Function Attrs: vscale_range(8,1024)
declare <4 x i8> @load_factor8_one_active(ptr) #0

declare <4 x ptr> @load_factor3_one_active_ptr(ptr)

declare void @load_factor4_one_active_storeback(ptr)

declare void @load_factor4_one_active_storeback_full(ptr)

declare <4 x i32> @vp_load_factor3_one_active(ptr)

declare <4 x i32> @vp_load_factor5_one_active(ptr)

declare void @store_factor4_one_active(ptr, <4 x i32>)

declare void @vpstore_factor4_one_active(ptr, <4 x i32>)

declare void @store_factor4_one_active_idx1(ptr, <4 x i32>)

declare void @store_factor4_one_active_fullwidth(ptr, <16 x i32>)

define void @store_factor4_one_active_slidedown(ptr %ptr, <4 x i32> %v) {
  %B = ashr <8 x i8> splat (i8 42), splat (i8 1)
  %v0 = shufflevector <4 x i32> %v, <4 x i32> poison, <16 x i32> <i32 1, i32 poison, i32 poison, i32 poison, i32 2, i32 poison, i32 poison, i32 poison, i32 3, i32 poison, i32 poison, i32 poison, i32 4, i32 poison, i32 poison, i32 poison>
  store <16 x i32> %v0, ptr %ptr, align 64
  store <8 x i8> %B, ptr @G.11, align 8
  ret void
}

declare void @store_factor4_one_active_ptr(ptr, <4 x ptr>)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @invalid_vp_mask(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @invalid_vp_evl(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @maskedload_factor5(ptr)

declare void @maskedstore_factor2(ptr, <4 x i32>, <4 x i32>)

declare void @maskedstore_factor3_gap(ptr, <4 x i32>, <4 x i32>, <4 x i32>)

define void @maskedstore_factor4_gap_with_mask(ptr %ptr, <4 x i32> %v0, <4 x i32> %v1, <4 x i32> %v2, <4 x i32> %v3) {
  %A = alloca <4 x i32>, align 16
  store <4 x i32> poison, ptr %A, align 16
  %LGV = load <4 x i32>, ptr @G.7, align 16
  %B = lshr <4 x i32> %v0, %LGV
  %s0 = shufflevector <4 x i32> %v0, <4 x i32> %v1, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %s1 = shufflevector <4 x i32> %v2, <4 x i32> %v3, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %interleaved.vec = shufflevector <8 x i32> %s0, <8 x i32> %s1, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>
  tail call void @llvm.masked.store.v16i32.p0(<16 x i32> %interleaved.vec, ptr align 4 %ptr, <16 x i1> <i1 true, i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false, i1 true, i1 true, i1 false, i1 false, i1 false, i1 false, i1 false, i1 false>)
  store <4 x i32> %B, ptr %A, align 16
  ret void
}

declare void @maskedstore_factor4_gap_by_intrinsic_with_mask(ptr, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i1>)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @maskedload_factor3_mask(ptr)

declare { <4 x i32>, <4 x i32> } @maskedload_factor3_skip_field(ptr)

declare { <4 x i32>, <4 x i32> } @maskedload_factor3_mask_skip_field(ptr)

declare { <4 x i32>, <4 x i32> } @maskedload_factor3_combined_mask_skip_field(ptr, <4 x i1>)

declare { <4 x i32>, <4 x i32> } @maskedload_factor4_combined_mask_multi_skip_fields(ptr, <4 x i1>)

declare { <4 x i32>, <4 x i32> } @maskedload_factor4_combined_mask_multi_skip_fields_and_masks(ptr, <4 x i1>, <4 x i1>)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @maskedload_factor3_invalid_skip_field(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @maskedload_factor5_skip_fields(ptr)

declare <4 x i8> @maskedload_factor5_one_active(ptr)

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <20 x i32> @llvm.masked.load.v20i32.p0(ptr captures(none), <20 x i1>, <20 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <12 x i32> @llvm.masked.load.v12i32.p0(ptr captures(none), <12 x i1>, <12 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <16 x i32> @llvm.masked.load.v16i32.p0(ptr captures(none), <16 x i1>, <16 x i32>) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <20 x i8> @llvm.masked.load.v20i8.p0(ptr captures(none), <20 x i1>, <20 x i8>) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.masked.store.v16i32.p0(<16 x i32>, ptr captures(none), <16 x i1>) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.masked.store.v12i32.p0(<12 x i32>, ptr captures(none), <12 x i1>) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.masked.store.v8i32.p0(<8 x i32>, ptr captures(none), <8 x i1>) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @llvm.vector.deinterleave4.v16i32(<16 x i32>) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { <2 x i32>, <2 x i32>, <2 x i32>, <2 x i32> } @llvm.vector.deinterleave4.v8i32(<8 x i32>) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i1> @llvm.vector.interleave2.v8i1(<4 x i1>, <4 x i1>) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i1> @llvm.vector.interleave4.v16i1(<4 x i1>, <4 x i1>, <4 x i1>, <4 x i1>) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i1> @llvm.vector.interleave4.v8i1(<2 x i1>, <2 x i1>, <2 x i1>, <2 x i1>) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <16 x i32> @llvm.vp.load.v16i32.p0(ptr captures(none), <16 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <12 x i16> @llvm.vp.load.v12i16.p0(ptr captures(none), <12 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <12 x i32> @llvm.vp.load.v12i32.p0(ptr captures(none), <12 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <14 x i16> @llvm.vp.load.v14i16.p0(ptr captures(none), <14 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <16 x i16> @llvm.vp.load.v16i16.p0(ptr captures(none), <16 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <20 x i32> @llvm.vp.load.v20i32.p0(ptr captures(none), <20 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare <8 x i32> @llvm.vp.load.v8i32.p0(ptr captures(none), <8 x i1>, i32) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.vp.store.v12i16.p0(<12 x i16>, ptr captures(none), <12 x i1>, i32) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.vp.store.v12i32.p0(<12 x i32>, ptr captures(none), <12 x i1>, i32) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.vp.store.v14i16.p0(<14 x i16>, ptr captures(none), <14 x i1>, i32) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.vp.store.v16i16.p0(<16 x i16>, ptr captures(none), <16 x i1>, i32) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.vp.store.v16i32.p0(<16 x i32>, ptr captures(none), <16 x i1>, i32) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.vp.store.v20i32.p0(<20 x i32>, ptr captures(none), <20 x i1>, i32) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.vp.store.v8i32.p0(<8 x i32>, ptr captures(none), <8 x i1>, i32) #2

attributes #0 = { vscale_range(8,1024) }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
