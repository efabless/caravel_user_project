// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype wire

`timescale 1 ns / 1 ps

`include "uprj_netlists.v"
`include "caravel_netlists.v"
`include "spiflash.v"
`include "tbuart.v"

module mprj_stimulus_tb;
    // Signals declaration
    reg clock;
    reg RSTB;
    reg CSB;
    reg power1, power2;
    reg power3, power4;

    wire HIGH;
    wire LOW;
    wire TRI;
    assign HIGH = 1'b1;
    assign LOW = 1'b0;
    assign TRI = 1'bz;

    wire gpio;
    wire uart_tx;
    wire [37:0] mprj_io;
    wire [15:0] checkbits;
    wire [3:0] status;

    // Signals Assignment
    assign checkbits  = mprj_io[31:16];
    assign status = mprj_io[35:32];
    assign uart_tx = mprj_io[6];
    assign mprj_io[3] = (CSB == 1'b1) ? 1'b1 : 1'bz;

    always #12.5 clock <= (clock === 1'b0);

    initial begin
        clock = 0;
    end

    initial begin
        $dumpfile("mprj_stimulus.vcd");
        $dumpvars(0, mprj_stimulus_tb);

        // Repeat cycles of 1000 clock edges as needed to complete testbench
        repeat (150) begin
            repeat (1000) @(posedge clock);
        end
        $display("%c[1;31m",27);
        $display ("Monitor: Timeout, Test Project IO Stimulus (RTL) Failed");
        $display("%c[0m",27);
        $finish;
    end

    initial begin
        wait(checkbits == 16'hAB40);
        $display("Monitor: mprj_stimulus test started");
        wait(status == 4'ha);
        wait(status == 4'h5);
	// Value 0009 reflects copying user-controlled outputs to memory and back
	// to management-controlled outputs.
        wait(checkbits == 16'h0009);
        wait(checkbits == 16'hAB51);
        $display("Monitor: mprj_stimulus test Passed");
        #10000;
        $finish;
    end

   // Reset Operation
    initial begin
        RSTB <= 1'b0;
        CSB  <= 1'b1;       // Force CSB high
        #2000;
        RSTB <= 1'b1;       // Release reset
        #170000;
        CSB = 1'b0;         // CSB can be released
    end

    initial begin		// Power-up sequence
        power1 <= 1'b0;
        power2 <= 1'b0;
        #200;
        power1 <= 1'b1;
        #200;
        power2 <= 1'b1;
    end

    wire flash_csb;
    wire flash_clk;
    wire flash_io0;
    wire flash_io1;

    wire VDD3V3 = power1;
    wire VDD1V8 = power2;
    wire VSS = 1'b0;

    caravel uut (
        .vddio	  (VDD3V3),
        .vssio	  (VSS),
        .vdda	  (VDD3V3),
        .vssa	  (VSS),
        .vccd	  (VDD1V8),
        .vssd	  (VSS),
        .vdda1    (VDD3V3),
        .vdda2    (VDD3V3),
        .vssa1	  (VSS),
        .vssa2	  (VSS),
        .vccd1	  (VDD1V8),
        .vccd2	  (VDD1V8),
        .vssd1	  (VSS),
        .vssd2	  (VSS),
        .clock	  (clock),
        .gpio     (gpio),
        .mprj_io  (mprj_io),
        .flash_csb(flash_csb),
        .flash_clk(flash_clk),
        .flash_io0(flash_io0),
        .flash_io1(flash_io1),
        .resetb	  (RSTB)
    );


    spiflash #(
        .FILENAME("mprj_stimulus.hex")
    ) spiflash (
        .csb(flash_csb),
        .clk(flash_clk),
        .io0(flash_io0),
        .io1(flash_io1),
        .io2(),         // not used
        .io3()          // not used
    );

    // Testbench UART
    tbuart tbuart (
        .ser_rx(uart_tx)
    );

endmodule
`default_nettype wire
