; isel-diff-config: -mtriple=riscv64 -mattr=+v,+zvl16384b -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double +qnan
@G.1 = global i1 true
@G.2 = global ptr poison

define void @a(ptr %0, ptr %1) {
  %LGV1 = load i1, ptr @G.1, align 1
  %G = getelementptr double, ptr %1, i1 %LGV1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %0, ptr align 4 %1, i64 2048, i1 false)
  store ptr %G, ptr @G.2, align 8
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
