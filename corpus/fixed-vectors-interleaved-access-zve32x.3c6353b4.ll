; isel-diff-config: -mtriple=riscv64 -mattr=+m,+zve64x,+zvl1024b,+zhinx,+zbs -O3 -code-model=small -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 2147483647)

define <4 x i1> @load_large_vector(ptr %p) {
  %l = load <12 x ptr>, ptr %p, align 128
  %B = xor <4 x i32> zeroinitializer, zeroinitializer
  %s1 = shufflevector <12 x ptr> %l, <12 x ptr> poison, <4 x i32> <i32 0, i32 3, i32 6, i32 9>
  %s2 = shufflevector <12 x ptr> %l, <12 x ptr> poison, <4 x i32> <i32 1, i32 4, i32 7, i32 10>
  %ret = icmp ne <4 x ptr> %s1, %s2
  store <4 x i32> %B, ptr @G, align 16
  ret <4 x i1> %ret
}
