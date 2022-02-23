# Local Installation (Linux)

Instructions to install the dv setup locally (dockerless install).

## You will need to fullfil these dependecies: 

* Icarus Verilog (10.2+)
* RV32I Toolchain

Using apt, you can install Icarus Verilog:

```bash
sudo apt-get install iverilog
```

Next, you will need to build the RV32I toolchain. Firstly, export the installation path for the RV32I toolchain, 

```bash
export GCC_PATH=<gcc-installation-path>
```

Then, run the following: 

```bash
# packages needed:
sudo apt-get install autoconf automake autotools-dev curl libmpc-dev \
    libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo \
    gperf libtool patchutils bc zlib1g-dev git libexpat1-dev

sudo mkdir $GCC_PATH
sudo chown $USER $GCC_PATH

git clone https://github.com/riscv/riscv-gnu-toolchain riscv-gnu-toolchain-rv32i
cd riscv-gnu-toolchain-rv32i
git checkout 411d134
git submodule update --init --recursive

mkdir build; cd build
../configure --with-arch=rv32i --prefix=$GCC_PATH
make -j$(nproc)
```

# Running Simulation

You will need to export these environment variables: 

```bash
export GCC_PATH=<gcc-installation-path>
export PDK_PATH=<pdk-location/sky130A>
```

To run any simulation, you need to be on the top level or caravel_user_project.

To run RTL simulation for one of the DV tests, 

```bash
SIM=RTL make verify-<dv-test>
```

To run gate level simulation for one of the DV tests, 

```bash
SIM=GL make verify-<dv-test>
```

