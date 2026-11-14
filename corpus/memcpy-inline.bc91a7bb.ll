; isel-diff-config: -mtriple=riscv64 -mattr=+a -O2 -code-model=small -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> zeroinitializer
@G.1 = global <4 x float> splat (float 1.000000e+00)

; Function Attrs: nounwind
declare void @unaligned_memcpy0(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy1(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @unaligned_memcpy2(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %B = fdiv <4 x float> zeroinitializer, splat (float 4.200000e+01)
  tail call void @llvm.memcpy.inline.p0.p0.i64(ptr %dest, ptr %src, i64 2, i1 false)
  store <4 x float> %B, ptr @G.1, align 16
  ret void
}

; Function Attrs: nounwind
declare void @unaligned_memcpy3(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy4(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @unaligned_memcpy7(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %G = getelementptr ptr, ptr %dest, i64 -1
  tail call void @llvm.memcpy.inline.p0.p0.i64(ptr %dest, ptr %src, i64 7, i1 false)
  store ptr %G, ptr %A, align 8
  ret void
}

; Function Attrs: nounwind
define void @unaligned_memcpy8(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %LGV = load <2 x i64>, ptr @G, align 16
  tail call void @llvm.memcpy.inline.p0.p0.i64(ptr %dest, ptr %src, i64 8, i1 false)
  %B = mul <2 x i64> splat (i64 -1), %LGV
  store <2 x i64> %B, ptr poison, align 16
  ret void
}

; Function Attrs: nounwind
declare void @unaligned_memcpy15(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memcpy16(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @unaligned_memcpy31(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  tail call void @llvm.memcpy.inline.p0.p0.i64(ptr %dest, ptr %src, i64 31, i1 false)
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  ret void

T:                                                ; preds = %T, %entry
  br i1 %L, label %T, label %BB

F:                                                ; preds = %entry
  br label %BB
}

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
define void @aligned_memcpy31(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %G = getelementptr i64, ptr %src, i1 true
  tail call void @llvm.memcpy.inline.p0.p0.i64(ptr align 8 %G, ptr align 8 %src, i64 31, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @memcpy16_align4(ptr captures(none), ptr captures(none)) #0

declare i32 @memcpy11_align8(ptr captures(none), ptr)

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.inline.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.inline.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
