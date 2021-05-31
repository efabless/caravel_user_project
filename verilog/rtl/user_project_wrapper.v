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
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
) (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

wire [54:0] sram0_connections;
wire [54:0] sram1_connections;
wire [47:0] io_sram2_connections;
wire [45:0] io_sram3_connections;
wire [46:0] io_sram4_connections;
wire [82:0] io_sram5_connections;


wire [31:0] sram0_rw_out;
wire [31:0] sram0_ro_out;
wire [31:0] sram1_rw_out;
wire [31:0] sram1_ro_out;
wire [31:0] sram2_rw_out;
wire [31:0] sram3_rw_out;
wire [31:0] sram4_rw_out;
wire [63:0] sram5_rw_out;

openram_testchip CONTROL_LOGIC(
    .clock(wb_clk_i),
    .reset(wb_rst_i),
    .io_logical_analyzer_packet(la_data_in[85:0]),
    .io_gpio_packet(la_data_in[85:0]),
    .io_in_select(la_data_in[86]),
    .io_sram0_rw_in(sram0_rw_out),
    .io_sram0_r0_in(sram0_ro_out),
    .io_sram1_rw_in(sram1_rw_out),
    .io_sram1_ro_in(sram1_ro_out),
    .io_sram2_rw_in(sram2_rw_out),
    .io_sram3_rw_in(sram3_rw_out),
    .io_sram4_rw_in(sram4_rw_out),
    .io_sram5_rw_in(sram5_rw_out),
    .io_sram0_connections(sram0_connections),
    .io_sram1_connections(sram1_connections),
    .io_sram2_connections(sram2_connections),
    .io_sram3_connections(sram3_connections),
    .io_sram4_connections(sram4_connections),
    .io_sram5_connections(sram5_connections),
    .io_sram_data(la_data_out[63:0])
);

sky130_sram_1kbyte_1rw1r_32x256_8 SRAM0
     (
      
     `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (wb_clk_i),
      .csb0   (sram0_connections[54]),
      .web0   (sram0_connections[53]),
      .wmask0 (sram0_connections[52:49]),
      .addr0  (sram0_connections[48:41]),
      .din0   (sram0_connections[40:9]),
      .dout0  (sram0_rw_out),
      .clk1   (wb_clk_i),
      .csb1   (sram0_connections[8]),
      .addr1  (sram0_connections[7:0]),
      .dout1  (sram0_ro_out));

sky130_sram_1kbyte_1rw1r_32x256_8 SRAM1
     (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (wb_clk_i),
      .csb0   (sram1_connections[54]),
      .web0   (sram1_connections[53]),
      .wmask0 (sram1_connections[52:49]),
      .addr0  (sram1_connections[48:41]),
      .din0   (sram1_connections[40:9]),
      .dout0  (sram1_rw_out),
      .clk1   (wb_clk_i),
      .csb1   (sram1_connections[8]),
      .addr1  (sram1_connections[7:0]),
      .dout1  (sram1_ro_out));      

sram_1rw0r0w_32_1024_sky130 SRAM2
    (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (wb_clk_i),
      .csb0   (sram2_connections[47]),
      .web0   (sram2_connections[46]),
      .wmask0 (sram2_connections[45:42]),
      .addr0  (sram2_connections[41:32]),
      .din0   (sram2_connections[31:0]),
      .dout0  (sram2_rw_out)); 

sram_1rw0r0w_32_256_sky130 SRAM3
    (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (wb_clk_i),
      .csb0   (sram3_connections[45]),
      .web0   (sram3_connections[44]),
      .wmask0 (sram3_connections[43:40]),
      .addr0  (sram3_connections[39:32]),
      .din0   (sram3_connections[31:0]),
      .dout0  (sram3_rw_out));

sram_1rw0r0w_32_512_sky130 SRAM4
    (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (wb_clk_i),
      .csb0   (sram4_connections[46]),
      .web0   (sram4_connections[45]),
      .wmask0 (sram4_connections[44:41]),
      .addr0  (sram4_connections[40:32]),
      .din0   (sram4_connections[31:0]),
      .dout0  (sram4_rw_out));

sram_1rw0r0w_64_512_sky130 SRAM5
    (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (wb_clk_i),
      .csb0   (sram5_connections[82]),
      .web0   (sram5_connections[81]),
      .wmask0 (sram5_connections[80:73]),
      .addr0  (sram5_connections[72:64]),
      .din0   (sram5_connections[63:0]),
      .dout0  (sram5_rw_out));

endmodule	// user_project_wrapper

`default_nettype wire
