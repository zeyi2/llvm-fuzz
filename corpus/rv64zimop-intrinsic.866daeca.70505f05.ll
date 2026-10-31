; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zimop,+zhinx -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global bfloat 9.183550e-41
@G.1 = global i1 false
@G.2 = global half 4.200000e+01
@G.3 = global half +qnan
@G.4 = global <8 x i8> splat (i8 -128)
@G.5 = global i32 -1

; Function Attrs: nounwind
declare i64 @mopr0_64(i64) #0

; Function Attrs: nounwind
define i64 @mopr31_64(i64 %a) #0 {
  %tmp = call i64 @llvm.riscv.mopr.i64(i64 %a, i64 31)
  %C = icmp ugt i64 %a, 42
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  store i1 %C, ptr %A, align 1
  ret i64 %tmp
}

; Function Attrs: nounwind
declare i64 @moprr0_64(i64, i64) #0

; Function Attrs: nounwind
define i64 @moprr7_64(i64 %a, i64 %b) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C3 = icmp sge i64 %b, 9223372036854775807
  %LGV1 = load <8 x i8>, ptr @G.4, align 8
  %LGV = load bfloat, ptr @G, align 2
  %tmp = call i64 @llvm.riscv.moprr.i64(i64 %a, i64 %b, i64 7)
  %C = fcmp uge bfloat 9.183550e-41, %LGV
  store i1 %C, ptr @G.1, align 1
  %C2 = icmp ugt <8 x i8> %LGV1, zeroinitializer
  store <8 x i1> %C2, ptr poison, align 1
  store i1 %C3, ptr %A, align 1
  ret i64 %tmp
}

; Function Attrs: nounwind
declare signext i32 @mopr0_32(i32 signext) #0

; Function Attrs: nounwind
declare signext i32 @mopr31_32(i32 signext) #0

; Function Attrs: nounwind
define signext i32 @moprr0_32(i32 signext %a, i32 signext %b) #0 {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %C = icmp ule i32 %b, %a
  %tmp = call i32 @llvm.riscv.moprr.i32(i32 %a, i32 %b, i32 0)
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  store i1 %C, ptr poison, align 1
  ret i32 %tmp

T:                                                ; preds = %0
  %LGV1 = load i32, ptr @G.5, align 4
  %B = mul i32 %a, %LGV1
  store i32 %B, ptr poison, align 4
  br label %BB

F:                                                ; preds = %F, %0
  br i1 %C, label %F, label %BB
}

; Function Attrs: nounwind
define signext i32 @moprr7_32(i32 signext %a, i32 signext %b) #0 {
  %LGV1 = load half, ptr @G.3, align 2
  %LGV = load half, ptr @G.2, align 2
  %C2 = fcmp une half %LGV, %LGV1
  %tmp = call i32 @llvm.riscv.moprr.i32(i32 %a, i32 %b, i32 7)
  store i1 %C2, ptr poison, align 1
  ret i32 %tmp
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.mopr.i32(i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.mopr.i64(i64, i64 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.riscv.moprr.i32(i32, i32, i32 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.riscv.moprr.i64(i64, i64, i64 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
