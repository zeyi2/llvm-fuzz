; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 1.000000e+00
@G.1 = global double 1.000000e+00
@G.2 = global i1 true
@G.3 = global i128 1
@G.4 = global i1 true
@G.5 = global ptr poison

define void @cast0(ptr addrspace(1) %ptr) {
  %G = getelementptr half, ptr addrspace(1) %ptr, i16 0
  %LGV3 = load i128, ptr @G.3, align 4
  %ptr0 = addrspacecast ptr addrspace(1) %G to ptr
  %L = load i128, ptr %ptr0, align 4
  %C = icmp slt i128 %L, %LGV3
  %L1 = load i64, ptr %ptr0, align 4
  %G2 = getelementptr <8 x i8>, ptr %ptr0, i64 %L1
  store i32 0, ptr %G2, align 4
  store i1 %C, ptr @G.4, align 1
  store ptr %ptr0, ptr @G.5, align 8
  ret void
}

define void @cast1(ptr %ptr) {
  %A = alloca ptr, align 8
  store ptr poison, ptr %A, align 8
  %LGV1 = load double, ptr @G.1, align 8
  %LGV = load double, ptr @G, align 8
  %C = fcmp oge double %LGV, %LGV1
  %castptr = addrspacecast ptr %ptr to ptr addrspace(10)
  %L = load i64, ptr addrspace(10) %castptr, align 4
  call void @foo(ptr addrspace(10) %castptr)
  store i1 %C, ptr @G.2, align 1
  %G = getelementptr i1, ptr %ptr, i64 %L
  store ptr %G, ptr %A, align 8
  ret void
}

declare void @foo(ptr addrspace(10))
