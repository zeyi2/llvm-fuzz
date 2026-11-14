; isel-diff-config: -mtriple=riscv64 -verify-machineinstrs -mattr=+zve64x,+zfinx -O2
; ModuleID = '<stdin>'
source_filename = "<stdin>"

@G = global double 1.000000e+00
@G.1 = global i1 false
@G.2 = global i1 true

declare <vscale x 1 x i8> @vremu_vv_nxv1i8(<vscale x 1 x i8>, <vscale x 1 x i8>)

declare <vscale x 1 x i8> @vremu_vx_nxv1i8(<vscale x 1 x i8>, i8 signext)

declare <vscale x 1 x i8> @vremu_vi_nxv1i8_0(<vscale x 1 x i8>)

declare <vscale x 2 x i8> @vremu_vv_nxv2i8(<vscale x 2 x i8>, <vscale x 2 x i8>)

declare <vscale x 2 x i8> @vremu_vx_nxv2i8(<vscale x 2 x i8>, i8 signext)

declare <vscale x 2 x i8> @vremu_vi_nxv2i8_0(<vscale x 2 x i8>)

declare <vscale x 4 x i8> @vremu_vv_nxv4i8(<vscale x 4 x i8>, <vscale x 4 x i8>)

declare <vscale x 4 x i8> @vremu_vx_nxv4i8(<vscale x 4 x i8>, i8 signext)

declare <vscale x 4 x i8> @vremu_vi_nxv4i8_0(<vscale x 4 x i8>)

declare <vscale x 8 x i8> @vremu_vv_nxv8i8(<vscale x 8 x i8>, <vscale x 8 x i8>)

declare <vscale x 8 x i8> @vremu_vx_nxv8i8(<vscale x 8 x i8>, i8 signext)

declare <vscale x 8 x i8> @vremu_vi_nxv8i8_0(<vscale x 8 x i8>)

define <vscale x 16 x i8> @vremu_vv_nxv16i8(<vscale x 16 x i8> %va, <vscale x 16 x i8> %vb) {
  %A = alloca <vscale x 16 x i1>, align 2
  store <vscale x 16 x i1> poison, ptr %A, align 2
  %vc = urem <vscale x 16 x i8> %va, %vb
  %C = icmp ugt <vscale x 16 x i8> %vb, %vb
  store <vscale x 16 x i1> %C, ptr %A, align 2
  ret <vscale x 16 x i8> %vc
}

declare <vscale x 16 x i8> @vremu_vx_nxv16i8(<vscale x 16 x i8>, i8 signext)

declare <vscale x 16 x i8> @vremu_vi_nxv16i8_0(<vscale x 16 x i8>)

declare <vscale x 32 x i8> @vremu_vv_nxv32i8(<vscale x 32 x i8>, <vscale x 32 x i8>)

define <vscale x 32 x i8> @vremu_vx_nxv32i8(<vscale x 32 x i8> %va, i8 signext %b) {
  %A6 = alloca i1, align 1
  store i1 true, ptr %A6, align 1
  %A4 = alloca i1, align 1
  store i1 false, ptr %A4, align 1
  %A = alloca i32, align 4
  store i32 -2147483648, ptr %A, align 4
  %head = insertelement <vscale x 32 x i8> poison, i8 %b, i32 0
  %L = load i32, ptr %A, align 4
  switch i32 %L, label %SW_D [
    i32 -2026058677, label %SW_C
    i32 1935555996, label %SW_C1
    i32 -652453053, label %SW_C2
    i32 -863632580, label %SW_C3
  ]

BB:                                               ; preds = %SW_C3, %SW_C2, %SW_C1, %SW_C, %SW_D
  %splat = shufflevector <vscale x 32 x i8> %head, <vscale x 32 x i8> poison, <vscale x 32 x i32> zeroinitializer
  %vc = urem <vscale x 32 x i8> %va, %splat
  ret <vscale x 32 x i8> %vc

SW_D:                                             ; preds = %SW_D, %0
  %L5 = load i1, ptr %A4, align 1
  br i1 %L5, label %BB, label %SW_D

SW_C:                                             ; preds = %0
  br label %BB

SW_C1:                                            ; preds = %SW_C1, %0
  %LGV = load i1, ptr @G.2, align 1
  %L7 = load i1, ptr %A6, align 1
  br i1 %L7, label %SW_C1, label %BB

SW_C2:                                            ; preds = %0
  br label %BB

SW_C3:                                            ; preds = %0
  br label %BB
}

