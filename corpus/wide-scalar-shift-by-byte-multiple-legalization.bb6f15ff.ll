; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -mattr=+zdinx -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i1 false
@G.1 = global i32 1
@G.2 = global bfloat +qnan
@G.3 = global float 1.000000e+00

; Function Attrs: nounwind
declare void @lshr_4bytes(ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @shl_4bytes(ptr, ptr, ptr) #0

; Function Attrs: nounwind
define void @ashr_4bytes(ptr %src.ptr, ptr %byteOff.ptr, ptr %dst) #0 {
  %LGV = load float, ptr @G.3, align 4
  %src = load i32, ptr %src.ptr, align 1
  %byteOff = load i32, ptr %byteOff.ptr, align 1
  %C1 = fcmp ord float %LGV, +qnan
  %bitOff = shl i32 %byteOff, 3
  %res = ashr i32 %src, %bitOff
  store i32 %res, ptr %dst, align 1
  store i1 %C1, ptr poison, align 1
  ret void
}

; Function Attrs: nounwind
declare void @lshr_8bytes(ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @shl_8bytes(ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @ashr_8bytes(ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @lshr_16bytes(ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @lshr_16bytes_wordOff(ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @shl_16bytes(ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @shl_16bytes_wordOff(ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @ashr_16bytes(ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @ashr_16bytes_wordOff(ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @lshr_32bytes(ptr, ptr, ptr) #0

; Function Attrs: nounwind
declare void @lshr_32bytes_wordOff(ptr, ptr, ptr) #0

; Function Attrs: nounwind
define void @lshr_32bytes_dwordOff(ptr %src.ptr, ptr %dwordOff.ptr, ptr %dst) #0 {
  %src = load i256, ptr %src.ptr, align 1
  %dwordOff = load i256, ptr %dwordOff.ptr, align 1
  %bitOff = shl i256 %dwordOff, 6
  %B = shl i256 %dwordOff, %src
  %res = lshr i256 %B, %bitOff
  store i256 %res, ptr %dst, align 1
  ret void
}

; Function Attrs: nounwind
define void @shl_32bytes(ptr %src.ptr, ptr %byteOff.ptr, ptr %dst) #0 {
  %LGV = load i1, ptr @G, align 1
  %src = load i256, ptr %src.ptr, align 1
  %byteOff = load i256, ptr %byteOff.ptr, align 1
  %bitOff = shl i256 %byteOff, 3
  %B = or i1 true, %LGV
  %res = shl i256 %src, %bitOff
  store i256 %res, ptr %dst, align 1
  store i1 %B, ptr @G, align 1
  ret void
}

; Function Attrs: nounwind
declare void @shl_32bytes_wordOff(ptr, ptr, ptr) #0

; Function Attrs: nounwind
define void @shl_32bytes_dwordOff(ptr %src.ptr, ptr %dwordOff.ptr, ptr %dst) #0 {
  %LGV = load bfloat, ptr @G.2, align 2
  %src = load i256, ptr %src.ptr, align 1
  %dwordOff = load i256, ptr %dwordOff.ptr, align 1
  %bitOff = shl i256 %dwordOff, 6
  %res = shl i256 %src, %bitOff
  store i256 %res, ptr %dst, align 1
  %C = fcmp ule bfloat 3.389530e+38, %LGV
  store i1 %C, ptr @G, align 1
  ret void
}

; Function Attrs: nounwind
define void @ashr_32bytes(ptr %src.ptr, ptr %byteOff.ptr, ptr %dst) #0 {
  %G = getelementptr half, ptr %byteOff.ptr, i1 false
  %src = load i256, ptr %src.ptr, align 1
  %byteOff = load i256, ptr %byteOff.ptr, align 1
  %bitOff = shl i256 %byteOff, 3
  %res = ashr i256 %src, %bitOff
  %B = or i128 -170141183460469231731687303715884105728, 1
  store i256 %res, ptr %dst, align 1
  store i128 %B, ptr %G, align 4
  ret void
}

; Function Attrs: nounwind
define void @ashr_32bytes_wordOff(ptr %src.ptr, ptr %wordOff.ptr, ptr %dst) #0 {
  %LGV = load i32, ptr @G.1, align 4
  %src = load i256, ptr %src.ptr, align 1
  %wordOff = load i256, ptr %wordOff.ptr, align 1
  %bitOff = shl i256 %wordOff, 5
  %res = ashr i256 %src, %bitOff
  %G = getelementptr i1, ptr %src.ptr, i32 %LGV
  store i256 %res, ptr %G, align 1
  ret void
}

; Function Attrs: nounwind
declare void @ashr_32bytes_dwordOff(ptr, ptr, ptr) #0

attributes #0 = { nounwind }
