module openram_testchip(
  input         clock,
  input         reset,
  input  [85:0] io_logical_analyzer_packet,
  input  [31:0] io_gpio_packet,
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
  output [63:0] io_la_data,
  output [31:0] io_gpio_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [95:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
`endif // RANDOMIZE_REG_INIT
  reg [85:0] input_; // @[openram_testchip.scala 33:20]
  reg [63:0] output_; // @[openram_testchip.scala 34:21]
  reg  in_sel; // @[openram_testchip.scala 35:25]
  reg  gpio_sel; // @[openram_testchip.scala 37:27]
  reg  la_sel; // @[openram_testchip.scala 38:25]
  reg  SRAMDataReceived; // @[openram_testchip.scala 47:35]
  wire  _T = ~gpio_sel; // @[openram_testchip.scala 48:68]
  reg [1:0] loadingCount; // @[Counter.scala 60:40]
  wire  wrap_wrap = loadingCount == 2'h2; // @[Counter.scala 72:24]
  wire [1:0] _wrap_value_T_1 = loadingCount + 2'h1; // @[Counter.scala 76:24]
  wire  _GEN_2 = gpio_sel & wrap_wrap; // @[Counter.scala 137:24 Counter.scala 138:12]
  reg  REG; // @[openram_testchip.scala 49:67]
  reg  transferCount; // @[Counter.scala 60:40]
  reg  wrap; // @[openram_testchip.scala 51:23]
  reg [31:0] packetSeq_0; // @[openram_testchip.scala 52:24]
  reg [31:0] packetSeq_1; // @[openram_testchip.scala 52:24]
  reg [31:0] packetSeq_2; // @[openram_testchip.scala 52:24]
  wire [95:0] _input_T = {packetSeq_2,packetSeq_1,packetSeq_0}; // @[Cat.scala 30:58]
  wire [95:0] _GEN_9 = wrap & gpio_sel ? _input_T : {{10'd0}, io_logical_analyzer_packet}; // @[openram_testchip.scala 60:27 openram_testchip.scala 61:15 openram_testchip.scala 55:11]
  wire [95:0] _GEN_10 = _T ? {{10'd0}, input_} : _GEN_9; // @[openram_testchip.scala 64:20 openram_testchip.scala 65:15]
  wire [2:0] chip_select = input_[85:83]; // @[openram_testchip.scala 67:34]
  wire  csb0 = input_[54]; // @[openram_testchip.scala 76:21]
  wire  web = input_[53]; // @[openram_testchip.scala 77:20]
  wire  _T_5 = _T | ~la_sel; // @[openram_testchip.scala 79:20]
  wire  _T_6 = 3'h0 == chip_select; // @[Conditional.scala 37:30]
  wire  _T_7 = 3'h1 == chip_select; // @[Conditional.scala 37:30]
  wire  _T_8 = 3'h2 == chip_select; // @[Conditional.scala 37:30]
  wire  _T_9 = 3'h3 == chip_select; // @[Conditional.scala 37:30]
  wire  _T_10 = 3'h4 == chip_select; // @[Conditional.scala 37:30]
  wire  _T_11 = 3'h5 == chip_select; // @[Conditional.scala 37:30]
  wire [82:0] _GEN_11 = _T_11 ? input_[82:0] : 83'h7ffffffffffffffffffff; // @[Conditional.scala 39:67 openram_testchip.scala 103:38 openram_testchip.scala 74:26]
  wire [46:0] _GEN_12 = _T_10 ? input_[46:0] : 47'h7fffffffffff; // @[Conditional.scala 39:67 openram_testchip.scala 99:38 openram_testchip.scala 73:26]
  wire [82:0] _GEN_13 = _T_10 ? 83'h7ffffffffffffffffffff : _GEN_11; // @[Conditional.scala 39:67 openram_testchip.scala 74:26]
  wire [45:0] _GEN_14 = _T_9 ? input_[45:0] : 46'h3fffffffffff; // @[Conditional.scala 39:67 openram_testchip.scala 95:38 openram_testchip.scala 72:26]
  wire [46:0] _GEN_15 = _T_9 ? 47'h7fffffffffff : _GEN_12; // @[Conditional.scala 39:67 openram_testchip.scala 73:26]
  wire [82:0] _GEN_16 = _T_9 ? 83'h7ffffffffffffffffffff : _GEN_13; // @[Conditional.scala 39:67 openram_testchip.scala 74:26]
  wire [47:0] _GEN_17 = _T_8 ? input_[47:0] : 48'hffffffffffff; // @[Conditional.scala 39:67 openram_testchip.scala 91:38 openram_testchip.scala 71:26]
  wire [45:0] _GEN_18 = _T_8 ? 46'h3fffffffffff : _GEN_14; // @[Conditional.scala 39:67 openram_testchip.scala 72:26]
  wire [46:0] _GEN_19 = _T_8 ? 47'h7fffffffffff : _GEN_15; // @[Conditional.scala 39:67 openram_testchip.scala 73:26]
  wire [82:0] _GEN_20 = _T_8 ? 83'h7ffffffffffffffffffff : _GEN_16; // @[Conditional.scala 39:67 openram_testchip.scala 74:26]
  wire [54:0] _GEN_21 = _T_7 ? input_[54:0] : 55'h7fffffffffffff; // @[Conditional.scala 39:67 openram_testchip.scala 87:38 openram_testchip.scala 70:26]
  wire [47:0] _GEN_22 = _T_7 ? 48'hffffffffffff : _GEN_17; // @[Conditional.scala 39:67 openram_testchip.scala 71:26]
  wire [45:0] _GEN_23 = _T_7 ? 46'h3fffffffffff : _GEN_18; // @[Conditional.scala 39:67 openram_testchip.scala 72:26]
  wire [46:0] _GEN_24 = _T_7 ? 47'h7fffffffffff : _GEN_19; // @[Conditional.scala 39:67 openram_testchip.scala 73:26]
  wire [82:0] _GEN_25 = _T_7 ? 83'h7ffffffffffffffffffff : _GEN_20; // @[Conditional.scala 39:67 openram_testchip.scala 74:26]
  wire [54:0] _GEN_26 = _T_6 ? input_[54:0] : 55'h7fffffffffffff; // @[Conditional.scala 40:58 openram_testchip.scala 83:38 openram_testchip.scala 69:26]
  wire [54:0] _GEN_27 = _T_6 ? 55'h7fffffffffffff : _GEN_21; // @[Conditional.scala 40:58 openram_testchip.scala 70:26]
  wire [47:0] _GEN_28 = _T_6 ? 48'hffffffffffff : _GEN_22; // @[Conditional.scala 40:58 openram_testchip.scala 71:26]
  wire [45:0] _GEN_29 = _T_6 ? 46'h3fffffffffff : _GEN_23; // @[Conditional.scala 40:58 openram_testchip.scala 72:26]
  wire [46:0] _GEN_30 = _T_6 ? 47'h7fffffffffff : _GEN_24; // @[Conditional.scala 40:58 openram_testchip.scala 73:26]
  wire [82:0] _GEN_31 = _T_6 ? 83'h7ffffffffffffffffffff : _GEN_25; // @[Conditional.scala 40:58 openram_testchip.scala 74:26]
  wire [31:0] _output_T = csb0 ? io_sram0_r0_in : io_sram0_rw_in; // @[openram_testchip.scala 114:30]
  wire [31:0] _output_T_1 = csb0 ? io_sram1_ro_in : io_sram1_rw_in; // @[openram_testchip.scala 118:31]
  wire [63:0] _GEN_38 = _T_11 ? io_sram5_rw_in : 64'h0; // @[Conditional.scala 39:67 openram_testchip.scala 134:24 openram_testchip.scala 108:12]
  wire [63:0] _GEN_39 = _T_10 ? {{32'd0}, io_sram4_rw_in} : _GEN_38; // @[Conditional.scala 39:67 openram_testchip.scala 130:24]
  wire [63:0] _GEN_40 = _T_9 ? {{32'd0}, io_sram3_rw_in} : _GEN_39; // @[Conditional.scala 39:67 openram_testchip.scala 126:24]
  wire  _GEN_44 = in_sel | SRAMDataReceived; // @[openram_testchip.scala 138:29 openram_testchip.scala 139:30 openram_testchip.scala 47:35]
  wire  _GEN_46 = web ? _GEN_44 : SRAMDataReceived; // @[openram_testchip.scala 110:14 openram_testchip.scala 47:35]
  wire [31:0] _GEN_47 = transferCount ? output_[63:32] : 32'h0; // @[openram_testchip.scala 148:42 openram_testchip.scala 149:26 openram_testchip.scala 144:18]
  wire [31:0] _GEN_49 = ~transferCount ? output_[31:0] : _GEN_47; // @[openram_testchip.scala 146:36 openram_testchip.scala 147:26]
  assign io_sram0_connections = _T_5 ? _GEN_26 : 55'h7fffffffffffff; // @[openram_testchip.scala 80:5 openram_testchip.scala 69:26]
  assign io_sram1_connections = _T_5 ? _GEN_27 : 55'h7fffffffffffff; // @[openram_testchip.scala 80:5 openram_testchip.scala 70:26]
  assign io_sram2_connections = _T_5 ? _GEN_28 : 48'hffffffffffff; // @[openram_testchip.scala 80:5 openram_testchip.scala 71:26]
  assign io_sram3_connections = _T_5 ? _GEN_29 : 46'h3fffffffffff; // @[openram_testchip.scala 80:5 openram_testchip.scala 72:26]
  assign io_sram4_connections = _T_5 ? _GEN_30 : 47'h7fffffffffff; // @[openram_testchip.scala 80:5 openram_testchip.scala 73:26]
  assign io_sram5_connections = _T_5 ? _GEN_31 : 83'h7ffffffffffffffffffff; // @[openram_testchip.scala 80:5 openram_testchip.scala 74:26]
  assign io_la_data = in_sel ? 64'h0 : output_; // @[openram_testchip.scala 145:25 openram_testchip.scala 143:16 openram_testchip.scala 153:20]
  assign io_gpio_data = in_sel ? _GEN_49 : 32'h0; // @[openram_testchip.scala 145:25 openram_testchip.scala 144:18]
  always @(posedge clock) begin
    input_ <= _GEN_10[85:0];
    if (web) begin // @[openram_testchip.scala 110:14]
      if (_T_6) begin // @[Conditional.scala 40:58]
        output_ <= {{32'd0}, _output_T}; // @[openram_testchip.scala 114:24]
      end else if (_T_7) begin // @[Conditional.scala 39:67]
        output_ <= {{32'd0}, _output_T_1}; // @[openram_testchip.scala 118:24]
      end else if (_T_8) begin // @[Conditional.scala 39:67]
        output_ <= {{32'd0}, io_sram2_rw_in}; // @[openram_testchip.scala 122:24]
      end else begin
        output_ <= _GEN_40;
      end
    end else begin
      output_ <= 64'h0; // @[openram_testchip.scala 108:12]
    end
    in_sel <= io_in_select; // @[openram_testchip.scala 35:25]
    gpio_sel <= reset | ~wrap & gpio_sel; // @[openram_testchip.scala 37:27 openram_testchip.scala 37:27 openram_testchip.scala 57:14]
    la_sel <= io_in_select; // @[openram_testchip.scala 38:25]
    if (reset) begin // @[openram_testchip.scala 47:35]
      SRAMDataReceived <= 1'h0; // @[openram_testchip.scala 47:35]
    end else if (in_sel) begin // @[openram_testchip.scala 145:25]
      if (~transferCount) begin // @[openram_testchip.scala 146:36]
        SRAMDataReceived <= _GEN_46;
      end else if (transferCount) begin // @[openram_testchip.scala 148:42]
        SRAMDataReceived <= 1'h0; // @[openram_testchip.scala 150:30]
      end else begin
        SRAMDataReceived <= _GEN_46;
      end
    end else begin
      SRAMDataReceived <= _GEN_46;
    end
    if (reset) begin // @[Counter.scala 60:40]
      loadingCount <= 2'h0; // @[Counter.scala 60:40]
    end else if (_T) begin // @[Counter.scala 135:17]
      loadingCount <= 2'h0; // @[Counter.scala 97:11]
    end else if (gpio_sel) begin // @[Counter.scala 137:24]
      if (wrap_wrap) begin // @[Counter.scala 86:20]
        loadingCount <= 2'h0; // @[Counter.scala 86:28]
      end else begin
        loadingCount <= _wrap_value_T_1; // @[Counter.scala 76:15]
      end
    end
    REG <= SRAMDataReceived; // @[openram_testchip.scala 49:67]
    if (reset) begin // @[Counter.scala 60:40]
      transferCount <= 1'h0; // @[Counter.scala 60:40]
    end else if (REG) begin // @[Counter.scala 137:24]
      transferCount <= transferCount + 1'h1; // @[Counter.scala 76:15]
    end
    if (_T) begin // @[Counter.scala 135:17]
      wrap <= 1'h0;
    end else begin
      wrap <= _GEN_2;
    end
    if (loadingCount == 2'h0) begin // @[openram_testchip.scala 58:49]
      packetSeq_0 <= io_gpio_packet;
    end
    if (loadingCount == 2'h1) begin // @[openram_testchip.scala 58:49]
      packetSeq_1 <= io_gpio_packet;
    end
    if (wrap_wrap) begin // @[openram_testchip.scala 58:49]
      packetSeq_2 <= io_gpio_packet;
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
  _RAND_1 = {2{`RANDOM}};
  output_ = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  in_sel = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  gpio_sel = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  la_sel = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  SRAMDataReceived = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  loadingCount = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  REG = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  transferCount = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  wrap = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  packetSeq_0 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  packetSeq_1 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  packetSeq_2 = _RAND_12[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
