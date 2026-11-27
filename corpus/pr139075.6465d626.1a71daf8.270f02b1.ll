; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+zvl16384b,+zfa,+zvkb,+zbb -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global half 4.200000e+01
@G.1 = global ptr poison
@G.2 = global i32 1
@G.3 = global i1 false
@G.4 = global float 1.401300e-45
@G.5 = global i1 true
@G.6 = global ptr poison
@G.7 = global i128 -1
@G.8 = global ptr poison
@G.9 = global i1 true
@G.10 = global <4 x i32> splat (i32 42)

define void @a(ptr %0, ptr %1) {
  %A10 = alloca i1, align 1
  store i1 true, ptr %A10, align 1
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i1, ptr @G.5, align 1
  %LGV5 = load i128, ptr @G.7, align 4
  %C8 = fcmp oeq float +inf, 1.000000e+00
  %G4 = getelementptr inbounds ptr, ptr %1, i1 false
  %L1 = load i8, ptr %G4, align 1
  %L = load i128, ptr %G4, align 4
  %LGV1 = load float, ptr @G.4, align 4
  %G2 = getelementptr ptr, ptr %G4, i8 %L1
  %C2 = fcmp ueq float 1.401300e-45, %LGV1
  %I = insertelement <4 x i32> zeroinitializer, i32 0, i64 0
  %G10 = getelementptr i128, ptr %0, i32 0
  %L8 = load i1, ptr %G10, align 1
  %C6 = icmp sle i128 %L, %LGV5
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %G2, ptr align 4 %1, i64 2048, i1 false)
  %G = getelementptr half, ptr %0, i1 true
  %L3 = load i64, ptr %G, align 4
  %C = icmp ule i64 %L3, 9223372036854775807
  store ptr %G, ptr @G.1, align 8
  store i1 %C8, ptr @G.3, align 1
  store i1 %C6, ptr @G.3, align 1
  store i1 %C2, ptr @G.5, align 1
  store ptr %G4, ptr @G.6, align 8
  store ptr %G10, ptr @G.8, align 8
  store i1 %C, ptr @G.9, align 1
  store <4 x i32> %I, ptr @G.10, align 16
  %L9 = load i1, ptr %A, align 1
  br i1 %L9, label %T, label %F

BB:                                               ; preds = %F, %T
  ret void

T:                                                ; preds = %2
  br label %BB

F:                                                ; preds = %F, %2
  %L11 = load i1, ptr %A10, align 1
  br i1 %L11, label %BB, label %F
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
