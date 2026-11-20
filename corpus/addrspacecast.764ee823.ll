; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -O1
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i128 18446744073709551616
@G.1 = global i1 true
@G.2 = global <8 x i8> splat (i8 127)

define void @cast0(ptr addrspace(1) %ptr) {
  %A6 = alloca ptr, align 8
  store ptr poison, ptr %A6, align 8
  %G = getelementptr ptr addrspace(1), ptr addrspace(1) %ptr, i64 0
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load i1, ptr @G.1, align 1
  %ptr0 = addrspacecast ptr addrspace(1) %G to ptr
  %L = load i1, ptr %ptr0, align 1
  store i32 0, ptr %ptr0, align 4
  %B = udiv i1 %LGV, %L
  %G5 = getelementptr ptr addrspace(1), ptr %A, i1 %B
  store i1 %B, ptr %A, align 1
  store ptr %G5, ptr %A6, align 8
  ret void
}

define void @cast1(ptr %ptr) {
  %LGV3 = load <8 x i8>, ptr @G.2, align 8
  %LGV = load i128, ptr @G, align 4
  %B = add i128 %LGV, 0
  %B2 = urem i128 %LGV, -170141183460469231731687303715884105728
  %castptr = addrspacecast ptr %ptr to ptr addrspace(10)
  call void @foo(ptr addrspace(10) %castptr)
  %B4 = sub <8 x i8> splat (i8 -1), %LGV3
  store i128 %B, ptr @G, align 4
  store i128 %B2, ptr addrspace(10) %castptr, align 4
  store <8 x i8> %B4, ptr @G.2, align 8
  ret void
}

declare void @foo(ptr addrspace(10))
