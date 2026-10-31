; isel-diff-config: -mtriple=riscv32 -mattr=+unaligned-scalar-mem,+zvfh,+zfh -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -1

; Function Attrs: nounwind
declare void @unaligned_memcpy0(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy1(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy2(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy3(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy4(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @unaligned_memcpy7(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %LGV = load i32, ptr @G, align 4
  %G = getelementptr ptr, ptr %dest, i32 %LGV
  tail call void @llvm.memcpy.p0.p0.i64(ptr %dest, ptr %G, i64 7, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @unaligned_memcpy8(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy15(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy16(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy31(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy0(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy1(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy2(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy3(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy4(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy7(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy8(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy15(ptr captures(none), ptr) #0

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
