; isel-diff-config: -mtriple=riscv64 -mattr=+experimental-zvabd,+zfinx -O3 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i8> splat (i8 127)

declare signext i16 @sad_4x8_as_i16(<4 x i8>, <4 x i8>)

define signext i32 @sad_4x8_as_i32(<4 x i8> %a, <4 x i8> %b) {
entry:
  %A = alloca <4 x i8>, align 4
  store <4 x i8> poison, ptr %A, align 4
  %LGV = load <4 x i8>, ptr @G, align 4
  %0 = zext <4 x i8> %a to <4 x i32>
  %1 = zext <4 x i8> %b to <4 x i32>
  %2 = sub nsw <4 x i32> %0, %1
  %B = ashr <4 x i8> %b, %LGV
  %3 = tail call <4 x i32> @llvm.abs.v4i32(<4 x i32> %2, i1 true)
  %4 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %3)
  store <4 x i8> %B, ptr %A, align 4
  ret i32 %4
}

declare signext i16 @sad_16x8_as_i16(<16 x i8>, <16 x i8>)

declare signext i32 @sad_16x8_as_i32(<16 x i8>, <16 x i8>)

define signext i32 @sad_2block_16xi8_as_i32(ptr %a, ptr %b, i32 signext %stridea, i32 signext %strideb) {
entry:
  %idx.ext8 = sext i32 %strideb to i64
  %idx.ext = sext i32 %stridea to i64
  %0 = load <16 x i8>, ptr %a, align 1
  %1 = zext <16 x i8> %0 to <16 x i32>
  %2 = load <16 x i8>, ptr %b, align 1
  %3 = zext <16 x i8> %2 to <16 x i32>
  %4 = sub nsw <16 x i32> %1, %3
  %5 = tail call <16 x i32> @llvm.abs.v16i32(<16 x i32> %4, i1 true)
  %6 = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %5)
  %B = udiv <2 x i64> splat (i64 -9223372036854775808), splat (i64 -1)
  %add.ptr = getelementptr inbounds i8, ptr %a, i64 %idx.ext
  %add.ptr9 = getelementptr inbounds i8, ptr %b, i64 %idx.ext8
  %7 = load <16 x i8>, ptr %add.ptr, align 1
  %8 = zext <16 x i8> %7 to <16 x i32>
  %9 = load <16 x i8>, ptr %add.ptr9, align 1
  %10 = zext <16 x i8> %9 to <16 x i32>
  %11 = sub nsw <16 x i32> %8, %10
  %12 = tail call <16 x i32> @llvm.abs.v16i32(<16 x i32> %11, i1 true)
  %13 = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %12)
  %op.rdx.1 = add i32 %13, %6
  %add.ptr.1 = getelementptr inbounds i8, ptr %add.ptr, i64 %idx.ext
  %add.ptr9.1 = getelementptr inbounds i8, ptr %add.ptr9, i64 %idx.ext8
  %14 = load <16 x i8>, ptr %add.ptr.1, align 1
  %15 = zext <16 x i8> %14 to <16 x i32>
  %16 = load <16 x i8>, ptr %add.ptr9.1, align 1
  %17 = zext <16 x i8> %16 to <16 x i32>
  %18 = sub nsw <16 x i32> %15, %17
  %19 = tail call <16 x i32> @llvm.abs.v16i32(<16 x i32> %18, i1 true)
  %20 = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %19)
  %op.rdx.2 = add i32 %20, %op.rdx.1
  %add.ptr.2 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %idx.ext
  %add.ptr9.2 = getelementptr inbounds i8, ptr %add.ptr9.1, i64 %idx.ext8
  %21 = load <16 x i8>, ptr %add.ptr.2, align 1
  %22 = zext <16 x i8> %21 to <16 x i32>
  %23 = load <16 x i8>, ptr %add.ptr9.2, align 1
  %24 = zext <16 x i8> %23 to <16 x i32>
  %25 = sub nsw <16 x i32> %22, %24
  %26 = tail call <16 x i32> @llvm.abs.v16i32(<16 x i32> %25, i1 true)
  %27 = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %26)
  %op.rdx.3 = add i32 %27, %op.rdx.2
  store <2 x i64> %B, ptr %add.ptr.2, align 16
  ret i32 %op.rdx.3
}

