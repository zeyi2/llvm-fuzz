; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+v,+unaligned-scalar-mem,+c,+zvkb,+zfhmin -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x float> splat (float 1.000000e+00)
@G.2 = global <4 x i32> splat (i32 2147483647)
@G.3 = global <4 x i32> zeroinitializer
@G.1 = global i8 1
@G.4 = global i1 false
@G.5 = global i32 1
@G.6 = global ptr poison
@G.7 = global <4 x i32> splat (i32 -2147483648)
@G.8 = global i16 0
@G.9 = global i64 -1
@G.10 = global ptr poison
@G.11 = global <8 x i8> splat (i8 -128)

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
  %A1 = alloca i1, align 1
  store i1 false, ptr %A1, align 1
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV1 = load i8, ptr @G.1, align 1
  %LGV = load <4 x i32>, ptr @G.2, align 16
  %B = xor <4 x i32> splat (i32 -1), %LGV
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 0, i64 16, i1 false)
  %B2 = sdiv i8 %LGV1, 42
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %LGV3 = load <8 x i8>, ptr @G.11, align 8
  %C = icmp ult <8 x i8> splat (i8 -1), %LGV3
  store <4 x i32> %B, ptr @G.3, align 16
  store i8 %B2, ptr poison, align 1
  store <8 x i1> %C, ptr %A1, align 1
  ret void

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %L2 = load i1, ptr %A1, align 1
  br i1 %L2, label %F, label %BB
}

; Function Attrs: nounwind
declare void @memset_zero_32(ptr) #0

; Function Attrs: nounwind
declare void @memset_zero_64(ptr) #0

; Function Attrs: nounwind
define void @aligned_memset_zero_2(ptr %a) #0 {
  %LGV3 = load i16, ptr @G.8, align 2
  %G = getelementptr double, ptr %a, i16 %LGV3
  %LGV = load <4 x i32>, ptr @G.7, align 16
  %E = extractelement <8 x i8> splat (i8 -1), i8 -1
  %E2 = extractelement <4 x i32> %LGV, i8 %E
  tail call void @llvm.memset.inline.p0.i64(ptr align 2 %a, i8 %E, i64 2, i1 false)
  %C = icmp ule i8 %E, 0
  %C1 = icmp uge i1 %C, true
  store i1 %C1, ptr @G.4, align 1
  store i32 %E2, ptr %G, align 4
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
  %LGV3 = load i64, ptr @G.9, align 4
  %LGV2 = load i32, ptr @G.5, align 4
  %G = getelementptr <4 x i32>, ptr %a, i32 %LGV2
  %B = fsub <4 x float> splat (float 1.000000e+00), splat (float 1.000000e+00)
  tail call void @llvm.memset.inline.p0.i64(ptr align 64 %a, i8 0, i64 256, i1 false)
  store <4 x float> %B, ptr @G, align 16
  %C = fcmp ule <4 x float> %B, splat (float 1.401300e-45)
  store <4 x i1> %C, ptr poison, align 1
  store ptr %G, ptr @G.6, align 8
  %G4 = getelementptr ptr, ptr %a, i64 %LGV3
  store ptr %G4, ptr @G.10, align 8
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.memset.inline.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
