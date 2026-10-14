# Built as an LLVM external project (see build.sh):
#   -DLLVM_EXTERNAL_PROJECTS=irmutate -DLLVM_EXTERNAL_IRMUTATE_SOURCE_DIR=<this dir>
set(LLVM_LINK_COMPONENTS
  AsmParser
  Core
  FuzzMutate
  Support
  )

add_llvm_tool(ir-mutate
  ir-mutate.cpp
  )
