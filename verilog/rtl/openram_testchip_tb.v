`define assert(signal, value) \
if (!(signal === value)) begin \
   $display("ASSERTION FAILED in %m: signal != value"); \
   $finish;\
end

`timescale 1ns/1ns

`include "openram_testchip.v"
`include "openram_defines.v"
`include "sky130_sram_1kbyte_1rw1r_32x256_8.v"
`include "sky130_sram_1kbyte_1rw1r_8x1024_8.v"
`include "sky130_sram_2kbyte_1rw1r_32x512_8.v"
`include "sky130_sram_4kbyte_1rw1r_32x1024_8.v"
`include "sky130_sram_8kbyte_1rw1r_32x2048_8.v"
`include "sram_1rw0r0w_32_256_sky130.v"
`include "sram_1rw0r0w_32_512_sky130.v"
`include "sram_1rw0r0w_32_1024_sky130.v"
`include "sram_1rw0r0w_64_512_sky130.v"

module test_chip_tb;

  reg          reset;
  reg          in_select;
  reg          la_clk;
  reg          la_sram_clk;
  reg          la_in_load; 
  reg          la_sram_load;
  reg  [`TOTAL_SIZE-1:0] la_data_in;
  reg          gpio_clk;
  reg          gpio_in;
  reg          gpio_sram_clk;
  reg          gpio_scan;
  reg          gpio_sram_load;
 
  wire [`ADDR_SIZE-1:0] left_addr0;
  wire [`DATA_SIZE-1:0] left_din0;
  wire 		 left_web0;
  wire [`WMASK_SIZE-1:0] left_wmask0;
  wire [`ADDR_SIZE-1:0]  left_addr1;
  wire [`DATA_SIZE-1:0]  left_din1;
  wire 		  left_web1;
  wire [`WMASK_SIZE-1:0] left_wmask1;
  // One CSB for each SRAM
  wire [`MAX_CHIPS-1:0]  left_csb0;
  wire [`MAX_CHIPS-1:0]  left_csb1;

  wire [`ADDR_SIZE-1:0]  right_addr0;
  wire [`DATA_SIZE-1:0] right_din0;
  wire 		 right_web0;
  wire [`WMASK_SIZE-1:0] right_wmask0;
  wire [`MAX_CHIPS-1:0]  right_csb0;  

  wire [`DATA_SIZE-1:0] sram0_dout0;
  wire [`DATA_SIZE-1:0] sram0_dout1;
  wire [`DATA_SIZE-1:0] sram1_dout0;
  wire [`DATA_SIZE-1:0] sram1_dout1;
  wire [`DATA_SIZE-1:0] sram2_dout0;
  wire [`DATA_SIZE-1:0] sram2_dout1;
  wire [`DATA_SIZE-1:0] sram3_dout0;
  wire [`DATA_SIZE-1:0] sram3_dout1;
  wire [`DATA_SIZE-1:0] sram4_dout0;
  wire [`DATA_SIZE-1:0] sram4_dout1;
  wire [`DATA_SIZE-1:0] sram5_dout0;
  wire [`DATA_SIZE-1:0] sram5_dout1;
  wire [`DATA_SIZE-1:0] sram6_dout0;
  wire [`DATA_SIZE-1:0] sram6_dout1;
  wire [`DATA_SIZE-1:0] sram7_dout0;
  wire [`DATA_SIZE-1:0] sram7_dout1;
  wire [`DATA_SIZE-1:0] sram8_dout0;
  wire [`DATA_SIZE-1:0] sram8_dout1;
  wire [`DATA_SIZE-1:0] sram9_dout0;
  wire [`DATA_SIZE-1:0] sram9_dout1;
  wire [`DATA_SIZE-1:0] sram10_dout0;
  wire [`DATA_SIZE-1:0] sram10_dout1;
  wire [`DATA_SIZE-1:0] sram11_dout0;
  wire [`DATA_SIZE-1:0] sram11_dout1;
  wire [`DATA_SIZE-1:0] sram12_dout0;
  wire [`DATA_SIZE-1:0] sram12_dout1;
  wire [`DATA_SIZE-1:0] sram13_dout0;
  wire [`DATA_SIZE-1:0] sram13_dout1;
  wire [`DATA_SIZE-1:0] sram14_dout0;
  wire [`DATA_SIZE-1:0] sram14_dout1;
  wire [`DATA_SIZE-1:0] sram15_dout0;
  wire [`DATA_SIZE-1:0] sram15_dout1;

  wire sram0_clk;
  wire sram1_clk;
  wire sram2_clk;
  wire sram3_clk;
  wire sram4_clk;
  wire sram5_clk;
  wire sram6_clk;
  wire sram7_clk;
  wire sram8_clk;
  wire sram9_clk;
  wire sram10_clk;
  wire sram11_clk;
  wire sram12_clk;
  wire sram13_clk;
  wire sram14_clk;
  wire sram15_clk;

  wire [`TOTAL_SIZE-1:0] la_data_out;
openram_testchip CONTROL_LOGIC(
    .reset(reset),
    .in_select(in_select),
    .la_clk(la_clk),
    .la_sram_clk(la_sram_clk),
    .la_in_load(la_in_load),
    .la_data_in(la_data_in),
    .la_sram_load(la_sram_load),
    .gpio_clk(gpio_clk),
    .gpio_in(gpio_in),
    .gpio_sram_clk(gpio_sram_clk),
    .gpio_scan(gpio_scan),
    .gpio_sram_load(gpio_sram_load),
    .sram0_dout0(sram0_dout0),
    .sram0_dout1(sram0_dout1),
    .sram1_dout0(sram1_dout0),
    .sram1_dout1(sram1_dout1),
    .sram2_dout0(sram2_dout0),
    .sram2_dout1(sram2_dout1),
    .sram3_dout0(sram3_dout0),
    .sram3_dout1(sram3_dout1),
    .sram4_dout0(sram4_dout0),
    .sram4_dout1(sram4_dout1),
    .sram5_dout0(sram5_dout0),
    .sram5_dout1(sram5_dout1),
    .sram6_dout0(sram6_dout0),
    .sram6_dout1(sram6_dout1),
    .sram7_dout0(sram7_dout0),
    .sram7_dout1(sram7_dout1),
    .sram8_dout0(sram8_dout0),
    .sram8_dout1(sram8_dout1),
    .sram9_dout0(sram9_dout0),
    .sram9_dout1(sram9_dout1),
    .sram10_dout0(sram10_dout0),
    .sram10_dout1(sram10_dout1),
    .sram11_dout0(sram11_dout0),
    .sram11_dout1(sram11_dout1),
    .sram12_dout0(sram12_dout0),
    .sram12_dout1(sram12_dout1),
    .sram13_dout0(sram13_dout0),
    .sram13_dout1(sram13_dout1),
    .sram14_dout0(sram14_dout0),
    .sram14_dout1(sram14_dout1),
    .sram15_dout0(sram15_dout0),
    .sram15_dout1(sram15_dout1),
    .left_addr0(left_addr0),
    .left_din0(left_din0),
    .left_web0(left_web0),
    .left_wmask0(left_wmask0),
    .left_addr1(left_addr1),
    .left_din1(left_din1),
    .left_web1(left_web1),
    .left_wmask1(left_wmask1),
    .left_csb0(left_csb0),
    .left_csb1(left_csb1),
    .right_addr0(right_addr0),
    .right_din0(right_din0),
    .right_web0(right_web0),
    .right_wmask0(right_wmask0),
    .right_csb0(right_csb0),
    .sram0_clk(sram0_clk),
    .sram1_clk(sram1_clk),
    .sram2_clk(sram2_clk),
    .sram3_clk(sram3_clk),
    .sram4_clk(sram4_clk),
    .sram5_clk(sram5_clk),
    .sram6_clk(sram6_clk),
    .sram7_clk(sram7_clk),
    .sram8_clk(sram8_clk),
    .sram9_clk(sram9_clk),
    .sram10_clk(sram10_clk),
    .sram11_clk(sram11_clk),
    .sram12_clk(sram12_clk),
    .sram13_clk(sram13_clk),
    .sram14_clk(sram14_clk),
    .sram15_clk(sram15_clk),
    .la_data_out(la_data_out),
    .gpio_out(gpio_out)
);

sky130_sram_1kbyte_1rw1r_8x1024_8 SRAM0
     (
     `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (sram0_clk),
      .csb0   (left_csb0[0]),
      .web0   (left_web0),
      .wmask0 (left_wmask0),
      .addr0  (left_addr0),
      .din0   (left_din0),
      .dout0  (sram0_dout0[7:0]),
      .clk1   (sram0_clk),
      .csb1   (left_csb1[0]),
      .addr1  (left_addr0),
      .dout1  (sram0_dout1[7:0])
      );
