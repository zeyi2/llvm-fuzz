; isel-diff-config: -mtriple=riscv64 -mattr=+m,+v,+d,+zbs -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i64 -9223372036854775808

define <vscale x 32 x i32> @callee_scalable_vector_split_indirect(<vscale x 32 x i32> %x, <vscale x 32 x i32> %y) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i64, ptr @G, align 4
  %C = icmp sgt i64 4294967296, %LGV
  store i1 %C, ptr %A, align 1
  %B = xor <vscale x 32 x i32> %y, %x
  ret <vscale x 32 x i32> %B
}

define <vscale x 32 x i32> @caller_scalable_vector_split_indirect(<vscale x 32 x i32> %x) {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %c = alloca i64, align 8
  %a = call <vscale x 32 x i32> @callee_scalable_vector_split_indirect(<vscale x 32 x i32> zeroinitializer, <vscale x 32 x i32> %x)
  ret <vscale x 32 x i32> %a

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %0
  br label %BB
}

declare target("riscv.vector.tuple", <vscale x 16 x i8>, 2) @caller_tuple_return()

declare target("riscv.vector.tuple", <vscale x 16 x i8>, 2) @callee_tuple_return()

declare void @caller_tuple_argument(target("riscv.vector.tuple", <vscale x 16 x i8>, 2))

declare void @callee_tuple_argument(target("riscv.vector.tuple", <vscale x 16 x i8>, 2))

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.tuple.extract.nxv4i32.triscv.vector.tuple_nxv16i8_2t(target("riscv.vector.tuple", <vscale x 16 x i8>, 2), i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare target("riscv.vector.tuple", <vscale x 16 x i8>, 2) @llvm.riscv.tuple.insert.triscv.vector.tuple_nxv16i8_2t.nxv4i32(target("riscv.vector.tuple", <vscale x 16 x i8>, 2), <vscale x 4 x i32>, i32 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
