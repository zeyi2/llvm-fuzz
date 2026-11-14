; isel-diff-config: -mtriple=riscv64 -target-abi lp64 -verify-machineinstrs -mattr=+zfh -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global float +qnan
@G.1 = global i1 false
@G.2 = global half 4.200000e+01
@G.3 = global float +qnan
@G.4 = global i1 false

; Function Attrs: nounwind
declare half @fneg(half) #0

; Function Attrs: nounwind
declare half @fabs(half) #0

; Function Attrs: nounwind
define half @fcopysign_fneg(half %a, half %b) #0 {
  %LGV1 = load float, ptr @G.3, align 4
  %LGV = load float, ptr @G, align 4
  %C2 = fcmp ule float %LGV, %LGV1
  %B = fdiv half %b, +inf
  %1 = fneg half %B
  %2 = call half @llvm.copysign.f16(half %a, half %1)
  %C = fcmp ugt float %LGV, 1.000000e+00
  store i1 %C2, ptr @G.1, align 1
  store i1 %C, ptr @G.4, align 1
  ret half %2
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.copysign.f16(half, half) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.fabs.f16(half) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
