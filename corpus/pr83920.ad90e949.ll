; isel-diff-config: -mtriple=riscv64 -mattr=+v,+d -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

define i8 @or_load_combine(ptr %p) {
  %load = load <2 x i8>, ptr %p, align 2
  %E = extractelement <2 x i8> %load, i128 42
  %or = or i8 %E, 1
  ret i8 %or
}
