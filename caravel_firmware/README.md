# Caravel firmware
The files in this directory are a common place for firmware code to be written. Whilst a subdirectory now this directory should be made a separate repo and then "submoduled" in any caravel repo that requires it. This allows common aspects of the firmware to be developed independently of the design, but the design specifies exactly which version of firmware is relevant to the current state of the design.

## Motivation
The reason to move firmware builds into a single place is twofold:
* All configuration necessary to compile the firmware is in one place. For users developing firmware it then becomes transparent what compiler flags, linker scripts etc... are required to compile their own firmware.
* Firmware development continues independently of the design. Abstract classes and structs that are independent of the design can be developed separately to the design and the design specifies when it's ready to take those updates.

## Building
To build the firmware you need to install cmake (and optionally Ninja) and ensure that the GCC toolchain executables are added to the PATH. Cmake is a fantastic tool which is able to generate build scripts for multiple toolchains (GNU Make, Ninja, MSVC, Xcode) so that firmware can be built on any platform. For more information please consult [the cmake documentation](https://cmake.org/).

### Configuration
The build with cmake takes place in two parts; configuration, which generates the build files and building which does the compilation. To configure the cmake build run
```bash
cmake -DCMAKE_TOOLCHAIN_FILE=cmake/vexriscv_toolchain.cmake -Bbuild -GNinja
```
from this directory. This can be explained as:
* `-DCMAKE_TOOLCHAIN_FILE=cmake/vexriscv_toolchain.cmake` tells cmake to load the toochain as specified by `vexriscv_toolchain.cmake`. This file just tells cmake where to find the compiler and some global additional compiler flags.
* `-Bbuild` tells cmake to put the build files in a directory called `build`
* `-GNinja` tells cmake which generator to use. This is optional and defaults to  whatever host you are building on, for Linux systems this is GNU Make. Ninja is a  fast and efficient alternative and I suggest using it.

### Building
Now that cmake has configured the build, the source code can be compiled. To do this simply run
```bash
cmake --build build/
```
which tells cmake to build all things in the `build/` directory. All the build artifacts are placed in the `build/` directory with the same layout as this directory.
