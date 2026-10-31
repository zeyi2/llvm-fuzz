; isel-diff-config: -mtriple=riscv64 -mattr=+zicond -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -2147483648

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
  %LGV = load i32, ptr @G, align 4
  tail call void @llvm.memcpy.inline.p0.p0.i64(ptr align 8 %dest, ptr align 8 %src, i64 0, i1 false)
  %G = getelementptr ptr, ptr %src, i32 %LGV
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
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  tail call void @llvm.memcpy.inline.p0.p0.i64(ptr align 8 %dest, ptr align 8 %src, i64 4, i1 false)
  ret void

T:                                                ; preds = %entry
  br label %BB

F:                                                ; preds = %F, %entry
  br i1 %L, label %BB, label %F
}

; Function Attrs: nounwind
declare void @aligned_memcpy7(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @aligned_memcpy8(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %T
  tail call void @llvm.memcpy.inline.p0.p0.i64(ptr align 8 %dest, ptr align 8 %src, i64 8, i1 false)
  ret void

T:                                                ; preds = %entry
  br label %BB

F:                                                ; preds = %entry
  ret void
}

; Function Attrs: nounwind
declare void @aligned_memcpy15(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy16(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memcpy31(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @memcpy16_align4(ptr captures(none), ptr captures(none)) #0

define i32 @memcpy11_align8(ptr captures(none) %dest, ptr %src) {
entry:
  %G = getelementptr half, ptr %src, i8 1
  call void @llvm.memcpy.inline.p0.p0.i32(ptr align 8 %G, ptr align 8 %src, i32 11, i1 false)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.inline.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.inline.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
