; isel-diff-config: --mtriple=riscv64 -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 2147483647)
@G.1 = global <4 x i32> splat (i32 2147483647)

define i32 @f() #0 {
entry:
  %B = add <4 x i32> splat (i32 -2147483648), splat (i32 65536)
  %B1 = add <4 x i32> %B, %B
  %E = extractelement <4 x i32> %B, i16 32767
  store <4 x i32> %B, ptr @G, align 16
  store <4 x i32> %B1, ptr @G.1, align 16
  ret i32 %E
}

attributes #0 = { "hw-shadow-stack" }

!llvm.module.flags = !{!1}

!1 = !{i32 8, !"cf-protection-return", i32 1}
