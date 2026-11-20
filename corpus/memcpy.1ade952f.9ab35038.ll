; isel-diff-config: -mtriple=riscv32 -mcpu=chipsalliance-veer-eh1 -mtune=rocket -verify-machineinstrs -mattr=+zicsr -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 0
@G.1 = global ptr poison
@G.2 = global i128 -1
@G.3 = global ptr poison
@G.4 = global i64 -9223372036854775808
@G.5 = global i32 0

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
  %G2 = getelementptr <4 x float>, ptr %G, i16 256
  store ptr %G2, ptr @G.3, align 8
  ret void
}

; Function Attrs: nounwind
declare void @unaligned_memcpy4(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy7(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy8(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy15(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy16(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy31(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @aligned_memcpy0(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i64, ptr @G.4, align 4
  %G = getelementptr ptr, ptr %dest, i1 true
  %C = icmp uge i64 1, %LGV
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 8 %dest, ptr align 8 %src, i64 0, i1 false)
  store ptr %G, ptr poison, align 8
  store i1 %C, ptr %A, align 1
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
  %LGV = load i32, ptr @G.5, align 4
  %G = getelementptr i128, ptr %src, i1 false
  %G1 = getelementptr ptr, ptr %src, i16 32767
  %G2 = getelementptr bfloat, ptr %G1, i32 %LGV
  store ptr %G, ptr %G1, align 8
  tail call void %G2(ptr align 8 %dest, ptr align 8 %src, i64 4, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @aligned_memcpy7(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy8(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @aligned_memcpy15(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %G4 = getelementptr i8, ptr %src, i32 1
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %G = getelementptr ptr, ptr %dest, i16 0
  %G3 = getelementptr bfloat, ptr %src, i32 42
  tail call void @llvm.memcpy.p0.p0.i64(ptr align 8 %G, ptr align 8 %src, i64 15, i1 false)
  store ptr %G3, ptr %A, align 8
  store ptr %G4, ptr @G.1, align 8
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
