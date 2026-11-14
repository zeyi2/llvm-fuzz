; isel-diff-config: -mtriple=riscv32 -verify-machineinstrs -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i64> splat (i64 -9223372036854775808)
@G.1 = global i16 42
@G.2 = global ptr addrspace(1) poison

define void @cast0(ptr addrspace(1) %ptr) {
  %A = alloca ptr addrspace(1), align 8
  store ptr addrspace(1) poison, ptr %A, align 8
  %G3 = getelementptr <4 x float>, ptr addrspace(1) %ptr, i128 -170141183460469231731687303715884105728
  %LGV1 = load i16, ptr @G.1, align 2
  %ptr0 = addrspacecast ptr addrspace(1) %ptr to ptr
  %G4 = getelementptr <8 x i8>, ptr addrspace(1) %ptr, i16 %LGV1
  %G = getelementptr ptr, ptr addrspace(1) %ptr, i16 %LGV1
  store i32 0, ptr %ptr0, align 4
  store ptr addrspace(1) %G, ptr %A, align 8
  store ptr addrspace(1) %G3, ptr @G.2, align 8
  store ptr addrspace(1) %G4, ptr @G.2, align 8
  ret void
}

define void @cast1(ptr %ptr) {
  %castptr = addrspacecast ptr %ptr to ptr addrspace(10)
  %L = load <2 x i64>, ptr addrspace(10) %castptr, align 16
  call void @foo(ptr addrspace(10) %castptr)
  %B = sub <2 x i64> %L, zeroinitializer
  store <2 x i64> %B, ptr @G, align 16
  ret void
}

declare void @foo(ptr addrspace(10))