assign sram0_dout0[`DATA_SIZE-1:8] = 0;
assign sram0_dout1[`DATA_SIZE-1:8] = 0;
   
sky130_sram_1kbyte_1rw1r_32x256_8 SRAM1
     (
     `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (sram1_clk),
      .csb0   (left_csb0[1]),
      .web0   (left_web0),
      .wmask0 (left_wmask0),
      .addr0  (left_addr0),
      .din0   (left_din0),
      .dout0  (sram1_dout0),
      .clk1   (sram1_clk),
      .csb1   (left_csb1[1]),
      .addr1  (left_addr1),
      .dout1  (sram1_dout1)
      );
   
sky130_sram_2kbyte_1rw1r_32x512_8 SRAM2
     (
     `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (sram2_clk),
      .csb0   (left_csb0[2]),
      .web0   (left_web0),
      .wmask0 (left_wmask0),
      .addr0  (left_addr0),
      .din0   (left_din0),
      .dout0  (sram2_dout0),
      .clk1   (sram2_clk),
      .csb1   (left_csb1[2]),
      .addr1  (left_addr1),
      .dout1  (sram2_dout1)
      );

sky130_sram_4kbyte_1rw1r_32x1024_8 SRAM3
     (
     `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (sram3_clk),
      .csb0   (left_csb0[3]),
      .web0   (left_web0),
      .wmask0 (left_wmask0),
      .addr0  (left_addr0),
      .din0   (left_din0),
      .dout0  (sram3_dout0),
      .clk1   (sram3_clk),
      .csb1   (left_csb1[3]),
      .addr1  (left_addr1),
      .dout1  (sram3_dout1)
      );
   
sky130_sram_8kbyte_1rw1r_32x2048_8 SRAM4
     (
     `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (sram4_clk),
      .csb0   (left_csb0[4]),
      .web0   (left_web0),
      .wmask0 (left_wmask0),
      .addr0  (left_addr0),
      .din0   (left_din0),
      .dout0  (sram4_dout0),
      .clk1   (sram4_clk),
      .csb1   (left_csb1[4]),
      .addr1  (left_addr1),
      .dout1  (sram4_dout1)
      );

