; isel-diff-config: -mtriple=riscv32 -mcpu=chipsalliance-veer-eh1 -mtune=rocket -mattr=+zihintpause -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 0
@G.1 = global ptr poison
@G.2 = global i128 -1
@G.3 = global ptr poison

; Function Attrs: nounwind
declare void @unaligned_memcpy0(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy1(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy2(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @unaligned_memcpy3(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %G = getelementptr i1, ptr %src, i64 -1
  tail call void @llvm.memcpy.p0.p0.i64(ptr %G, ptr %src, i64 3, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @unaligned_memcpy4(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @unaligned_memcpy7(ptr captures(none) %dest, ptr %src) #0 {
entry:
  tail call void @llvm.memcpy.p0.p0.i64(ptr %dest, ptr %src, i64 7, i1 false)
  %G = getelementptr float, ptr %dest, i64 -9223372036854775808
  store ptr %G, ptr @G.3, align 8
  ret void
}

; Function Attrs: nounwind
declare void @unaligned_memcpy8(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy15(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy16(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @unaligned_memcpy31(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %LGV = load i32, ptr @G, align 4
  tail call void @llvm.memcpy.p0.p0.i64(ptr %dest, ptr %src, i64 31, i1 false)
  %G = getelementptr i16, ptr %src, i32 %LGV
  store ptr %G, ptr @G.1, align 8
  ret void
}

; Function Attrs: nounwind
define void @aligned_memcpy0(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %G = getelementptr ptr, ptr %dest, i1 true
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 8 %dest, ptr align 8 %src, i64 0, i1 false)
  store ptr %G, ptr poison, align 8
  ret void
}

; Function Attrs: nounwind
declare void @aligned_memcpy1(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy2(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy3(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @aligned_memcpy4(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %G = getelementptr i128, ptr %src, i1 false
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 8 %dest, ptr align 8 %src, i64 4, i1 false)
  store ptr %G, ptr @G.1, align 8
  ret void
}

; Function Attrs: nounwind
declare void @aligned_memcpy7(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy8(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @aligned_memcpy15(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %G = getelementptr ptr, ptr %dest, i16 0
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 8 %G, ptr align 8 %src, i64 15, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @aligned_memcpy16(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy31(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @memcpy16_align4(ptr captures(none), ptr captures(none)) #0

declare i32 @memcpy11_align8(ptr captures(none), ptr)

; Function Attrs: nounwind
declare void @memcpy_i32_var(ptr, ptr, i32) #0

; Function Attrs: nounwind
declare void @memcpy_i32_2147483648(ptr, ptr) #0

; Function Attrs: nounwind
declare void @memcpy_i64_var(ptr, ptr, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
