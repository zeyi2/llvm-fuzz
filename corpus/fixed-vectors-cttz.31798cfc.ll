; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zve64x,+zhinx -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <16 x i8> splat (i8 42)
@G.1 = global ptr poison

; Function Attrs: nounwind
declare void @cttz_v16i8(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_v8i16(ptr, ptr) #0

; Function Attrs: nounwind
define void @cttz_v4i32(ptr %x, ptr %y) #0 {
  %a = load <4 x i32>, ptr %x, align 16
  %G = getelementptr ptr, ptr %y, i128 0
  %c = call <4 x i32> %G(<4 x i32> %a, i1 false)
  store <4 x i32> %c, ptr %x, align 16
  ret void
}

; Function Attrs: nounwind
declare void @cttz_v2i64(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_v32i8(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_v16i16(ptr, ptr) #0

; Function Attrs: nounwind
define void @cttz_v8i32(ptr %x, ptr %y) #0 {
  %A = alloca <8 x i32>, align 32
  store <8 x i32> poison, ptr %A, align 32
  %a = load <8 x i32>, ptr %x, align 32
  %c = call <8 x i32> @llvm.cttz.v8i32(<8 x i32> %a, i1 false)
  store <8 x i32> %c, ptr %x, align 32
  %B = ashr <8 x i32> %c, splat (i32 2147483647)
  store <8 x i32> %B, ptr %A, align 32
  ret void
}

; Function Attrs: nounwind
define void @cttz_v4i64(ptr %x, ptr %y) #0 {
  %G = getelementptr <vscale x 8 x i8>, ptr %x, i64 9223372036854775807
  %a = load <4 x i64>, ptr %x, align 32
  %c = call <4 x i64> @llvm.cttz.v4i64(<4 x i64> %a, i1 false)
  store <4 x i64> %c, ptr %x, align 32
  store ptr %G, ptr @G.1, align 8
  ret void
}

; Function Attrs: nounwind
define void @cttz_zero_poison_v16i8(ptr %x, ptr %y) #0 {
  %a = load <16 x i8>, ptr %x, align 16
  %c = call <16 x i8> @llvm.cttz.v16i8(<16 x i8> %a, i1 true)
  %B = mul <16 x i8> %c, splat (i8 127)
  store <16 x i8> %c, ptr %x, align 16
  store <16 x i8> %B, ptr @G, align 16
  ret void
}

; Function Attrs: nounwind
declare void @cttz_zero_poison_v8i16(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_zero_poison_v4i32(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_zero_poison_v2i64(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_zero_poison_v32i8(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_zero_poison_v16i16(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_zero_poison_v8i32(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_zero_poison_v4i64(ptr, ptr) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i16> @llvm.cttz.v16i16(<16 x i16>, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x i8> @llvm.cttz.v16i8(<16 x i8>, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x i64> @llvm.cttz.v2i64(<2 x i64>, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <32 x i8> @llvm.cttz.v32i8(<32 x i8>, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i32> @llvm.cttz.v4i32(<4 x i32>, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x i64> @llvm.cttz.v4i64(<4 x i64>, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i16> @llvm.cttz.v8i16(<8 x i16>, i1 immarg) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x i32> @llvm.cttz.v8i32(<8 x i32>, i1 immarg) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
