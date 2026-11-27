; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -target-abi=lp64f -mattr=+zfhmin,+zvbb -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i16 32767
@G.1 = global <8 x i8> zeroinitializer
@G.2 = global bfloat 1.000000e+00
@G.3 = global i1 true
@G.4 = global <8 x i1> zeroinitializer
@G.5 = global i8 127
@G.6 = global i1 true
@G.7 = global half 6.550400e+04

declare signext i8 @test_floor_si8(half)

declare signext i16 @test_floor_si16(half)

define signext i32 @test_floor_si32(half %x) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i16, ptr @G, align 2
  %a = call half @llvm.floor.f16(half %x)
  %b = fptosi half %a to i32
  switch i16 %LGV, label %SW_D [
    i16 23249, label %SW_C
  ]

BB:                                               ; preds = %SW_C, %SW_D
  %C1 = fcmp ole half %a, %a
  store i1 %C1, ptr %A, align 1
  ret i32 %b

SW_D:                                             ; preds = %0
  br label %BB

SW_C:                                             ; preds = %0
  %C = icmp ule i32 0, 1
  store i1 %C, ptr @G.6, align 1
  br label %BB
}

declare i64 @test_floor_si64(half)

declare zeroext i8 @test_floor_ui8(half)

declare zeroext i16 @test_floor_ui16(half)

define signext i32 @test_floor_ui32(half %x) {
  %LGV2 = load half, ptr @G.7, align 2
  %C1 = icmp eq <8 x i8> splat (i8 16), splat (i8 42)
  %LGV = load bfloat, ptr @G.2, align 2
  %a = call half @llvm.floor.f16(half %x)
  %b = fptoui half %a to i32
  %C = fcmp oge bfloat %LGV, +inf
  %C3 = fcmp oeq half %x, %LGV2
  store i1 %C, ptr @G.3, align 1
  store <8 x i1> %C1, ptr @G.4, align 1
  store i1 %C3, ptr @G.3, align 1
  ret i32 %b
}

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

declare zeroext i8 @test_trunc_ui8(half)

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

declare signext i32 @test_roundeven_si32(half)

declare i64 @test_roundeven_si64(half)

define zeroext i8 @test_roundeven_ui8(half %x) {
  %A = alloca i8, align 1
  store i8 poison, ptr %A, align 1
  %LGV = load i8, ptr @G.5, align 1
  %a = call half @llvm.roundeven.f16(half %x)
  %C = fcmp uno half %x, %a
  %b = fptoui half %a to i8
  %C1 = icmp ule i128 -170141183460469231731687303715884105728, -1
  store i1 %C, ptr @G.3, align 1
  %B = and i8 %b, %LGV
  store i1 %C1, ptr @G.3, align 1
  store i8 %B, ptr %A, align 1
  ret i8 %b
}

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
