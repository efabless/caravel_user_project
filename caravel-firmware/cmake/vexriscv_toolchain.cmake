# To use this file you must invoke cmake with -DCMAKE_TOOLCHAIN_FILE like so:
# (From build directory)
# `cmake -DCMAKE_TOOLCHAIN_FILE=cmake/riscv_toolchain.cmake .`

find_path(RISCV_TOOLCHAIN_PATH "riscv32-unknown-elf-gcc" ENV PATH)
message("RISC-V compiler found in: ${RISCV_TOOLCHAIN_PATH}")

set(CMAKE_SYSTEM_NAME Generic)

set(CMAKE_C_COMPILER ${RISCV_TOOLCHAIN_PATH}/riscv32-unknown-elf-gcc)
set(CMAKE_CXX_COMPILER ${RISCV_TOOLCHAIN_PATH}/riscv32-unknown-elf-g++)

set(RISCV_GENERAL_COMPILER_FLAGS "-g")
set(RISCV_C_FLAGS ${RISCV_GENERAL_COMPILER_FLAGS})
set(RISCV_CXX_FLAGS ${RISCV_GENERAL_COMPILER_FLAGS})

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${RISCV_C_FLAGS}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${RISCV_CXX_FLAGS}")
