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
  input  [55:0] io_logical_analyzer_packet,
  input  [55:0] io_gpio_packet,
  input         io_in_select,
  input  [31:0] io_sram0_rw_in,
  input  [31:0] io_sram0_r0_in,
  input  [31:0] io_sram1_rw_in,
  input  [31:0] io_sram1_ro_in,
  output [54:0] io_sram0_connections,
  output [54:0] io_sram1_connections,
  output [31:0] io_sram_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [55:0] input_; // @[openram_testchip.scala 22:20]
  wire  chip_select = input_[55]; // @[openram_testchip.scala 29:28]
  wire  csb0 = input_[54]; // @[openram_testchip.scala 30:21]
  wire  web = input_[53]; // @[openram_testchip.scala 31:20]
  wire  _T = ~chip_select; // @[Conditional.scala 37:30]
  wire [54:0] _GEN_0 = chip_select ? input_[54:0] : 55'h7fffffffffffff; // @[Conditional.scala 39:67 openram_testchip.scala 42:34 openram_testchip.scala 34:26]
  wire [31:0] _io_sram_data_T = csb0 ? io_sram1_ro_in : io_sram1_rw_in; // @[openram_testchip.scala 49:45]
  wire [31:0] _io_sram_data_T_1 = csb0 ? io_sram0_r0_in : io_sram0_rw_in; // @[openram_testchip.scala 49:88]
  wire [31:0] _io_sram_data_T_2 = chip_select ? _io_sram_data_T : _io_sram_data_T_1; // @[openram_testchip.scala 49:28]
  assign io_sram0_connections = _T ? input_[54:0] : 55'h7fffffffffffff; // @[Conditional.scala 40:58 openram_testchip.scala 38:34 openram_testchip.scala 33:26]
  assign io_sram1_connections = _T ? 55'h7fffffffffffff : _GEN_0; // @[Conditional.scala 40:58 openram_testchip.scala 34:26]
  assign io_sram_data = web ? _io_sram_data_T_2 : 32'h0; // @[openram_testchip.scala 48:14 openram_testchip.scala 49:22 openram_testchip.scala 46:18]
  always @(posedge clock) begin
    if (io_in_select) begin // @[openram_testchip.scala 27:17]
      input_ <= io_gpio_packet;
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
  _RAND_0 = {2{`RANDOM}};
  input_ = _RAND_0[55:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
