; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+v,+unaligned-scalar-mem,+unaligned-vector-mem,+f,+c,+zvkb,+zfhmin -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x float> splat (float 1.000000e+00)
@G.2 = global <4 x i32> splat (i32 2147483647)
@G.3 = global <4 x i32> zeroinitializer
@G.1 = global i8 1
@G.4 = global i1 false

; Function Attrs: nounwind
declare void @memset_1(ptr, i8) #0

; Function Attrs: nounwind
declare void @memset_2(ptr, i8) #0

; Function Attrs: nounwind
declare void @memset_4(ptr, i8) #0

; Function Attrs: nounwind
declare void @memset_8(ptr, i8) #0

; Function Attrs: nounwind
declare void @memset_16(ptr, i8) #0

; Function Attrs: nounwind
declare void @memset_32(ptr, i8) #0

; Function Attrs: nounwind
declare void @memset_64(ptr, i8) #0

; Function Attrs: nounwind
declare void @aligned_memset_2(ptr align 2, i8) #0

; Function Attrs: nounwind
declare void @aligned_memset_4(ptr align 4, i8) #0

; Function Attrs: nounwind
declare void @aligned_memset_8(ptr align 8, i8) #0

; Function Attrs: nounwind
declare void @aligned_memset_16(ptr align 16, i8) #0

; Function Attrs: nounwind
declare void @aligned_memset_32(ptr align 32, i8) #0

; Function Attrs: nounwind
declare void @aligned_memset_64(ptr align 64, i8) #0

; Function Attrs: nounwind
declare void @memset_zero_1(ptr) #0

; Function Attrs: nounwind
declare void @memset_zero_2(ptr) #0

; Function Attrs: nounwind
declare void @memset_zero_4(ptr) #0

; Function Attrs: nounwind
declare void @memset_zero_8(ptr) #0

; Function Attrs: nounwind
define void @memset_zero_16(ptr %a) #0 {
  %LGV1 = load i8, ptr @G.1, align 1
  %LGV = load <4 x i32>, ptr @G.2, align 16
  %B = xor <4 x i32> splat (i32 -1), %LGV
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 0, i64 16, i1 false)
  %B2 = sdiv i8 42, %LGV1
  store <4 x i32> %B, ptr @G.3, align 16
  store i8 %B2, ptr poison, align 1
  ret void
}

; Function Attrs: nounwind
declare void @memset_zero_32(ptr) #0

; Function Attrs: nounwind
declare void @memset_zero_64(ptr) #0

; Function Attrs: nounwind
define void @aligned_memset_zero_2(ptr %a) #0 {
  %E = extractelement <8 x i8> splat (i8 -1), i8 -1
  tail call void @llvm.memset.inline.p0.i64(ptr align 2 %a, i8 %E, i64 2, i1 false)
  %C = icmp ule i8 %E, 0
  store i1 %C, ptr @G.4, align 1
  ret void
}

; Function Attrs: nounwind
declare void @aligned_memset_zero_4(ptr) #0

; Function Attrs: nounwind
declare void @aligned_memset_zero_8(ptr) #0

; Function Attrs: nounwind
declare void @aligned_memset_zero_16(ptr) #0

; Function Attrs: nounwind
declare void @aligned_memset_zero_32(ptr) #0

; Function Attrs: nounwind
declare void @aligned_memset_zero_64(ptr) #0

; Function Attrs: nounwind
declare void @aligned_memset_zero_66(ptr) #0

; Function Attrs: nounwind
declare void @aligned_memset_zero_96(ptr) #0

; Function Attrs: nounwind
declare void @aligned_memset_zero_128(ptr) #0

; Function Attrs: nounwind
define void @aligned_memset_zero_256(ptr %a) #0 {
  %B = fsub <4 x float> splat (float 1.000000e+00), splat (float 1.000000e+00)
  tail call void @llvm.memset.inline.p0.i64(ptr align 64 %a, i8 0, i64 256, i1 false)
  store <4 x float> %B, ptr @G, align 16
  %C = fcmp ule <4 x float> %B, splat (float 1.401300e-45)
  store <4 x i1> %C, ptr poison, align 1
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.memset.inline.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
