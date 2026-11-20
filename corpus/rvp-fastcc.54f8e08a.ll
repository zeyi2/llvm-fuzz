; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+experimental-p,+zfhmin -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i32 0
@G.1 = global i1 false
@G.2 = global <2 x i16> splat (i16 1)
@G.3 = global <2 x i16> splat (i16 256)
@G.4 = global i1 false

declare fastcc <4 x i8> @callee_v4i8(<4 x i8>, <4 x i8>)

; Function Attrs: nounwind
define fastcc <4 x i8> @caller_v4i8(<4 x i8> %a, <4 x i8> %b) #0 {
  %C3 = icmp sge i64 9223372036854775807, 0
  %LGV = load i32, ptr @G, align 4
  %C = icmp ne i32 %LGV, 0
  %r = call fastcc <4 x i8> @callee_v4i8(<4 x i8> %b, <4 x i8> %a)
  store i1 %C, ptr @G.1, align 1
  store i1 %C3, ptr @G.4, align 1
  ret <4 x i8> %r
}

define fastcc <2 x i16> @callee_v2i16(<2 x i16> %a, <2 x i16> %b) {
  %LGV = load <2 x i16>, ptr @G.2, align 4
  %r = add <2 x i16> %a, %b
  %B = srem <2 x i16> %a, %LGV
  store <2 x i16> %B, ptr @G.3, align 4
  ret <2 x i16> %r
}

; Function Attrs: nounwind
define fastcc <2 x i16> @caller_v2i16(<2 x i16> %a, <2 x i16> %b) #0 {
  %C = icmp slt i1 false, true
  %r = call fastcc <2 x i16> @callee_v2i16(<2 x i16> %b, <2 x i16> %a)
  store i1 %C, ptr poison, align 1
  ret <2 x i16> %r
}

declare fastcc <8 x i8> @callee_v8i8(<8 x i8>, <8 x i8>)

; Function Attrs: nounwind
declare fastcc <8 x i8> @caller_v8i8(<8 x i8>, <8 x i8>) #0

declare fastcc <4 x i16> @callee_v4i16(<4 x i16>, <4 x i16>)

; Function Attrs: nounwind
declare fastcc <4 x i16> @caller_v4i16(<4 x i16>, <4 x i16>) #0

define fastcc <2 x i32> @callee_v2i32(<2 x i32> %a, <2 x i32> %b) {
  %r = add <2 x i32> %a, %b
  br label %BB

BB:                                               ; preds = %0
  ret <2 x i32> %r
}

; Function Attrs: nounwind
define fastcc <2 x i32> @caller_v2i32(<2 x i32> %a, <2 x i32> %b) #0 {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %E = extractelement <2 x i32> %b, i1 false
  %r = call fastcc <2 x i32> @callee_v2i32(<2 x i32> %b, <2 x i32> %a)
  store i32 %E, ptr %A, align 4
  ret <2 x i32> %r
}

define fastcc <2 x i32> @callee_v2i32_split(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, <2 x i32> %a, <2 x i32> %b) {
  %r = add <2 x i32> %a, %b
  %B = shl <2 x i32> %r, %a
  store <2 x i32> %B, ptr poison, align 8
  ret <2 x i32> %r
}

declare fastcc <2 x i32> @callee_v2i32_stack(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, <2 x i32>, <2 x i32>)

declare fastcc <4 x i8> @callee_v4i8_stack_align(i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, half, <4 x i8>)

attributes #0 = { nounwind }