define signext i32 @sadu_2block_16xi8_as_i32(ptr %a, ptr %b, i32 signext %stridea, i32 signext %strideb) {
entry:
  %idx.ext8 = sext i32 %strideb to i64
  %idx.ext = sext i32 %stridea to i64
  %0 = load <16 x i8>, ptr %a, align 1
  %1 = sext <16 x i8> %0 to <16 x i32>
  %2 = load <16 x i8>, ptr %b, align 1
  %3 = sext <16 x i8> %2 to <16 x i32>
  %4 = sub nsw <16 x i32> %1, %3
  %5 = tail call <16 x i32> @llvm.abs.v16i32(<16 x i32> %4, i1 true)
  %6 = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %5)
  %add.ptr = getelementptr inbounds i8, ptr %a, i64 %idx.ext
  %add.ptr9 = getelementptr inbounds i8, ptr %b, i64 %idx.ext8
  %7 = load <16 x i8>, ptr %add.ptr, align 1
  %8 = sext <16 x i8> %7 to <16 x i32>
  %9 = load <16 x i8>, ptr %add.ptr9, align 1
  %10 = sext <16 x i8> %9 to <16 x i32>
  %11 = sub nsw <16 x i32> %8, %10
  %12 = tail call <16 x i32> @llvm.abs.v16i32(<16 x i32> %11, i1 true)
  %13 = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %12)
  %op.rdx.1 = add i32 %13, %6
  %add.ptr.1 = getelementptr inbounds i8, ptr %add.ptr, i64 %idx.ext
  %add.ptr9.1 = getelementptr inbounds i8, ptr %add.ptr9, i64 %idx.ext8
  %14 = load <16 x i8>, ptr %add.ptr.1, align 1
  %15 = sext <16 x i8> %14 to <16 x i32>
  %16 = load <16 x i8>, ptr %add.ptr9.1, align 1
  %17 = sext <16 x i8> %16 to <16 x i32>
  %18 = sub nsw <16 x i32> %15, %17
  %19 = tail call <16 x i32> @llvm.abs.v16i32(<16 x i32> %18, i1 true)
  %S = shufflevector <16 x i32> %11, <16 x i32> %4, <16 x i32> poison
  %20 = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %19)
  %op.rdx.2 = add i32 %20, %op.rdx.1
  %add.ptr.2 = getelementptr inbounds i8, ptr %add.ptr.1, i64 %idx.ext
  %add.ptr9.2 = getelementptr inbounds i8, ptr %add.ptr9.1, i64 %idx.ext8
  %21 = load <16 x i8>, ptr %add.ptr.2, align 1
  %22 = sext <16 x i8> %21 to <16 x i32>
  %23 = load <16 x i8>, ptr %add.ptr9.2, align 1
  %24 = sext <16 x i8> %23 to <16 x i32>
  %25 = sub nsw <16 x i32> %22, %24
  %26 = tail call <16 x i32> @llvm.abs.v16i32(<16 x i32> %25, i1 true)
  %27 = tail call i32 @llvm.vector.reduce.add.v16i32(<16 x i32> %26)
  %op.rdx.3 = add i32 %27, %op.rdx.2
  store <16 x i32> %S, ptr %add.ptr9.2, align 64
  ret i32 %op.rdx.3
}

declare <vscale x 4 x i32> @vmacc_of_sext_add(<vscale x 4 x i16>, <vscale x 4 x i16>, <vscale x 4 x i32>, <vscale x 4 x i32>)

define <vscale x 4 x i32> @vadd_vx_of_sext_add(<vscale x 4 x i16> %x, <vscale x 4 x i16> %y, i32 %z) {
  %head = insertelement <vscale x 4 x i32> poison, i32 %z, i32 0
  %a = ashr <vscale x 4 x i16> %x, splat (i16 1)
  %splat = shufflevector <vscale x 4 x i32> %head, <vscale x 4 x i32> poison, <vscale x 4 x i32> zeroinitializer
  %sa = sext <vscale x 4 x i16> %a to <vscale x 4 x i32>
  %b = ashr <vscale x 4 x i16> %y, splat (i16 1)
  %sb = sext <vscale x 4 x i16> %b to <vscale x 4 x i32>
  %ab = add <vscale x 4 x i32> %sa, %sb
  %r = add <vscale x 4 x i32> %ab, %splat
  ret <vscale x 4 x i32> %r
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.abs.v16i16(<16 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i32> @llvm.abs.v16i32(<16 x i32>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i16> @llvm.abs.v4i16(<4 x i16>, i1 immarg) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.abs.v4i32(<4 x i32>, i1 immarg) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v16i16(<16 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v16i32(<16 x i32>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v4i16(<4 x i16>) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #1

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
