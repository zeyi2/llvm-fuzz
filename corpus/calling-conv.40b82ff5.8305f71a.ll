; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v -O2 -code-model=small
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i8 -1
@G.2 = global i32 42

define <vscale x 32 x i32> @callee_scalable_vector_split_indirect(<vscale x 32 x i32> %x, <vscale x 32 x i32> %y) {
  %B = sub <vscale x 32 x i32> %y, splat (i32 1)
  ret <vscale x 32 x i32> %B
}

declare <vscale x 32 x i32> @caller_scalable_vector_split_indirect(<vscale x 32 x i32>)

define target("riscv.vector.tuple", <vscale x 16 x i8>, 2) @caller_tuple_return() {
  %A4 = alloca i1, align 1
  store i1 false, ptr %A4, align 1
  %LGV4 = load i8, ptr @G.1, align 1
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i1, ptr @G, align 1
  %G = getelementptr i1, ptr %A, i8 %LGV4
  %a = call target("riscv.vector.tuple", <vscale x 16 x i8>, 2) @callee_tuple_return()
  switch i1 %LGV, label %SW_D [
    i1 false, label %SW_C
    i1 true, label %SW_C1
  ]

BB:                                               ; preds = %SW_C1, %SW_C, %SW_D
  %LGV2 = load i1, ptr @G, align 1
  %LGV5 = load i32, ptr @G.2, align 4
  %b = call <vscale x 4 x i32> @llvm.riscv.tuple.extract.nxv4i32.triscv.vector.tuple_nxv16i8_2t(target("riscv.vector.tuple", <vscale x 16 x i8>, 2) %a, i32 0)
  %c = call <vscale x 4 x i32> @llvm.riscv.tuple.extract.nxv4i32.triscv.vector.tuple_nxv16i8_2t(target("riscv.vector.tuple", <vscale x 16 x i8>, 2) %a, i32 1)
  %d = call target("riscv.vector.tuple", <vscale x 16 x i8>, 2) @llvm.riscv.tuple.insert.triscv.vector.tuple_nxv16i8_2t.nxv4i32(target("riscv.vector.tuple", <vscale x 16 x i8>, 2) poison, <vscale x 4 x i32> %c, i32 0)
  %e = call target("riscv.vector.tuple", <vscale x 16 x i8>, 2) @llvm.riscv.tuple.insert.triscv.vector.tuple_nxv16i8_2t.nxv4i32(target("riscv.vector.tuple", <vscale x 16 x i8>, 2) %d, <vscale x 4 x i32> %b, i32 1)
  br i1 %LGV, label %T, label %F

BB1:                                              ; preds = %F, %T
  %C = icmp ult i32 42, %LGV5
  store i1 %C, ptr %A, align 1
  ret target("riscv.vector.tuple", <vscale x 16 x i8>, 2) %e

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %SW_C, %0
  %L = load i1, ptr %G, align 1
  br i1 %L, label %BB, label %SW_C

SW_C1:                                            ; preds = %0
  br label %BB

T:                                                ; preds = %BB
  br label %BB1

F:                                                ; preds = %F, %BB
  %LGV3 = load i1, ptr @G, align 1
  %L5 = load i1, ptr %A4, align 1
  br i1 %L5, label %BB1, label %F
}

declare target("riscv.vector.tuple", <vscale x 16 x i8>, 2) @callee_tuple_return()

declare void @caller_tuple_argument(target("riscv.vector.tuple", <vscale x 16 x i8>, 2))

declare void @callee_tuple_argument(target("riscv.vector.tuple", <vscale x 16 x i8>, 2))

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <vscale x 4 x i32> @llvm.riscv.tuple.extract.nxv4i32.triscv.vector.tuple_nxv16i8_2t(target("riscv.vector.tuple", <vscale x 16 x i8>, 2), i32 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare target("riscv.vector.tuple", <vscale x 16 x i8>, 2) @llvm.riscv.tuple.insert.triscv.vector.tuple_nxv16i8_2t.nxv4i32(target("riscv.vector.tuple", <vscale x 16 x i8>, 2), <vscale x 4 x i32>, i32 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
