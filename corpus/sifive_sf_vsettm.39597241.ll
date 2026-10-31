; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+xsfmmbase,+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true

define i32 @test_sf_vsettm(i32 %tm) {
entry:
  %LGV = load i1, ptr @G, align 1
  %0 = call i32 @llvm.riscv.sf.vsettm.i32(i32 %tm, i32 0, i32 3)
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  ret i32 %0

T:                                                ; preds = %entry
  br label %BB

F:                                                ; preds = %entry
  br label %BB
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.riscv.sf.vsettm.i32(i32, i32 immarg, i32 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(none) }
