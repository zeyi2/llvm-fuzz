; isel-diff-config: -mtriple=riscv32 -target-abi=ilp32 -verify-machineinstrs -mattr=+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <32 x i1> zeroinitializer
@G.1 = global i1 false
@G.2 = global <32 x bfloat> splat (bfloat 1.000000e+00)

; Function Attrs: nounwind
define fastcc bfloat @callee(<32 x bfloat> %A) #0 {
  %A3 = alloca <32 x bfloat>, align 64
  store <32 x bfloat> poison, ptr %A3, align 64
  %LGV = load <32 x bfloat>, ptr @G.2, align 64
  %C = fcmp oeq float 1.000000e+00, 4.200000e+01
  %B = extractelement <32 x bfloat> %A, i32 0
  %C1 = fcmp ult <32 x bfloat> %A, splat (bfloat 4.200000e+01)
  %B2 = fsub <32 x bfloat> %A, %LGV
  store i1 %C, ptr @G.1, align 1
  store <32 x i1> %C1, ptr poison, align 4
  store <32 x bfloat> %B2, ptr %A3, align 64
  ret bfloat %B
}

; Function Attrs: nounwind
define bfloat @caller(<32 x bfloat> %A) #0 {
  %C1 = fcmp oge <32 x bfloat> %A, splat (bfloat +qnan)
  %C = call fastcc bfloat @callee(<32 x bfloat> %A)
  store <32 x i1> %C1, ptr @G, align 4
  ret bfloat %C
}

attributes #0 = { nounwind }
