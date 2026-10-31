; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+xsfmmbase,+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 -1
@G.1 = global i1 true

define dso_local void @test_sf_vlte16(i32 %tss, ptr %base, i32 %vl) {
entry:
  call void @llvm.riscv.sf.vlte16.i32(i32 %tss, ptr %base, i32 %vl)
  %LGV = load i32, ptr @G, align 4
  %C = icmp ult i32 %LGV, %vl
  %G = getelementptr i1, ptr %base, i1 %C
  store i1 %C, ptr %G, align 1
  %C3 = fcmp true half 4.200000e+01, +inf
  store i1 %C3, ptr @G.1, align 1
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.riscv.sf.vlte16.i32(i32, ptr captures(none), i32) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn }
