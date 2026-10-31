; isel-diff-config: -mtriple=riscv32 -mattr=+zihintpause,+zhinx -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global bfloat 3.389530e+38
@G.2 = global i16 256

; Function Attrs: nounwind
declare void @unaligned_memmove0(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memmove1(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memmove2(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memmove3(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memmove4(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memmove7(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memmove8(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @unaligned_memmove15(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %LGV = load i1, ptr @G, align 1
  %L = load i1, ptr %A, align 1
  switch i1 %L, label %SW_D [
    i1 true, label %SW_C
    i1 false, label %SW_C1
  ]

BB:                                               ; preds = %SW_C
  tail call void @llvm.memmove.p0.p0.i64(ptr %dest, ptr %src, i64 15, i1 false)
  ret void

SW_D:                                             ; preds = %entry
  ret void

SW_C:                                             ; preds = %entry
  br label %BB

SW_C1:                                            ; preds = %entry
  ret void
}

; Function Attrs: nounwind
declare void @unaligned_memmove16(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @unaligned_memmove31(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memmove0(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memmove1(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memmove2(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @aligned_memmove3(ptr captures(none) %dest, ptr %src) #0 {
entry:
  %A = alloca i16, align 2
  store i16 poison, ptr %A, align 2
  %LGV = load i16, ptr @G.2, align 2
  %B = srem i16 -32768, %LGV
  tail call void @llvm.memmove.p0.p0.i64(ptr align 8 %dest, ptr align 8 %src, i64 3, i1 false)
  store i16 %B, ptr %A, align 2
  ret void
}

; Function Attrs: nounwind
declare void @aligned_memmove4(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memmove7(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memmove8(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memmove15(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memmove16(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memmove31(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @memmove16_align4(ptr captures(none), ptr captures(none)) #0

define i32 @memmove11_align8(ptr captures(none) %dest, ptr %src) {
entry:
  call void @llvm.memmove.p0.p0.i64(ptr align 8 %dest, ptr align 8 %src, i64 11, i1 false)
  %C = icmp ne i8 1, 127
  store i1 %C, ptr @G, align 1
  ret i32 0
}

; Function Attrs: nounwind
declare void @unaligned_memmove7_volatile(ptr captures(none), ptr) #0

; Function Attrs: nounwind
declare void @aligned_memmove7_volatile(ptr captures(none), ptr) #0

; Function Attrs: nounwind
define void @memmove_i32_var(ptr %dest, ptr %src, i32 %n) #0 {
entry:
  call void @llvm.memmove.p0.p0.i32(ptr %dest, ptr %src, i32 %n, i1 false)
  %G2 = getelementptr i128, ptr %src, i32 %n
  %G = getelementptr bfloat, ptr %dest, i8 16
  store ptr %G, ptr poison, align 8
  store ptr %G2, ptr %G, align 8
  ret void
}

; Function Attrs: nounwind
declare void @memmove_i32_2147483648(ptr, ptr) #0

; Function Attrs: nounwind
declare void @memmove_i64_var(ptr, ptr, i64) #0

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i32(ptr writeonly captures(none), ptr readonly captures(none), i32, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr writeonly captures(none), ptr readonly captures(none), i64, i1 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
