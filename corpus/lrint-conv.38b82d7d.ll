; isel-diff-config: -mtriple=riscv32 -mattr=+zfh,+zbkb -O0 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 0
@G.1 = global i32 -1
@G.2 = global i8 0
@G.3 = global i1 true
@G.4 = global float f0x7F7FFFFF
@G.5 = global i1 true

; Function Attrs: nounwind
define i32 @test_lrint_ixx_f16(half %x) #0 {
  %A = alloca i32, align 4
  store i32 poison, ptr %A, align 4
  %LGV1 = load i32, ptr @G.1, align 4
  %res = tail call i32 @llvm.lrint.i32.f16(half %x)
  %B = urem i32 %res, %LGV1
  store i32 %B, ptr %A, align 4
  ret i32 %res
}

; Function Attrs: nounwind
declare i32 @test_llrint_ixx_f16(half) #0

; Function Attrs: nounwind
define i32 @test_lrint_ixx_f32(float %x) #0 {
  %LGV = load float, ptr @G.4, align 4
  %res = tail call i32 @llvm.lrint.i32.f32(float %x)
  %C = fcmp true float %x, %LGV
  store i1 %C, ptr @G.5, align 1
  ret i32 %res
}

; Function Attrs: nounwind
define i32 @test_llrint_ixx_f32(float %x) #0 {
  %LGV = load i8, ptr @G.2, align 1
  %res = tail call i32 @llvm.llrint.i32.f32(float %x)
  %B = xor i32 %res, %res
  %C = icmp sgt i8 0, %LGV
  store i1 %C, ptr @G.3, align 1
  ret i32 %B
}

; Function Attrs: nounwind
declare i32 @test_lrint_ixx_f64(double) #0

; Function Attrs: nounwind
declare i32 @test_llrint_ixx_f64(double) #0

; Function Attrs: nounwind
declare i32 @test_lrint_ixx_f128(fp128) #0

; Function Attrs: nounwind
define i32 @test_llrint_ixx_f128(fp128 %x) #0 {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i128, ptr @G, align 4
  %res = tail call i32 @llvm.llrint.i32.f128(fp128 %x)
  %C = icmp slt i128 %LGV, 170141183460469231731687303715884105727
  store i1 %C, ptr %A, align 1
  ret i32 %res
}

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.llrint.i32.f128(fp128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.llrint.i32.f16(half) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.llrint.i32.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.llrint.i32.f64(double) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lrint.i32.f128(fp128) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lrint.i32.f16(half) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lrint.i32.f32(float) #1

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.lrint.i32.f64(double) #1

attributes #0 = { nounwind }
attributes #1 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
