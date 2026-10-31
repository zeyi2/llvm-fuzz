; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zbb,+zhinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 16
@G.1 = global i8 -1

declare <8 x i8> @insert_zero_v4i8(<4 x i8>)

define <4 x i16> @insert_zero_v2i16(<2 x i16> %v) {
  %LGV1 = load i8, ptr @G.1, align 1
  %LGV = load i8, ptr @G, align 1
  %C = icmp slt i8 %LGV, %LGV1
  %r = call <4 x i16> @llvm.vector.insert.v4i16.v2i16(<4 x i16> zeroinitializer, <2 x i16> %v, i64 0)
  store i1 %C, ptr poison, align 1
  ret <4 x i16> %r
}

define <2 x i32> @insert_zero_v1i32(<1 x i32> %v) {
  %r = call <2 x i32> @llvm.vector.insert.v2i32.v1i32(<2 x i32> zeroinitializer, <1 x i32> %v, i64 0)
  %C = fcmp ult bfloat 4.200000e+01, 3.389530e+38
  store i1 %C, ptr poison, align 1
  ret <2 x i32> %r
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i32> @llvm.vector.insert.v2i32.v1i32(<2 x i32>, <1 x i32>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.vector.insert.v4i16.v2i16(<4 x i16>, <2 x i16>, i64 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i8> @llvm.vector.insert.v8i8.v4i8(<8 x i8>, <4 x i8>, i64 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
