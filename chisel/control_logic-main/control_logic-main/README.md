Control Logic Generator for OpenRAM Test Chip
=======================
This repo contains an implementation of a hardware generator for the control logic required for the OpenRAM Test Chip.
It is designed to receive an input packet from either the logic analyzer or GPIO pins and forward it to the desired SRAM module.
For a read operation, the logic will read back data from the SRAM and send it to the CPU via the interface.

### Steps to Run
Once cloned and entered the top level directory, we can run the provided tests and generate synthesizable verilog.

1.) To generate verilog, type and enter `sbt run` in the terminal.

2.) To run the tests, type and enter `sbt test` in the terminal.
