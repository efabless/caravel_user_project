# Caravel User Project

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

| :exclamation: Important Note            |
|-----------------------------------------|

# Overview

This project contains a test chip for several OpenRAM memory configurations. The
configurations have varying levels of verification. In particular, it has these sizes:
* sky130_sram_1kbyte_1rw1r_8x1024_8
* sky130_sram_1kbyte_1rw1r_32x256_8
* sky130_sram_2kbyte_1rw1r_32x512_8
* sky130_sram_4kbyte_1rw1r_32x1024_8
* sky130_sram_8kbyte_1rw1r_32x2048_8
* sky130_sram_1kbyte_1rw_32x256_8
* sky130_sram_2kbyte_1rw_32x512_8
* sky130_sram_4kbyte_1rw_32x1024_8
* sky130_sram_8kbyte_1rw_32x512_8
* sky130_sram_8kbyte_1rw_64x1024_8

# Test Modes

There are two test modes available. Each one inputs an packet that
configures the read and write operations of a particular SRAM. The
GPIO pin io_in[16] determines whether to use GPIO (1) or LA mode (0).

## Test Packet

The test packet is a 112-bit value that has the follow signals and bit size:
* chip_select (4)
* addr0 (16)
* din0 (32)
* csb0 (1)
* web0 (1)
* wmask0 (1)
* addr1 (16)
* din1 (32)
* csb1 (1)
* web1 (1)
* wmask1 (4)

During a read operation, the din bits are replaced with the data
output bits so that they can be verified.

Note: The 64-bit memory leaves the middle 32-bits as a value of 0 and
instead reads/writes the upper and lower 16-bits to reduce the number
of packet bits.

## GPIO Mode

In GPIO mode, the test packet is scanned in/out with the GPIO pins in 112 cycles. The
GPIO pins used are as follows:
* Test mode select: in_select io_in[16]
* Scan reset: resetn: io_in[15]
* Scan clock: gpio_clk io_in[17]
* Scan enable: gpio_scan io_in[19]
* Load SRAM result into register: gpio_sram_load io_in[20]
* CSB for all SRAM: global_csb io_in[21]
* Scan input: gpio_in io_in[22]
* Scan output: gpio_out io_out[22]


## LA Mode

In LA mode, the test packet is directly written from the output of the 128-bit LA.
The top bits of the LA register are used for the control signals during test:
* Control register clock: la_clk la_data_in[127]
* Load control register: la_in_load la_data_in[125]
* Load SRAM result into register: la_sram_load la_data_in[124]
* CSB for all SRAM: ??

# Authors

Jesse Cirimeli-Low <jcirimel@ucsc.edu>
Amogh Lonkar <alonkar@ucsc.edu>
Matthew Guthaus <mrg@ucsc.edu>