// Not working yet
// sky130_sram_16kbyte_1rw1r_32x4096_8 SRAM6
//      (
//      `ifdef USE_POWER_PINS
//       .vccd1(vccd1),
//       .vssd1(vssd1), 
//       `endif
//       .clk0   (sram6_clk),
//       .csb0   (csb0[6]),
//       .web0   (web0),
//       .wmask0 (wmask0),
//       .addr0  (addr0),
//       .din0   (din0),
//       .dout0  (sram6_dout0),
//       .clk1   (sram6_clk),
//       .csb1   (csb1[6]),
//       .addr1  (addr1),
//       .dout1  (sram6_dout1)
//       );
   
   

// Single port memories
sram_1rw0r0w_32_256_sky130 SRAM8
    (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (sram8_clk),
      .csb0   (right_csb0[8]),
      .web0   (right_web0),
      .wmask0 (right_wmask0),
      .addr0  (right_addr0),
      .din0   (right_din0),
      .dout0  (sram8_dout0)
     );
assign sram8_dout1 = 0;

sram_1rw0r0w_32_512_sky130 SRAM9
    (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (sram9_clk),
      .csb0   (right_csb0[9]),
      .web0   (right_web0),
      .wmask0 (right_wmask0),
      .addr0  (right_addr0),
      .din0   (right_din0),
      .dout0  (sram9_dout0)
     );
assign sram9_dout1 = 0;

sram_1rw0r0w_32_1024_sky130 SRAM10
    (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (sram10_clk),
      .csb0   (right_csb0[10]),
      .web0   (right_web0),
      .wmask0 (right_wmask0),
      .addr0  (right_addr0),
      .din0   (right_din0),
      .dout0  (sram10_dout0)
     );
assign sram10_dout1 = 0;

wire [63:0] temp_sram11_dout0;
sram_1rw0r0w_64_512_sky130 SRAM11
    (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (sram11_clk),
      .csb0   (right_csb0[11]),
      .web0   (right_web0),
      .wmask0 (right_wmask0),
      .addr0  (right_addr0),
      .din0   ({right_din0[31:16], 32'd0, right_din0[15:0]}),
      .dout0  (temp_sram11_dout0)
     );

assign sram11_dout1 = 0;
assign sram11_dout0 = {temp_sram11_dout0[64:49], temp_sram11_dout[15:0]};

initial begin
    $dumpfile("testchip_tb.vcd");
    $dumpvars(0, test_chip_tb);
    la_clk = 1;
    gpio_clk = 0;
    la_sram_clk = 0;
    gpio_sram_clk = 0;
    gpio_scan = 0;
    gpio_in = 0;
    reset = 0;
    
    //Send bits using logic analyzer
    /*
    in_select = 0;
    la_in_load = 1;
    la_sram_load = 0;
    la_bits = {4'd0, 16'd1, 32'd1, 1'b0, 1'b0, 4'd15, 16'd0, 32'd0, 1'b1, 1'b1, 4'd0};
    
    #10;
    la_in_load = 0;
    la_sram_load = 1;
    la_sram_clk = 1;
    #5;
    la_sram_clk = 0;
    #5;
    
    la_in_load = 1;
    la_sram_load = 0;
    la_bits = {4'd0, 16'd1, 32'd0, 1'b0, 1'b1, 4'd0, 16'd0, 32'd0, 1'b1, 1'b1, 4'd0};

    #10;
    la_in_load = 0;
    la_sram_load = 1;
    la_sram_clk = 1;
    #5;
    la_sram_clk = 0;
    #5;

    la_sram_clk = 1;
    #5;
    la_sram_clk = 0;
    #10;
    `assert(la_data0, 32'd1);
  */
    #10;$finish;
end

always 
    #5 la_clk = !la_clk;
endmodule
