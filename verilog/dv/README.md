<!---
# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0
-->

# Simulation Environment Setup

There are two options for setting up the simulation environment: 

* Pulling a pre-built docker image 
* Installing the dependecies locally

## 1. Docker

There is an available docker setup with the needed tools at [efabless/dockerized-verification-setup](https://github.com/efabless/dockerized-verification-setup) 

Run the following to pull the image: 

```
docker pull efabless/dv_setup:latest
```

## 2. Local Installion (Linux)

You will need to fullfil these dependecies: 

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

## Docker

First, you will need to export a number of environment variables: 

```bash
export PDK_PATH=<pdk-location/sky130A>
export CARAVEL_ROOT=<caravel_root>
```

Then, run the following command to start the docker container :

```
docker run -it -v $CARAVEL_ROOT:$CARAVEL_ROOT -v $PDK_PATH:$PDK_PATH -e CARAVEL_ROOT=$CARAVEL_ROOT -e PDK_PATH=$PDK_PATH  -u $(id -u $USER):$(id -g $USER) efabless/dv_setup:latest
```

Then, navigate to the directory where the DV tests reside : 

```bash
cd $CARAVEL_ROOT/verilog/dv/caravel/user_proj_example
```

Then, follow the instructions at [Both](#both) to run RTL/GL simulation.

## Local

You will need to export these environment variables: 

```bash
export GCC_PATH=<gcc-installation-path>
export PDK_PATH=<pdk-location/sky130A>
```

Then, follow the instruction at [Both](#both) to run RTL/GL simulation.

## Both

To run RTL simulation for one of the DV tests, 

```bash
cd <dv-test>
make
```

To run gate level simulation for one of the DV tests, 

```bash
cd <dv-test>
SIM=GL make
```

# User Project Example DV

The directory includes four tests for the counter user-project example: 

### IO Ports Test 

* This test is meant to verify that we can configure the pads for the user project area. The firmware configures the lower 8 IO pads in the user space as outputs:

	```c
	reg_mprj_io_0 =  GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_1 =  GPIO_MODE_USER_STD_OUTPUT;
	.....
	reg_mprj_io_7 =  GPIO_MODE_USER_STD_OUTPUT;
	```

* Then, the firmware applies the pad configuration by enabling the serial transfer on the shift register responsible for configuring the pads and waits till the transfer is done. 
	```c
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);
	```

* The testbench success criteria is that we can observe the counter value on the lower 8 I/O pads. This criteria is checked by the testbench through observing the values on the I/O pads as follows: 

	```verilog
	wait(mprj_io_0 == 8'h01);
	wait(mprj_io_0 == 8'h02);
	wait(mprj_io_0 == 8'h03);
	....
	wait(mprj_io_0 == 8'hFF);
	```

* If the testbench fails, it will print a timeout message to the terminal. 

### Logic Analyzer Test 1
 
* This test is meant to verify that we can use the logic analyzer to monitor and write signals in the user project from the management SoC. Firstly, the firmware configures the upper 16 pads as outputs from the managent SoC, applies the configuration by initiating the serial transfer on the shift register, and writes a value on the pads to indicate the end of pad configuration and the start of the test. 

	```c
	reg_mprj_io_31 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_30 = GPIO_MODE_MGMT_STD_OUTPUT;
	.....
	reg_mprj_io_16 = GPIO_MODE_MGMT_STD_OUTPUT;

	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);

	// Flag start of the test 
	reg_mprj_datal = 0xAB400000;
	```
	
	This is done to flag the start/success/end of the simulation by writing a certain value to the I/Os which is then checked by the testbench to know whether the test started/ended/succeeded. For example, the testbench checks on the value of the upper 16 I/Os, if it is equal to `16'hAB40`, then we know that the test started.  

	```verilog
	wait(checkbits == 16'hAB40);
	$display("LA Test 1 started");
	```
	
* Then, the firmware configures the logic analyzer (LA) probes `[31:0]` as inputs to the management SoC to monitor the counter value, and configure the logic analyzer probes `[63:32]` as outputs from the management SoC (inputs to the user_proj_example) to set the counter initial value. This is done by writing to the LA probes enable registers. 

 
	```c
	reg_la0_ena = 0xFFFFFFFF;    // [31:0] inputs to mgmt_soc
	reg_la1_ena = 0x00000000;    // [63:32] outputs from mgmt_soc
	```

* Then, the firmware writes an initial value to the counter through the LA1 data register. Afte writing the counter value, the LA probes are disabled to prevent the counter write signal from being always set to one. 

	```c
	reg_la1_data = 0x00000000;     // Write zero to count register
	reg_la1_ena  = 0xFFFFFFFF;     // Disable probes
	```

* The firmware then waits till the count value exceeds 500 and flags the success of the test by writing `0xAB41` to the upper 16 pads.  The firmware reads the count value through the logic analyzer probes `[31:0]` 

	```c
	if (reg_la0_data > 0x1F4) {	     // Read current count value through LA
		reg_mprj_datal = 0xAB410000; // Flag success of the test
		break;
	}
	```
  
### Logic Analyzer Test 2
 
* This test is meant to verify that we can drive the clock and reset signals for the user project example through the logic analyzer. In the [user_proj_example](verilog/rtl/user_proj_example.v) RTL, the clock can either be supplied from the `wb_clk_i` or from the logic analyzer through bit `[64]`. Similarly, the reset signal can be supplied from the `wb_rst_i` or through `LA[65]`.  The firmware configures the clk and reset LA probes as outputs from the management SoC by writing to the LA2 enable register. 

	```c
	reg_la2_ena  = 0xFFFFFFFC; 	// Configure LA[64] LA[65] as outputs from the cpu
	```

* Then, the firmware supplies both clock reset signals through LA2 data register. First, both are set to one. Then, reset is driven to zero and the clock is toggled for 6 clock cycles. 

	```c
	reg_la2_data = 0x00000003;	// Write one to LA[64] and LA[65]
	for (i=0; i<11; i=i+1) {   	// Toggle clk & de-assert reset
		clk = !clk;               	
		reg_la2_data = 0x00000000 | clk;
	}
	```
* The testbench success criteria is that the firmware reads a count value of five through the LA probes. 
	```c
	if (reg_la0_data == 0x05) {
		reg_mprj_datal = 0xAB610000;   // FLag success of the test
	}
	```
	
### Wishbone Test

* This test is meant to verify that we can read and write to the count register through the wishbone port. The firmware writes a value of `0x2710` to the count register, then reads back the count value after some time. The read and write transactions happen through the management SoC wishbone bus and are initiated by either writing or reading from the user project address on the wishbone bus. 

	```c
	reg_mprj_slave = 0x00002710;           // Write to the count register through wishbone port
	if (reg_mprj_slave == 0x274F) {	       // Read from the count register through wishbone port
		reg_mprj_datal = 0xAB610000;   // FLag success of the test
	} else {
		reg_mprj_datal = 0xAB600000;   // FLag Failuer of the test
	}
	```