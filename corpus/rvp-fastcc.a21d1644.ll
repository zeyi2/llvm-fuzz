; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+zfa,+xtheadba -O0 -code-model=medium
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i8> splat (i8 127)
@G.1 = global <4 x i1> splat (i1 true)
@G.2 = global float f0x7F7FFFFF
@G.3 = global i1 false

define fastcc <4 x i8> @callee_v4i8(<4 x i8> %a, <4 x i8> %b) {
  %LGV = load <4 x i8>, ptr @G, align 4
  %C = icmp uge <4 x i8> %b, %LGV
  %r = add <4 x i8> %a, %b
  store <4 x i1> %C, ptr @G.1, align 1
  ret <4 x i8> %r
}

; Function Attrs: nounwind
define fastcc <4 x i8> @caller_v4i8(<4 x i8> %a, <4 x i8> %b) #0 {
  %LGV1 = load float, ptr @G.2, align 4
  %C = fcmp olt float 1.401300e-45, %LGV1
  %r = call fastcc <4 x i8> @callee_v4i8(<4 x i8> %b, <4 x i8> %a)
  store i1 %C, ptr @G.3, align 1
  ret <4 x i8> %r
}

declare fastcc <2 x i16> @callee_v2i16(<2 x i16>, <2 x i16>)

; Function Attrs: nounwind
declare fastcc <2 x i16> @caller_v2i16(<2 x i16>, <2 x i16>) #0

declare fastcc <8 x i8> @callee_v8i8(<8 x i8>, <8 x i8>)

; Function Attrs: nounwind
declare fastcc <8 x i8> @caller_v8i8(<8 x i8>, <8 x i8>) #0

declare fastcc <4 x i16> @callee_v4i16(<4 x i16>, <4 x i16>)

; Function Attrs: nounwind
define fastcc <4 x i16> @caller_v4i16(<4 x i16> %a, <4 x i16> %b) #0 {
  %A = alloca <4 x i16>, align 8
  store <4 x i16> poison, ptr %A, align 8
  %r = call fastcc <4 x i16> @callee_v4i16(<4 x i16> %b, <4 x i16> %a)
  %B = sdiv <4 x i16> %r, %a
  store <4 x i16> %B, ptr %A, align 8
  ret <4 x i16> %r
}

declare fastcc <2 x i32> @callee_v2i32(<2 x i32>, <2 x i32>)

; Function Attrs: nounwind
declare fastcc <2 x i32> @caller_v2i32(<2 x i32>, <2 x i32>) #0

declare fastcc <2 x i32> @callee_v2i32_split(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, <2 x i32>, <2 x i32>)

declare fastcc <2 x i32> @callee_v2i32_stack(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, <2 x i32>, <2 x i32>)

declare fastcc <4 x i8> @callee_v4i8_stack_align(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, half, <4 x i8>)

attributes #0 = { nounwind }