declare <vscale x 32 x i8> @vremu_vi_nxv32i8_0(<vscale x 32 x i8>)

declare <vscale x 64 x i8> @vremu_vv_nxv64i8(<vscale x 64 x i8>, <vscale x 64 x i8>)

define <vscale x 64 x i8> @vremu_vx_nxv64i8(<vscale x 64 x i8> %va, i8 signext %b) {
  %A = alloca <vscale x 2 x i1>, align 1
  store <vscale x 2 x i1> poison, ptr %A, align 1
  %head = insertelement <vscale x 64 x i8> poison, i8 %b, i32 0
  %splat = shufflevector <vscale x 64 x i8> %head, <vscale x 64 x i8> poison, <vscale x 64 x i32> zeroinitializer
  %vc = urem <vscale x 64 x i8> %va, %splat
  %C = fcmp ule <vscale x 2 x float> splat (float +qnan), splat (float f0x7F7FFFFF)
  store <vscale x 2 x i1> %C, ptr %A, align 1
  ret <vscale x 64 x i8> %vc
}

declare <vscale x 64 x i8> @vremu_vi_nxv64i8_0(<vscale x 64 x i8>)

declare <vscale x 1 x i16> @vremu_vv_nxv1i16(<vscale x 1 x i16>, <vscale x 1 x i16>)

declare <vscale x 1 x i16> @vremu_vx_nxv1i16(<vscale x 1 x i16>, i16 signext)

declare <vscale x 1 x i16> @vremu_vi_nxv1i16_0(<vscale x 1 x i16>)

declare <vscale x 2 x i16> @vremu_vv_nxv2i16(<vscale x 2 x i16>, <vscale x 2 x i16>)

declare <vscale x 2 x i16> @vremu_vx_nxv2i16(<vscale x 2 x i16>, i16 signext)

declare <vscale x 2 x i16> @vremu_vi_nxv2i16_0(<vscale x 2 x i16>)

declare <vscale x 4 x i16> @vremu_vv_nxv4i16(<vscale x 4 x i16>, <vscale x 4 x i16>)

declare <vscale x 4 x i16> @vremu_vx_nxv4i16(<vscale x 4 x i16>, i16 signext)

declare <vscale x 4 x i16> @vremu_vi_nxv4i16_0(<vscale x 4 x i16>)

declare <vscale x 8 x i16> @vremu_vv_nxv8i16(<vscale x 8 x i16>, <vscale x 8 x i16>)

declare <vscale x 8 x i16> @vremu_vx_nxv8i16(<vscale x 8 x i16>, i16 signext)

declare <vscale x 8 x i16> @vremu_vi_nxv8i16_0(<vscale x 8 x i16>)

declare <vscale x 16 x i16> @vremu_vv_nxv16i16(<vscale x 16 x i16>, <vscale x 16 x i16>)

declare <vscale x 16 x i16> @vremu_vx_nxv16i16(<vscale x 16 x i16>, i16 signext)

declare <vscale x 16 x i16> @vremu_vi_nxv16i16_0(<vscale x 16 x i16>)

declare <vscale x 32 x i16> @vremu_vv_nxv32i16(<vscale x 32 x i16>, <vscale x 32 x i16>)

declare <vscale x 32 x i16> @vremu_vx_nxv32i16(<vscale x 32 x i16>, i16 signext)

declare <vscale x 32 x i16> @vremu_vi_nxv32i16_0(<vscale x 32 x i16>)

declare <vscale x 1 x i32> @vremu_vv_nxv1i32(<vscale x 1 x i32>, <vscale x 1 x i32>)

declare <vscale x 1 x i32> @vremu_vx_nxv1i32(<vscale x 1 x i32>, i32 signext)

declare <vscale x 1 x i32> @vremu_vi_nxv1i32_0(<vscale x 1 x i32>)

define <vscale x 2 x i32> @vremu_vv_nxv2i32(<vscale x 2 x i32> %va, <vscale x 2 x i32> %vb) {
  %LGV = load double, ptr @G, align 8
  %C = fcmp one double 1.000000e+00, %LGV
  %vc = urem <vscale x 2 x i32> %va, %vb
  store i1 %C, ptr @G.1, align 1
  ret <vscale x 2 x i32> %vc
}

declare <vscale x 2 x i32> @vremu_vx_nxv2i32(<vscale x 2 x i32>, i32 signext)

declare <vscale x 2 x i32> @vremu_vi_nxv2i32_0(<vscale x 2 x i32>)

declare <vscale x 4 x i32> @vremu_vv_nxv4i32(<vscale x 4 x i32>, <vscale x 4 x i32>)

