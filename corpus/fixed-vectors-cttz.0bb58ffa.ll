; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+m,+zve64x,+zvl128b,+zbb -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> zeroinitializer
@G.1 = global <2 x i1> zeroinitializer
@G.2 = global <8 x i16> splat (i16 1)
@G.3 = global <8 x i16> splat (i16 32767)

; Function Attrs: nounwind
declare void @cttz_v16i8(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_v8i16(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_v4i32(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_v2i64(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_v32i8(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_v16i16(ptr, ptr) #0

; Function Attrs: nounwind
declare void @cttz_v8i32(ptr, ptr) #0

; Function Attrs: nounwind
define void @cttz_v4i64(ptr %x, ptr %y) #0 {
  %LGV = load <2 x i64>, ptr @G, align 16
  %a = load <4 x i64>, ptr %x, align 32
  %C = icmp ult <2 x i64> %LGV, zeroinitializer
  %B = lshr <4 x i64> %a, %a
  store <4 x i64> %B, ptr %x, align 32
  store <2 x i1> %C, ptr @G.1, align 1
  ret void
}

; Function Attrs: nounwind
define void @cttz_zero_poison_v16i8(ptr %x, ptr %y) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %a = load <16 x i8>, ptr %x, align 16
  %C = fcmp uge float f0x7F7FFFFF, +inf
  %c = call <16 x i8> @llvm.cttz.v16i8(<16 x i8> %a, i1 true)
  store <16 x i8> %c, ptr %x, align 16
  store i1 %C, ptr %A, align 1
  ret void
}

; Function Attrs: nounwind
define void @cttz_zero_poison_v8i16(ptr %x, ptr %y) #0 {
  %LGV = load <8 x i16>, ptr @G.2, align 16
  %a = load <8 x i16>, ptr %x, align 16
  %B = add <8 x i16> %a, %LGV
  %c = call <8 x i16> @llvm.cttz.v8i16(<8 x i16> %a, i1 true)
  store <8 x i16> %c, ptr %x, align 16
  store <8 x i16> %B, ptr @G.3, align 16
  ret void
}

; Function Attrs: nounwind
define void @cttz_zero_poison_v4i32(ptr %x, ptr %y) #0 {
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %a = load <4 x i32>, ptr %x, align 16
  %b = load <4 x i32>, ptr %y, align 16
  %L = load i1, ptr %A, align 1
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %c = call <4 x i32> @llvm.cttz.v4i32(<4 x i32> %a, i1 true)
  store <4 x i32> %c, ptr %x, align 16
  ret void

T:                                                ; preds = %T, %0
  br i1 %L, label %T, label %BB

F:                                                ; preds = %0
  br label %BB
}

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
