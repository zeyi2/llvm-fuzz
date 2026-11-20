; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+v,+zvl16384b -O0
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <4 x i32> splat (i32 42)
@G.1 = global ptr poison
@G.2 = global i16 1

define void @a(ptr %0, ptr %1) {
  %LGV = load i16, ptr @G.2, align 2
  %C = icmp uge i16 -1, 32767
  %G3 = getelementptr i1, ptr %0, i1 %C
  %G2 = getelementptr double, ptr %1, i1 %C
  %G = getelementptr <4 x i32>, ptr %G2, i32 42
  %G1 = getelementptr ptr, ptr %G3, i1 %C
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %G1, ptr align 4 %1, i64 2048, i1 false)
  %G5 = getelementptr ptr, ptr %G3, i1 %C
  %G4 = getelementptr i8, ptr %G5, i16 %LGV
  store ptr %G, ptr @G.1, align 8
  store i1 %C, ptr %G4, align 1
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #0

attributes #0 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
