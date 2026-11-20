; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+zvl16384b -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 42)
@G.1 = global ptr poison
@G.2 = global float 1.401300e-45
@G.3 = global i1 false

define void @a(ptr %0, ptr %1) {
  %A = alloca i1, align 1
  store i1 poison, ptr %A, align 1
  %LGV = load float, ptr @G.2, align 4
  %G = getelementptr <4 x i32>, ptr %1, i32 42
  %L = load float, ptr %G, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %0, ptr align 4 %1, i64 2048, i1 false)
  %C = fcmp uno float %L, %LGV
  store ptr %G, ptr @G.1, align 8
  store i1 %C, ptr @G.3, align 1
  %C1 = fcmp one float %L, %L
  store i1 %C1, ptr %A, align 1
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
