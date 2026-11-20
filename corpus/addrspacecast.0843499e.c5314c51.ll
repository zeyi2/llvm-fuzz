; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zihintpause,+zfh,+zicond,+zcb -O3
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 0.000000e+00
@G.1 = global <4 x i32> splat (i32 1)
@G.2 = global <4 x i32> zeroinitializer
@G.3 = global ptr poison
@G.4 = global i8 0
@G.5 = global half 0.000000e+00
@G.6 = global i1 true
@G.7 = global <2 x i1> splat (i1 true)
@G.8 = global i128 0

define void @cast0(ptr addrspace(1) %ptr) {
  %LGV2 = load i128, ptr @G.8, align 4
  %LGV1 = load half, ptr @G.5, align 2
  %B = ashr i128 0, %LGV2
  %A = alloca ptr addrspace(1), align 8
  store ptr addrspace(1) poison, ptr %A, align 8
  %LGV = load i8, ptr @G.4, align 1
  %ptr0 = addrspacecast ptr addrspace(1) %ptr to ptr
  %L = load half, ptr %ptr0, align 2
  store i32 0, ptr %ptr0, align 4
  %C = fcmp ult half %L, %LGV1
  %G = getelementptr ptr, ptr addrspace(1) %ptr, i8 %LGV
  store ptr addrspace(1) %G, ptr %A, align 8
  store i1 %C, ptr @G.6, align 1
  store i128 %B, ptr addrspace(1) %G, align 4
  ret void
}

define void @cast1(ptr %ptr) {
  %LGV2 = load <4 x i32>, ptr @G.2, align 16
  %LGV1 = load <4 x i32>, ptr @G.1, align 16
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %C3 = icmp sgt <4 x i32> %LGV1, %LGV2
  %G = getelementptr ptr, ptr %ptr, i1 false
  %LGV = load double, ptr @G, align 8
  %castptr = addrspacecast ptr %ptr to ptr addrspace(10)
  %L1 = load <4 x i32>, ptr addrspace(10) %castptr, align 16
  %B = sub <4 x i32> %LGV2, %L1
  %L = load double, ptr addrspace(10) %castptr, align 8
  %C = fcmp one double %L, %LGV
  %C4 = icmp eq <2 x i64> splat (i64 1), splat (i64 42)
  call void @foo(ptr addrspace(10) %castptr)
  store i1 %C, ptr %A, align 1
  store <4 x i1> %C3, ptr addrspace(10) %castptr, align 1
  store ptr %G, ptr @G.3, align 8
  store <4 x i32> %B, ptr @G.1, align 16
  store <2 x i1> %C4, ptr @G.7, align 1
  ret void
}

declare void @foo(ptr addrspace(10))
