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

`default_nettype none

`timescale 1 ns / 1 ps

`include "uprj_netlists.v"
`include "caravel_netlists.v"
`include "spiflash.v"

module gpio_test_tb;
	reg clock;
	reg RSTB;
	reg CSB;
	reg power1, power2;
	reg power3, power4;

    	wire gpio;
    	wire [37:0] mprj_io;
	wire mprj_io_22 = mprj_io[22];

        wire mprj_io_0 = mprj_io[0];

	//assign mprj_io[3] = (CSB == 1'b1) ? 1'b1 : 1'bz;
	// assign mprj_io[3] = 1'b1;

	// External clock is used by default.  Make this artificially fast for the
	// simulation.  Normally this would be a slow clock and the digital PLL
	// would be the fast clock.

	always #12.5 clock <= (clock === 1'b0);

	initial begin
		clock = 0;
	end

	reg gpio_clk;
	reg gpio_scan;
	reg gpio_sram_load;
	reg global_csb;
	reg gpio_in;

	assign mprj_io[15] = 1'b1; // in_select
	assign mprj_io[16] = 1'b1; // resetn
	assign mprj_io[17] = gpio_clk;
	assign mprj_io[18] = gpio_in;
	assign mprj_io[19] = gpio_scan;
	assign mprj_io[20] = gpio_sram_load;
	assign mprj_io[21] = global_csb;

	always #12.5 gpio_clk = !gpio_clk;

	integer i, j;
	reg [3:0] sel;
	reg [111:0] in_data;
	reg [111:0] out_data;

	initial begin

            wait(mprj_io_0 == 1'b1);
            $display("Saw bit 0");

		$dumpfile("gpio_test.vcd");
		$dumpvars(0, gpio_test_tb);

		gpio_clk = 1;
		global_csb = 1;

		//Testing 32B Dual Port Memories
		for(i = 0; i < 5; i = i + 1) begin
			sel = i;

			//Write 1 to addr1 using GPIO Pins
			gpio_scan = 1;
			gpio_sram_load = 0;
			in_data = {sel, 16'd1, 32'd1, 1'b0, 1'b0, 4'd15, 16'd0, 32'd0, 1'b1, 1'b1, 4'd0};

			for(j = 0; j < 112; j = j + 1) begin
				gpio_in = in_data[111 - j];
				#25;
			end

			gpio_scan = 0;
			global_csb = 0;
			#25;
			global_csb = 1;
			gpio_sram_load = 1;
			#25;

			//Write 2 to addr2 using GPIO Pins
			gpio_scan = 1;
			gpio_sram_load = 0;
			in_data = {sel, 16'd2, 32'd2, 1'b0, 1'b0, 4'd15, 16'd0, 32'd0, 1'b1, 1'b1, 4'd0};

			for(j = 0; j < 112; j = j + 1) begin
				gpio_in = in_data[111 - j];
				#25;
			end

			gpio_scan = 0;
			global_csb = 0;
			#25;
			global_csb = 1;
			gpio_sram_load = 1;
			#25;

			#25;
			//Read addr1 and addr2
			gpio_scan = 1;
			gpio_sram_load = 0;
			in_data = {sel, 16'd1, 32'd0, 1'b0, 1'b1, 4'd0, 16'd2, 32'd0, 1'b0, 1'b1, 4'd0};

			for(j = 0; j < 112; j = j + 1) begin
				gpio_in = in_data[111 - j];
				#25;
			end

			gpio_scan = 0;
			global_csb = 0;
			#25;
			global_csb = 1;
			gpio_sram_load = 1;
			#25;

			#75;
			gpio_sram_load = 0;
			gpio_scan = 1;
			for(j = 0; j < 112; j = j + 1) begin
				out_data[111 - j] = mprj_io_22;
				#25;
			end
			#25;
		end

		//Testing 32B Single Port Memories
		for(i = 8; i < 11; i = i + 1) begin
			sel = i;

			//Write 1 to addr1 using GPIO Pins
			gpio_scan = 1;
			gpio_sram_load = 0;
			in_data = {sel, 16'd1, 32'd1, 1'b0, 1'b0, 4'd15, 16'd0, 32'd0, 1'b0, 1'b0, 4'd0};

			for(j = 0; j < 112; j = j + 1) begin
				gpio_in = in_data[111 - j];
				#25;
			end

			gpio_scan = 0;
			global_csb = 0;
			#25;
			global_csb = 1;
			gpio_sram_load = 1;
			#25;

			//Read addr1
			gpio_scan = 1;
			gpio_sram_load = 0;
			in_data = {sel, 16'd1, 32'd0, 1'b0, 1'b1, 4'd0, 16'd0, 32'd0, 1'b0, 1'b0, 4'd0};

			for(j = 0; j < 112; j = j + 1) begin
				gpio_in = in_data[111 - j];
				#25;
			end

			gpio_scan = 0;
			global_csb = 0;
			#25;
			global_csb = 1;
			gpio_sram_load = 1;
			#25;

			#75;
			gpio_sram_load = 0;
			gpio_scan = 1;
			for(j = 0; j < 112; j = j + 1) begin
				out_data[111 - j] = mprj_io_22;
				#25;
			end
			#25;
		end

		//Testing 64b Single Port Memory
		sel = 11;

		//Write 1 to addr1 using GPIO Pins
		gpio_scan = 1;
		gpio_sram_load = 0;
		in_data = {sel, 16'd1, 32'd1, 1'b0, 1'b0, 4'd15, 16'd0, 32'd0, 1'b0, 1'b0, 4'd0};

		for(j = 0; j < 112; j = j + 1) begin
			gpio_in = in_data[111 - j];
			#25;
		end

		gpio_scan = 0;
		global_csb = 0;
		#10;
		global_csb = 1;
		gpio_sram_load = 1;
		#10;

		//Read addr1
		gpio_scan = 1;
		gpio_sram_load = 0;
		in_data = {sel, 16'd1, 32'd0, 1'b0, 1'b1, 4'd0, 16'd0, 32'd0, 1'b0, 1'b0, 4'd0};

		for(j = 0; j < 112; j = j + 1) begin
			gpio_in = in_data[111 - j];
			#25;
		end

		gpio_scan = 0;
		global_csb = 0;
		#25;
		global_csb = 1;
		gpio_sram_load = 1;
		#25;

		#75;
		gpio_sram_load = 0;
		gpio_scan = 1;
		for(j = 0; j < 112; j = j + 1) begin
			out_data[111 - j] = mprj_io_22;
			#25;
		end

		#25;

		#25; $finish;
	end

	initial begin
		RSTB <= 1'b0;
		CSB  <= 1'b1;		// Force CSB high
		#2000;
		RSTB <= 1'b1;	    	// Release reset
		#170000;
		CSB = 1'b0;		// CSB can be released
	end

	initial begin		// Power-up sequence
		power1 <= 1'b0;
		power2 <= 1'b0;
		power3 <= 1'b0;
		power4 <= 1'b0;
		#100;
		power1 <= 1'b1;
		#100;
		power2 <= 1'b1;
		#100;
		power3 <= 1'b1;
		#100;
		power4 <= 1'b1;
	end

	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;

	wire VDD3V3 = power1;
	wire VDD1V8 = power2;
	wire USER_VDD3V3 = power3;
	wire USER_VDD1V8 = power4;
	wire VSS = 1'b0;

	caravel uut (
		.vddio	  (VDD3V3),
		.vssio	  (VSS),
		.vdda	  (VDD3V3),
		.vssa	  (VSS),
		.vccd	  (VDD1V8),
		.vssd	  (VSS),
		.vdda1    (USER_VDD3V3),
		.vdda2    (USER_VDD3V3),
		.vssa1	  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (USER_VDD1V8),
		.vccd2	  (USER_VDD1V8),
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
		.FILENAME("gpio_test.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);

endmodule
`default_nettype wire
