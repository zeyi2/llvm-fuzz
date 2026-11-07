; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zfinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 65536
@G.6 = global i32 65536
@G.7 = global i1 false
@G.8 = global i64 4294967296
@G.9 = global ptr poison
@G.1 = global { <2 x i32>, <2 x i32> } poison

declare { <3 x i32>, <3 x i32> } @load_factor2_v3(ptr)

declare { <4 x i32>, <4 x i32> } @load_factor2(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @load_factor3(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @load_factor4(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @load_factor5(ptr)

declare { <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16> } @load_factor6(ptr)

declare { <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16> } @load_factor7(ptr)

declare { <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16>, <2 x i16> } @load_factor8(ptr)

declare { <4 x i32>, <4 x i32> } @vpload_factor2(ptr)

declare { <4 x i32>, <4 x i32> } @vpload_factor2_interleaved_mask_intrinsic(ptr, <4 x i1>)

define { <2 x i32>, <2 x i32> } @vpload_factor4_interleaved_mask_intrinsic_skip_fields(ptr %ptr, <2 x i1> %m) {
  %C = icmp ne i16 -32768, 256
  %interleaved.mask = call <8 x i1> @llvm.vector.interleave4.v8i1(<2 x i1> %m, <2 x i1> %m, <2 x i1> zeroinitializer, <2 x i1> zeroinitializer)
  %interleaved.vec = tail call <8 x i32> @llvm.vp.load.v8i32.p0(ptr %ptr, <8 x i1> %interleaved.mask, i32 8)
  %v0 = shufflevector <8 x i32> %interleaved.vec, <8 x i32> poison, <2 x i32> <i32 0, i32 4>
  %v1 = shufflevector <8 x i32> %interleaved.vec, <8 x i32> poison, <2 x i32> <i32 1, i32 5>
  %res0 = insertvalue { <2 x i32>, <2 x i32> } poison, <2 x i32> %v0, 0
  %res1 = insertvalue { <2 x i32>, <2 x i32> } %res0, <2 x i32> %v1, 1
  store i1 %C, ptr @G.7, align 1
  store { <2 x i32>, <2 x i32> } %res1, ptr @G.1, align 8
  ret { <2 x i32>, <2 x i32> } %res1
}

declare { <4 x i32>, <4 x i32> } @vpload_factor2_interleaved_mask_shuffle(ptr, <4 x i1>)

declare { <4 x i32>, <4 x i32> } @vpload_factor2_interleaved_mask_shuffle2(ptr, <2 x i1>)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @vpload_factor3(ptr)

declare { <4 x i32>, <4 x i32> } @vpload_factor3_partial(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @vpload_factor3_v16i32(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @vpload_factor3_mask(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @vpload_factor3_poison_shufflemask(ptr)

declare { <4 x i32>, <4 x i32> } @vpload_factor3_skip_fields(ptr)

declare { <4 x i32>, <4 x i32> } @vpload_factor3_mask_skip_fields(ptr)

declare { <4 x i32>, <4 x i32> } @vpload_factor3_combined_mask_skip_field(ptr, <4 x i1>)

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

declare <4 x i32> @load_factor2_one_active(ptr)

declare <4 x i32> @load_factor3_one_active(ptr)

declare <4 x i32> @load_factor4_one_active(ptr)

declare <4 x i32> @load_factor5_one_active(ptr)

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

declare void @store_factor4_one_active_slidedown(ptr, <4 x i32>)

declare void @store_factor4_one_active_ptr(ptr, <4 x ptr>)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @invalid_vp_mask(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32> } @invalid_vp_evl(ptr)

declare { <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32> } @maskedload_factor5(ptr)

declare void @maskedstore_factor2(ptr, <4 x i32>, <4 x i32>)

declare void @maskedstore_factor3_gap(ptr, <4 x i32>, <4 x i32>, <4 x i32>)

declare void @maskedstore_factor4_gap_with_mask(ptr, <4 x i32>, <4 x i32>, <4 x i32>, <4 x i32>)

define void @maskedstore_factor4_gap_by_intrinsic_with_mask(ptr %ptr, <4 x i32> %v0, <4 x i32> %v1, <4 x i32> %v2, <4 x i32> %v3, <4 x i1> %m) {
  %interleaved.mask = call <16 x i1> @llvm.vector.interleave4.v16i1(<4 x i1> %m, <4 x i1> %m, <4 x i1> zeroinitializer, <4 x i1> zeroinitializer)
  %A = alloca float, align 4
  %s0 = shufflevector <4 x i32> %v0, <4 x i32> %v1, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %B = frem float f0x7F7FFFFF, 1.000000e+00
  store float %B, ptr %A, align 4
  %s1 = shufflevector <4 x i32> %v2, <4 x i32> %v3, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  store float poison, ptr %A, align 4
  %interleaved.vec = shufflevector <8 x i32> %s0, <8 x i32> %s1, <16 x i32> <i32 0, i32 4, i32 8, i32 12, i32 1, i32 5, i32 9, i32 13, i32 2, i32 6, i32 10, i32 14, i32 3, i32 7, i32 11, i32 15>
  tail call void @llvm.masked.store.v16i32.p0(<16 x i32> %interleaved.vec, ptr align 4 %ptr, <16 x i1> %interleaved.mask)
  ret void
}

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
