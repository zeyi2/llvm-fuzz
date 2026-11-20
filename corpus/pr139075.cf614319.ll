; isel-diff-config: -mtriple=riscv64 -mattr=+v,+zvl16384b,+d,+zbb -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global i8 0
@G.1 = global i16 0

define void @a(ptr %0, ptr %1) {
  %LGV1 = load i16, ptr @G.1, align 2
  %A = alloca ptr, align 8
  %G2 = getelementptr i16, ptr %1, i16 %LGV1
  store ptr poison, ptr %A, align 8
  %LGV = load i8, ptr @G, align 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %0, ptr align 4 %1, i64 2048, i1 false)
  %G = getelementptr <8 x i8>, ptr %1, i8 %LGV
  store ptr %G, ptr %G2, align 8
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
