; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+zvkb -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i32> splat (i32 42)

declare fastcc <4 x i8> @callee_v4i8(<4 x i8>, <4 x i8>)

; Function Attrs: nounwind
declare fastcc <4 x i8> @caller_v4i8(<4 x i8>, <4 x i8>) #0

declare fastcc <2 x i16> @callee_v2i16(<2 x i16>, <2 x i16>)

; Function Attrs: nounwind
declare fastcc <2 x i16> @caller_v2i16(<2 x i16>, <2 x i16>) #0

declare fastcc <8 x i8> @callee_v8i8(<8 x i8>, <8 x i8>)

; Function Attrs: nounwind
declare fastcc <8 x i8> @caller_v8i8(<8 x i8>, <8 x i8>) #0

declare fastcc <4 x i16> @callee_v4i16(<4 x i16>, <4 x i16>)

; Function Attrs: nounwind
declare fastcc <4 x i16> @caller_v4i16(<4 x i16>, <4 x i16>) #0

declare fastcc <2 x i32> @callee_v2i32(<2 x i32>, <2 x i32>)

; Function Attrs: nounwind
define fastcc <2 x i32> @caller_v2i32(<2 x i32> %a, <2 x i32> %b) #0 {
  %r = call fastcc <2 x i32> @callee_v2i32(<2 x i32> %b, <2 x i32> %a)
  store <2 x i32> %r, ptr @G, align 8
  ret <2 x i32> %r
}

declare fastcc <2 x i32> @callee_v2i32_split(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, <2 x i32>, <2 x i32>)

declare fastcc <2 x i32> @callee_v2i32_stack(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, <2 x i32>, <2 x i32>)

declare fastcc <4 x i8> @callee_v4i8_stack_align(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, half, <4 x i8>)

attributes #0 = { nounwind }