declare <vscale x 4 x i32> @vremu_vx_nxv4i32(<vscale x 4 x i32>, i32 signext)

declare <vscale x 4 x i32> @vremu_vi_nxv4i32_0(<vscale x 4 x i32>)

declare <vscale x 8 x i32> @vremu_vv_nxv8i32(<vscale x 8 x i32>, <vscale x 8 x i32>)

declare <vscale x 8 x i32> @vremu_vx_nxv8i32(<vscale x 8 x i32>, i32 signext)

declare <vscale x 8 x i32> @vremu_vi_nxv8i32_0(<vscale x 8 x i32>)

declare <vscale x 16 x i32> @vremu_vv_nxv16i32(<vscale x 16 x i32>, <vscale x 16 x i32>)

declare <vscale x 16 x i32> @vremu_vx_nxv16i32(<vscale x 16 x i32>, i32 signext)

declare <vscale x 16 x i32> @vremu_vi_nxv16i32_0(<vscale x 16 x i32>)

declare <vscale x 1 x i64> @vremu_vv_nxv1i64(<vscale x 1 x i64>, <vscale x 1 x i64>)

declare <vscale x 1 x i64> @vremu_vx_nxv1i64(<vscale x 1 x i64>, i64)

declare <vscale x 1 x i64> @vremu_vi_nxv1i64_0(<vscale x 1 x i64>)

declare <vscale x 1 x i64> @vremu_vi_nxv1i64_1(<vscale x 1 x i64>)

declare <vscale x 1 x i64> @vremu_vi_nxv1i64_2(<vscale x 1 x i64>, <vscale x 1 x i64>)

declare <vscale x 2 x i64> @vremu_vv_nxv2i64(<vscale x 2 x i64>, <vscale x 2 x i64>)

declare <vscale x 2 x i64> @vremu_vx_nxv2i64(<vscale x 2 x i64>, i64)

declare <vscale x 2 x i64> @vremu_vi_nxv2i64_0(<vscale x 2 x i64>)

declare <vscale x 2 x i64> @vremu_vi_nxv2i64_1(<vscale x 2 x i64>)

declare <vscale x 2 x i64> @vremu_vi_nxv2i64_2(<vscale x 2 x i64>, <vscale x 2 x i64>)

declare <vscale x 4 x i64> @vremu_vv_nxv4i64(<vscale x 4 x i64>, <vscale x 4 x i64>)

declare <vscale x 4 x i64> @vremu_vx_nxv4i64(<vscale x 4 x i64>, i64)

declare <vscale x 4 x i64> @vremu_vi_nxv4i64_0(<vscale x 4 x i64>)

declare <vscale x 4 x i64> @vremu_vi_nxv4i64_1(<vscale x 4 x i64>)

declare <vscale x 4 x i64> @vremu_vi_nxv4i64_2(<vscale x 4 x i64>, <vscale x 4 x i64>)

define <vscale x 8 x i64> @vremu_vv_nxv8i64(<vscale x 8 x i64> %va, <vscale x 8 x i64> %vb) {
  %B = add <vscale x 8 x i64> %va, splat (i64 -1)
  %vc = urem <vscale x 8 x i64> %va, %B
  ret <vscale x 8 x i64> %vc
}

define <vscale x 8 x i64> @vremu_vx_nxv8i64(<vscale x 8 x i64> %va, i64 %b) {
  %A = alloca i1, align 1
  store i1 false, ptr %A, align 1
  %LGV = load i1, ptr @G.2, align 1
  %head = insertelement <vscale x 8 x i64> poison, i64 %b, i32 0
  %splat = shufflevector <vscale x 8 x i64> %head, <vscale x 8 x i64> poison, <vscale x 8 x i32> zeroinitializer
  %vc = urem <vscale x 8 x i64> %va, %splat
  br i1 %LGV, label %T, label %F

BB:                                               ; preds = %F, %T
  ret <vscale x 8 x i64> %vc

T:                                                ; preds = %0
  br label %BB

F:                                                ; preds = %F, %0
  %L = load i1, ptr %A, align 1
  br i1 %L, label %BB, label %F
}

declare <vscale x 8 x i64> @vremu_vi_nxv8i64_0(<vscale x 8 x i64>)

declare <vscale x 8 x i64> @vremu_vi_nxv8i64_1(<vscale x 8 x i64>)

declare <vscale x 8 x i64> @vremu_vi_nxv8i64_2(<vscale x 8 x i64>, <vscale x 8 x i64>)
