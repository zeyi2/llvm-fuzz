; isel-diff-config: -mtriple=riscv32 -mattr=+zhinx -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i1> splat (i1 true)

declare i16 @ctz_v4i32(<4 x i32>)

define i16 @ctz_v2048i1(<2048 x i1> %a) {
  %res = call i16 @llvm.experimental.cttz.elts.i16.v2048i1(<2048 x i1> %a, i1 false)
  %B = ashr i16 %res, %res
  %C = fcmp ugt float 1.000000e+00, 4.200000e+01
  %E = extractelement <2048 x i1> %a, i1 %C
  store i1 %E, ptr poison, align 1
  ret i16 %B
}

define i32 @ctz_v2i1_poison(<2 x i1> %a) {
  %B = ashr <2 x i1> %a, %a
  %res = call i32 @llvm.experimental.cttz.elts.i32.v2i1(<2 x i1> %a, i1 true)
  store <2 x i1> %B, ptr @G, align 1
  ret i32 %res
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.experimental.cttz.elts.i16.v2048i1(<2048 x i1>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.experimental.cttz.elts.i16.v4i32(<4 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.experimental.cttz.elts.i32.v2i1(<2 x i1>, i1 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
