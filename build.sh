#!/bin/bash
# Builds the tools the campaign needs into llvm-project/build:
# llc, llvm-extract, llvm-reduce and ir-mutate (RISC-V only, assertions on).
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
LLVM_SRC="${LLVM_SRC:-$HERE/llvm-project}"
SOURCE_DIR="$LLVM_SRC/llvm"
BUILD_DIR="${LLVM_BUILD:-$LLVM_SRC/build}"

CMAKE_EXTRA_ARGS=()
if [ -n "${LLVM_USE_LINKER:-}" ]; then
    CMAKE_EXTRA_ARGS+=("-DLLVM_USE_LINKER=$LLVM_USE_LINKER")
fi
if command -v sccache >/dev/null 2>&1; then
    echo "Using sccache"
    CMAKE_EXTRA_ARGS+=("-DCMAKE_C_COMPILER_LAUNCHER=sccache")
    CMAKE_EXTRA_ARGS+=("-DCMAKE_CXX_COMPILER_LAUNCHER=sccache")
elif command -v ccache >/dev/null 2>&1; then
    CMAKE_EXTRA_ARGS+=("-DCMAKE_C_COMPILER_LAUNCHER=ccache")
    CMAKE_EXTRA_ARGS+=("-DCMAKE_CXX_COMPILER_LAUNCHER=ccache")
fi

cmake -G Ninja \
    -S "$SOURCE_DIR" \
    -B "$BUILD_DIR" \
    -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_ENABLE_ASSERTIONS=ON \
    -DLLVM_TARGETS_TO_BUILD=RISCV \
    -DLLVM_EXTERNAL_PROJECTS=irmutate \
    -DLLVM_EXTERNAL_IRMUTATE_SOURCE_DIR="$HERE/ir-mutate" \
    -DLLVM_INCLUDE_BENCHMARKS=OFF \
    -DLLVM_INCLUDE_EXAMPLES=OFF \
    -DLLVM_INCLUDE_TESTS=OFF \
    -DLLVM_ENABLE_BINDINGS=OFF \
    -DLLVM_ENABLE_LIBXML2=OFF \
    -DLLVM_ENABLE_ZLIB=OFF \
    -DLLVM_ENABLE_ZSTD=OFF \
    -DLLVM_PARALLEL_LINK_JOBS="${LLVM_PARALLEL_LINK_JOBS:-2}" \
    "${CMAKE_EXTRA_ARGS[@]}"

ninja ${BUILD_JOBS:+-j "$BUILD_JOBS"} -C "$BUILD_DIR" llc llvm-extract llvm-reduce ir-mutate
