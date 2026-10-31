; isel-diff-config: -mtriple=riscv64 -mattr=+c,+zdinx -O1 -verify-machineinstrs
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global <2 x i1> splat (i1 true)
@G.1 = global half +qnan
@G.2 = global i1 false
@G.3 = global <2 x i64> splat (i64 9223372036854775807)
@G.4 = global i8 16
@G.5 = global <4 x i32> splat (i32 -2147483648)
@G.6 = global <4 x i1> splat (i1 true)

define void @test_shadow_optimization() {
entry:
  %LGV2 = load <4 x i32>, ptr @G.5, align 16
  %A = alloca i8, align 1
  %L = load <4 x i32>, ptr %A, align 16
  store i8 poison, ptr %A, align 1
  %LGV = load i8, ptr @G.4, align 1
  %B1 = shl i8 1, %LGV
  %C = icmp eq <4 x i32> %L, %LGV2
  tail call void (i64, i32, ...) @llvm.experimental.stackmap(i64 0, i32 16)
  %B = fdiv float 0.000000e+00, 4.200000e+01
  store float %B, ptr poison, align 4
  store i8 %B1, ptr %A, align 1
  store <4 x i1> %C, ptr @G.6, align 1
  ret void
}

define void @test_shadow_optimization_dbg_label() !dbg !15 {
entry:
  tail call void (i64, i32, ...) @llvm.experimental.stackmap(i64 0, i32 16)
    #dbg_label(!17, !18)
  %C = icmp ne <2 x i64> splat (i64 42), splat (i64 4294967296)
  store <2 x i1> %C, ptr @G, align 1
  ret void
}

define void @test_shadow_optimization_dbg_value() !dbg !19 {
entry:
  %LGV3 = load <2 x i64>, ptr @G.3, align 16
  %C4 = icmp ne <2 x i64> splat (i64 42), %LGV3
  %C2 = fcmp true <4 x float> splat (float f0x7F7FFFFF), splat (float 1.401300e-45)
  %S = shufflevector <2 x i1> %C4, <2 x i1> splat (i1 true), <2 x i32> poison
  %LGV = load half, ptr @G.1, align 2
  tail call void (i64, i32, ...) @llvm.experimental.stackmap(i64 0, i32 16)
    #dbg_value(i32 0, !21, !DIExpression(), !22)
  %C = fcmp ugt half 4.200000e+01, %LGV
  store i1 %C, ptr @G.2, align 1
  store <4 x i1> %C2, ptr poison, align 1
  store <2 x i1> %S, ptr poison, align 1
  ret void
}

; Function Attrs: nocallback nofree nosync willreturn
declare void @llvm.experimental.stackmap(i64 immarg, i32 immarg, ...) #0

attributes #0 = { nocallback nofree nosync willreturn }

!llvm.dbg.cu = !{!10}
!llvm.module.flags = !{!13}

!10 = distinct !DICompileUnit(language: DW_LANG_C99, file: !11, isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug)
!11 = !DIFile(filename: "stackmap-shadow.c", directory: "/")
!12 = !{}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!15 = distinct !DISubprogram(name: "test_shadow_optimization_dbg_label", scope: !11, file: !11, line: 1, type: !16, scopeLine: 1, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !10)
!16 = !DISubroutineType(types: !12)
!17 = !DILabel(scope: !15, name: "after_stackmap", file: !11, line: 2)
!18 = !DILocation(line: 2, column: 1, scope: !15)
!19 = distinct !DISubprogram(name: "test_shadow_optimization_dbg_value", scope: !11, file: !11, line: 4, type: !16, scopeLine: 4, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !10)
!21 = !DILocalVariable(name: "value", scope: !19, file: !11, line: 5, type: !23)
!22 = !DILocation(line: 5, column: 1, scope: !19)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
