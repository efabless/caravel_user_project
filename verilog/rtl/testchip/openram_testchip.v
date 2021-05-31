module openram_testchip(
   `ifdef USE_POWER_PINS
      inout vdda1,        // User area 1 3.3V supply
      inout vdda2,        // User area 2 3.3V supply
      inout vssa1,        // User area 1 analog ground
      inout vssa2,        // User area 2 analog ground
      inout vccd1,        // User area 1 1.8V supply
      inout vccd2,        // User area 2 1.8v supply
      inout vssd1,        // User area 1 digital ground
      inout vssd2,        // User area 2 digital ground
  `endif
  input         clock,
  input         reset,
  input  [85:0] io_logical_analyzer_packet,
  input  [55:0] io_gpio_packet,
  input         io_in_select,
  input  [31:0] io_sram0_rw_in,
  input  [31:0] io_sram0_r0_in,
  input  [31:0] io_sram1_rw_in,
  input  [31:0] io_sram1_ro_in,
  input  [31:0] io_sram2_rw_in,
  input  [31:0] io_sram3_rw_in,
  input  [31:0] io_sram4_rw_in,
  input  [63:0] io_sram5_rw_in,
  output [54:0] io_sram0_connections,
  output [54:0] io_sram1_connections,
  output [47:0] io_sram2_connections,
  output [45:0] io_sram3_connections,
  output [46:0] io_sram4_connections,
  output [82:0] io_sram5_connections,
  output [63:0] io_sram_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [95:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [85:0] input_; // @[openram_testchip.scala 30:20]
  wire [2:0] chip_select = input_[85:83]; // @[openram_testchip.scala 40:34]
  wire  csb0 = input_[54]; // @[openram_testchip.scala 49:21]
  wire  web = input_[53]; // @[openram_testchip.scala 50:20]
  wire  _T = 3'h0 == chip_select; // @[Conditional.scala 37:30]
  wire  _T_1 = 3'h1 == chip_select; // @[Conditional.scala 37:30]
  wire  _T_2 = 3'h2 == chip_select; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h3 == chip_select; // @[Conditional.scala 37:30]
  wire  _T_4 = 3'h4 == chip_select; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h5 == chip_select; // @[Conditional.scala 37:30]
  wire [82:0] _GEN_0 = _T_5 ? input_[82:0] : 83'h7ffffffffffffffffffff; // @[Conditional.scala 39:67 openram_testchip.scala 74:34 openram_testchip.scala 47:26]
  wire [46:0] _GEN_1 = _T_4 ? input_[46:0] : 47'h7fffffffffff; // @[Conditional.scala 39:67 openram_testchip.scala 70:34 openram_testchip.scala 46:26]
  wire [82:0] _GEN_2 = _T_4 ? 83'h7ffffffffffffffffffff : _GEN_0; // @[Conditional.scala 39:67 openram_testchip.scala 47:26]
  wire [45:0] _GEN_3 = _T_3 ? input_[45:0] : 46'h3fffffffffff; // @[Conditional.scala 39:67 openram_testchip.scala 66:34 openram_testchip.scala 45:26]
  wire [46:0] _GEN_4 = _T_3 ? 47'h7fffffffffff : _GEN_1; // @[Conditional.scala 39:67 openram_testchip.scala 46:26]
  wire [82:0] _GEN_5 = _T_3 ? 83'h7ffffffffffffffffffff : _GEN_2; // @[Conditional.scala 39:67 openram_testchip.scala 47:26]
  wire [47:0] _GEN_6 = _T_2 ? input_[47:0] : 48'hffffffffffff; // @[Conditional.scala 39:67 openram_testchip.scala 62:34 openram_testchip.scala 44:26]
  wire [45:0] _GEN_7 = _T_2 ? 46'h3fffffffffff : _GEN_3; // @[Conditional.scala 39:67 openram_testchip.scala 45:26]
  wire [46:0] _GEN_8 = _T_2 ? 47'h7fffffffffff : _GEN_4; // @[Conditional.scala 39:67 openram_testchip.scala 46:26]
  wire [82:0] _GEN_9 = _T_2 ? 83'h7ffffffffffffffffffff : _GEN_5; // @[Conditional.scala 39:67 openram_testchip.scala 47:26]
  wire [54:0] _GEN_10 = _T_1 ? input_[54:0] : 55'h7fffffffffffff; // @[Conditional.scala 39:67 openram_testchip.scala 58:34 openram_testchip.scala 43:26]
  wire [47:0] _GEN_11 = _T_1 ? 48'hffffffffffff : _GEN_6; // @[Conditional.scala 39:67 openram_testchip.scala 44:26]
  wire [45:0] _GEN_12 = _T_1 ? 46'h3fffffffffff : _GEN_7; // @[Conditional.scala 39:67 openram_testchip.scala 45:26]
  wire [46:0] _GEN_13 = _T_1 ? 47'h7fffffffffff : _GEN_8; // @[Conditional.scala 39:67 openram_testchip.scala 46:26]
  wire [82:0] _GEN_14 = _T_1 ? 83'h7ffffffffffffffffffff : _GEN_9; // @[Conditional.scala 39:67 openram_testchip.scala 47:26]
  wire [31:0] _io_sram_data_T = csb0 ? io_sram0_r0_in : io_sram0_rw_in; // @[openram_testchip.scala 84:36]
  wire [31:0] _io_sram_data_T_1 = csb0 ? io_sram1_ro_in : io_sram1_rw_in; // @[openram_testchip.scala 88:37]
  wire [63:0] _GEN_21 = _T_5 ? io_sram5_rw_in : 64'h0; // @[Conditional.scala 39:67 openram_testchip.scala 104:30 openram_testchip.scala 78:18]
  wire [63:0] _GEN_22 = _T_4 ? {{32'd0}, io_sram4_rw_in} : _GEN_21; // @[Conditional.scala 39:67 openram_testchip.scala 100:30]
  wire [63:0] _GEN_23 = _T_3 ? {{32'd0}, io_sram3_rw_in} : _GEN_22; // @[Conditional.scala 39:67 openram_testchip.scala 96:30]
  wire [63:0] _GEN_24 = _T_2 ? {{32'd0}, io_sram2_rw_in} : _GEN_23; // @[Conditional.scala 39:67 openram_testchip.scala 92:30]
  wire [63:0] _GEN_25 = _T_1 ? {{32'd0}, _io_sram_data_T_1} : _GEN_24; // @[Conditional.scala 39:67 openram_testchip.scala 88:30]
  wire [63:0] _GEN_26 = _T ? {{32'd0}, _io_sram_data_T} : _GEN_25; // @[Conditional.scala 40:58 openram_testchip.scala 84:30]
  assign io_sram0_connections = _T ? input_[54:0] : 55'h7fffffffffffff; // @[Conditional.scala 40:58 openram_testchip.scala 54:34 openram_testchip.scala 42:26]
  assign io_sram1_connections = _T ? 55'h7fffffffffffff : _GEN_10; // @[Conditional.scala 40:58 openram_testchip.scala 43:26]
  assign io_sram2_connections = _T ? 48'hffffffffffff : _GEN_11; // @[Conditional.scala 40:58 openram_testchip.scala 44:26]
  assign io_sram3_connections = _T ? 46'h3fffffffffff : _GEN_12; // @[Conditional.scala 40:58 openram_testchip.scala 45:26]
  assign io_sram4_connections = _T ? 47'h7fffffffffff : _GEN_13; // @[Conditional.scala 40:58 openram_testchip.scala 46:26]
  assign io_sram5_connections = _T ? 83'h7ffffffffffffffffffff : _GEN_14; // @[Conditional.scala 40:58 openram_testchip.scala 47:26]
  assign io_sram_data = web ? _GEN_26 : 64'h0; // @[openram_testchip.scala 80:14 openram_testchip.scala 78:18]
  always @(posedge clock) begin
    if (io_in_select) begin // @[openram_testchip.scala 38:17]
      input_ <= {{30'd0}, io_gpio_packet};
    end else begin
      input_ <= io_logical_analyzer_packet;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {3{`RANDOM}};
  input_ = _RAND_0[85:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
