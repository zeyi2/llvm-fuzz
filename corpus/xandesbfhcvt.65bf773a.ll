; isel-diff-config: -mtriple=riscv32 -target-abi ilp32f -verify-machineinstrs -mattr=+xandesbfhcvt -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global ptr poison
@G.1 = global <8 x i1> zeroinitializer

; Function Attrs: nounwind
declare float @fcvt_s_bf16(bfloat) #0

; Function Attrs: nounwind
define bfloat @fcvt_bf16_s(float %a) #0 {
  %B = fmul bfloat 3.389530e+38, 4.200000e+01
  ret bfloat %B
}

; Function Attrs: nounwind
define void @loadstorebf16(ptr %bf, ptr %sf) #0 {
entry:
  %C = icmp sge <8 x i8> splat (i8 127), splat (i8 42)
  %0 = load bfloat, ptr %bf, align 2
  %G = getelementptr <4 x float>, ptr %bf, i16 0
  %1 = fpext bfloat %0 to float
  store volatile float %1, ptr %sf, align 4
  %2 = load float, ptr %sf, align 4
  %3 = fptrunc float %2 to bfloat
  store volatile bfloat %3, ptr %bf, align 2
  store ptr %G, ptr @G, align 8
  store <8 x i1> %C, ptr @G.1, align 1
  ret void
}

attributes #0 = { nounwind }
