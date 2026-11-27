; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -target-abi=ilp32f -mattr=+zfh,+zbb,+f -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 true
@G.1 = global half 6.550400e+04
@G.2 = global half 1.000000e+00
@G.3 = global half 5.960460e-08
@G.4 = global i1 false

declare signext i8 @test_floor_si8(half)

declare signext i16 @test_floor_si16(half)

declare signext i32 @test_floor_si32(half)

declare i64 @test_floor_si64(half)

declare zeroext i8 @test_floor_ui8(half)

declare zeroext i16 @test_floor_ui16(half)

declare signext i32 @test_floor_ui32(half)

declare i64 @test_floor_ui64(half)

declare signext i8 @test_ceil_si8(half)

declare signext i16 @test_ceil_si16(half)

declare signext i32 @test_ceil_si32(half)

declare i64 @test_ceil_si64(half)

declare zeroext i8 @test_ceil_ui8(half)

declare zeroext i16 @test_ceil_ui16(half)

declare signext i32 @test_ceil_ui32(half)

declare i64 @test_ceil_ui64(half)

declare signext i8 @test_trunc_si8(half)

declare signext i16 @test_trunc_si16(half)

declare signext i32 @test_trunc_si32(half)

declare i64 @test_trunc_si64(half)

define zeroext i8 @test_trunc_ui8(half %x) {
  %A2 = alloca i1, align 1
  store i1 poison, ptr %A2, align 1
  %LGV1 = load half, ptr @G.3, align 2
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load half, ptr @G.1, align 2
  %a = call half @llvm.trunc.f16(half %x)
  %C2 = fcmp ord half %LGV1, %LGV
  %C1 = fcmp ogt half %x, 0.000000e+00
  %b = fptoui half %a to i8
  %C = fcmp oeq half %x, %LGV
  store i1 %C, ptr %A, align 1
  store i1 %C2, ptr @G.4, align 1
  store i1 %C1, ptr %A2, align 1
  ret i8 %b
}

declare zeroext i16 @test_trunc_ui16(half)

declare signext i32 @test_trunc_ui32(half)

declare i64 @test_trunc_ui64(half)

declare signext i8 @test_round_si8(half)

declare signext i16 @test_round_si16(half)

declare signext i32 @test_round_si32(half)

declare i64 @test_round_si64(half)

declare zeroext i8 @test_round_ui8(half)

declare zeroext i16 @test_round_ui16(half)

declare signext i32 @test_round_ui32(half)

declare i64 @test_round_ui64(half)

declare signext i8 @test_roundeven_si8(half)

declare signext i16 @test_roundeven_si16(half)

define signext i32 @test_roundeven_si32(half %x) {
  %A1 = alloca i1, align 1
  %L1 = load half, ptr %A1, align 2
  %L3 = load i64, ptr %A1, align 4
  %C2 = fcmp oge half %x, %L1
  store i1 true, ptr %A1, align 1
  %A = alloca i1, align 1
  store i1 true, ptr %A, align 1
  %a = call half @llvm.roundeven.f16(half %x)
  %G = getelementptr <4 x i32>, ptr %A1, i64 %L3
  %L = load i1, ptr %A, align 1
  store ptr %G, ptr poison, align 8
  br i1 %L, label %T, label %F

BB:                                               ; preds = %F, %T
  %b = fptosi half %a to i32
  %C = fcmp false half %x, %x
  store i1 %C, ptr %A1, align 1
  ret i32 %b

T:                                                ; preds = %T, %0
  br i1 %C2, label %BB, label %T

F:                                                ; preds = %0
  %C3 = icmp sgt <8 x i8> splat (i8 1), splat (i8 127)
  store <8 x i1> %C3, ptr %A1, align 1
  br label %BB
}

declare i64 @test_roundeven_si64(half)

declare zeroext i8 @test_roundeven_ui8(half)

declare zeroext i16 @test_roundeven_ui16(half)

declare signext i32 @test_roundeven_ui32(half)

declare i64 @test_roundeven_ui64(half)

declare half @test_floor_half(half)

declare half @test_ceil_half(half)

declare half @test_trunc_half(half)

declare half @test_round_half(half)

declare half @test_roundeven_half(half)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.ceil.f16(half) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.floor.f16(half) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.round.f16(half) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.roundeven.f16(half) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare half @llvm.trunc.f16(half) #0

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
