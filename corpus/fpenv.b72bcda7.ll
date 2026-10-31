; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zfinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global i1 true
@G.2 = global <4 x i32> splat (i32 42)
@G.3 = global <2 x i64> splat (i64 1)
@G.4 = global <2 x i1> splat (i1 true)

declare i32 @func_01()

; Function Attrs: strictfp
define i1 @test_get_rounding_sideeffect() #0 {
entry:
  %call = tail call i32 @fesetround(i32 noundef 1) #0
  %0 = tail call i32 @llvm.get.rounding() #0
  %cmp.not = icmp eq i32 %0, 0
  br i1 %cmp.not, label %if.end, label %return

if.end:                                           ; preds = %entry
  %call1 = tail call i32 @fesetround(i32 noundef 0) #0
  %1 = tail call i32 @llvm.get.rounding() #0
  br label %return

return:                                           ; preds = %if.end, %entry
  %LGV1 = load i1, ptr @G.1, align 1
  %LGV = load i1, ptr @G, align 1
  %B = shl i1 %LGV, %LGV1
  ret i1 %B
}

define void @func_02(i32 %rm) {
  call void @llvm.set.rounding(i32 %rm)
  %B = and i128 18446744073709551616, 170141183460469231731687303715884105727
  store i128 %B, ptr poison, align 4
  ret void
}

define void @func_03() {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %B = ashr i32 65536, -2147483648
  call void @llvm.set.rounding(i32 0)
  store i32 %B, ptr %A, align 4
  ret void
}

declare void @func_04()

define void @func_05() {
  %LGV1 = load <2 x i64>, ptr @G.3, align 16
  %C = icmp uge <2 x i64> splat (i64 -1), %LGV1
  call void @llvm.set.rounding(i32 2)
  store <2 x i1> %C, ptr @G.4, align 1
  ret void
}

define void @func_06() {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i1, ptr @G.1, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  call void @llvm.set.rounding(i32 3)
  ret void

T:                                                ; preds = %T, %0
  %LGV1 = load i1, ptr @G, align 1
  br i1 %LGV, label %T, label %BB

F:                                                ; preds = %0
  br label %BB
}

define void @func_07() {
  %LGV1 = load <4 x i32>, ptr @G.2, align 16
  %B = and <4 x i32> zeroinitializer, %LGV1
  call void @llvm.set.rounding(i32 4)
  store <4 x i32> %B, ptr poison, align 16
  ret void
}

declare i32 @fesetround(i32 noundef)

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare i32 @llvm.get.rounding() #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.set.rounding(i32) #1

attributes #0 = { strictfp }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
