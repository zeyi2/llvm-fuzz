; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+xsfmmbase,+zcb,+zdinx -O1 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global ptr poison

define dso_local void @test_sf_vlte32(i32 %tss, ptr %base, i32 %vl) {
entry:
  call void @llvm.riscv.sf.vlte32.i32(i32 %tss, ptr %base, i32 %vl)
  %G = getelementptr i32, ptr %base, i32 %tss
  %B = and i64 0, 9223372036854775807
  %G1 = getelementptr i128, ptr %base, i32 %vl
  store ptr %G1, ptr poison, align 8
  store ptr %G, ptr @G, align 8
  store i64 %B, ptr %G, align 4
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.riscv.sf.vlte32.i32(i32, ptr captures(none), i32) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn }
