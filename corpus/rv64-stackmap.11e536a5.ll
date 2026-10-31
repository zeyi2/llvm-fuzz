; isel-diff-config: -mtriple=riscv64 -mattr=+zdinx -O2 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false

declare void @constantargs()

declare void @osrinline(i64, i64)

declare void @osrcold(i64, i64)

declare i64 @propertyRead(ptr)

declare void @propertyWrite(i64, ptr, i64, i64)

define void @jsVoidCall(i64 %dummy1, ptr %obj, i64 %arg, i64 %l1, i64 %l2) {
entry:
  %resolveCall = inttoptr i64 244837814094590 to ptr
  %L = load i16, ptr %resolveCall, align 2
  %C = icmp slt i16 %L, -1
  call void (i64, i32, ptr, i32, ...) @llvm.experimental.patchpoint.void(i64 7, i32 28, ptr %resolveCall, i32 2, ptr %obj, i64 %arg, i64 %l1, i64 %l2)
  store i1 %C, ptr poison, align 1
  ret void
}

declare i64 @jsIntCall(i64, ptr, i64, i64, i64)

declare void @liveConstant()

define void @liveArgs(i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %l0, i64 %l1, i64 %l2, i64 %l3, i64 %l4, i64 %l5, i64 %l6, i64 %l7, i64 %l8, i64 %l9, i64 %l10, i64 %l11, i64 %l12, i64 %l13, i64 %l14, i64 %l15, i64 %l16, i64 %l17, i64 %l18, i64 %l19, i64 %l20, i64 %l21, i64 %l22, i64 %l23, i64 %l24, i8 %l25, i16 zeroext %l26, i32 signext %l27) {
entry:
  switch i64 %l3, label %SW_D [
    i64 -786066277820703186, label %SW_C
  ]

BB:                                               ; preds = %SW_C, %SW_D
  call void (i64, i32, ptr, i32, ...) @llvm.experimental.patchpoint.void(i64 11, i32 28, ptr null, i32 5, i64 %arg0, i64 %arg1, i64 %arg2, i64 %arg3, i64 %arg4, i64 %l0, i64 %l1, i64 %l2, i64 %l3, i64 %l4, i64 %l5, i64 %l6, i64 %l7, i64 %l8, i64 %l9, i64 %l10, i64 %l11, i64 %l12, i64 %l13, i64 %l14, i64 %l15, i64 %l16, i64 %l17, i64 %l18, i64 %l19, i64 %l20, i64 %l21, i64 %l22, i64 %l23, i64 %l24, i8 %l25, i16 %l26, i32 %l27)
  ret void

SW_D:                                             ; preds = %entry
  br label %BB

SW_C:                                             ; preds = %entry
  br label %BB
}

declare void @directFrameIdx()

define void @longid() {
entry:
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i1, ptr @G, align 1
  tail call void (i64, i32, ptr, i32, ...) @llvm.experimental.patchpoint.void(i64 4294967295, i32 0, ptr null, i32 0)
  tail call void (i64, i32, ptr, i32, ...) @llvm.experimental.patchpoint.void(i64 4294967296, i32 0, ptr null, i32 0)
  tail call void (i64, i32, ptr, i32, ...) @llvm.experimental.patchpoint.void(i64 9223372036854775807, i32 0, ptr null, i32 0)
  %B = and i1 %LGV, true
  tail call void (i64, i32, ptr, i32, ...) @llvm.experimental.patchpoint.void(i64 -1, i32 0, ptr null, i32 0)
  store i1 %B, ptr %A, align 1
  ret void
}

declare void @needsStackRealignment()

declare void @escape_values(...)

declare void @floats(float, double, half, bfloat)

declare i64 @llvm.experimental.patchpoint.i64(i64 immarg, i32 immarg, ptr, i32 immarg, ...)

declare void @llvm.experimental.patchpoint.void(i64 immarg, i32 immarg, ptr, i32 immarg, ...)

; Function Attrs: nocallback nofree nosync willreturn
declare void @llvm.experimental.stackmap(i64 immarg, i32 immarg, ...) #0

attributes #0 = { nocallback nofree nosync willreturn }
