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

  reg          resetn;
  reg          clk;
  reg          la_in_load; 
  reg          la_sram_load;
  reg  [`TOTAL_SIZE-1:0] la_data_in;
  reg          gpio_in;
  reg          gpio_scan;
  reg          gpio_sram_load;
  reg          global_csb;
 
  wire [`ADDR_SIZE-1:0] addr0;
  wire [`DATA_SIZE-1:0] din0;
  wire 		 web0;
  wire [`WMASK_SIZE-1:0] wmask0;
  wire [`ADDR_SIZE-1:0]  addr1;
  wire [`DATA_SIZE-1:0]  din1;
  wire 		  web1;
  wire [`WMASK_SIZE-1:0] wmask1;
  // One CSB for each SRAM
  wire [`MAX_CHIPS-1:0]  csb0;
  wire [`MAX_CHIPS-1:0]  csb1;

  wire [`DATA_SIZE-1:0] sram0_data0;
  wire [`DATA_SIZE-1:0] sram0_data1;
  wire [`DATA_SIZE-1:0] sram1_data0;
  wire [`DATA_SIZE-1:0] sram1_data1;
  wire [`DATA_SIZE-1:0] sram2_data0;
  wire [`DATA_SIZE-1:0] sram2_data1;
  wire [`DATA_SIZE-1:0] sram3_data0;
  wire [`DATA_SIZE-1:0] sram3_data1;
  wire [`DATA_SIZE-1:0] sram4_data0;
  wire [`DATA_SIZE-1:0] sram4_data1;
  wire [`DATA_SIZE-1:0] sram5_data0;
  wire [`DATA_SIZE-1:0] sram5_data1;
  wire [`DATA_SIZE-1:0] sram6_data0;
  wire [`DATA_SIZE-1:0] sram6_data1;
  wire [`DATA_SIZE-1:0] sram7_data0;
  wire [`DATA_SIZE-1:0] sram7_data1;
  wire [`DATA_SIZE-1:0] sram8_data0;
  wire [`DATA_SIZE-1:0] sram8_data1;
  wire [`DATA_SIZE-1:0] sram9_data0;
  wire [`DATA_SIZE-1:0] sram9_data1;
  wire [`DATA_SIZE-1:0] sram10_data0;
  wire [`DATA_SIZE-1:0] sram10_data1;
  wire [`DATA_SIZE-1:0] sram11_data0;
  wire [`DATA_SIZE-1:0] sram11_data1;
  wire [`DATA_SIZE-1:0] sram12_data0;
  wire [`DATA_SIZE-1:0] sram12_data1;
  wire [`DATA_SIZE-1:0] sram13_data0;
  wire [`DATA_SIZE-1:0] sram13_data1;
  wire [`DATA_SIZE-1:0] sram14_data0;
  wire [`DATA_SIZE-1:0] sram14_data1;
  wire [`DATA_SIZE-1:0] sram15_data0;
  wire [`DATA_SIZE-1:0] sram15_data1;


  wire [`TOTAL_SIZE-1:0] la_data_out;
openram_testchip CONTROL_LOGIC(
    .resetn(resetn),
    .clk(clk),
    .la_in_load(la_in_load),
    .la_data_in(la_data_in),
    .la_sram_load(la_sram_load),
    .gpio_in(gpio_in),
    .gpio_scan(gpio_scan),
    .gpio_sram_load(gpio_sram_load),
    .global_csb(global_csb),
    .sram0_data0(sram0_data0),
    .sram0_data1(sram0_data1),
    .sram1_data0(sram1_data0),
    .sram1_data1(sram1_data1),
    .sram2_data0(sram2_data0),
    .sram2_data1(sram2_data1),
    .sram3_data0(sram3_data0),
    .sram3_data1(sram3_data1),
    .sram4_data0(sram4_data0),
    .sram4_data1(sram4_data1),
    .sram5_data0(sram5_data0),
    .sram5_data1(sram5_data1),
    .sram6_data0(sram6_data0),
    .sram6_data1(sram6_data1),
    .sram7_data0(sram7_data0),
    .sram7_data1(sram7_data1),
    .sram8_data0(sram8_data0),
    .sram8_data1(sram8_data1),
    .sram9_data0(sram9_data0),
    .sram9_data1(sram9_data1),
    .sram10_data0(sram10_data0),
    .sram10_data1(sram10_data1),
    .sram11_data0(sram11_data0),
    .sram11_data1(sram11_data1),
    .sram12_data0(sram12_data0),
    .sram12_data1(sram12_data1),
    .sram13_data0(sram13_data0),
    .sram13_data1(sram13_data1),
    .sram14_data0(sram14_data0),
    .sram14_data1(sram14_data1),
    .sram15_data0(sram15_data0),
    .sram15_data1(sram15_data1),
    .addr0(addr0),
    .din0(din0),
    .web0(web0),
    .wmask0(wmask0),
    .addr1(addr1),
    .din1(din1),
    .web1(web1),
    .wmask1(wmask1),
    .csb0(csb0),
    .csb1(csb1),
    .la_data_out(la_data_out),
    .gpio_out(gpio_out)
);

sky130_sram_1kbyte_1rw1r_8x1024_8 SRAM0
     (
     `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (clk),
      .csb0   (csb0[0]),
      .web0   (web0),
      .wmask0 (wmask0[0]),
      .addr0  (addr0[9:0]),
      .din0   (din0[7:0]),
      .dout0  (sram0_data0[7:0]),
      .clk1   (clk),
      .csb1   (csb1[0]),
      .addr1  (addr1[9:0]),
      .dout1  (sram0_data1[7:0])
      );
assign sram0_data0[`DATA_SIZE-1:8] = 0;
assign sram0_data1[`DATA_SIZE-1:8] = 0;
   
sky130_sram_1kbyte_1rw1r_32x256_8 SRAM1
     (
     `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (clk),
      .csb0   (csb0[1]),
      .web0   (web0),
      .wmask0 (wmask0),
      .addr0  (addr0[7:0]),
      .din0   (din0),
      .dout0  (sram1_data0),
      .clk1   (clk),
      .csb1   (csb1[1]),
      .addr1  (addr1[7:0]),
      .dout1  (sram1_data1)
      );
   
sky130_sram_2kbyte_1rw1r_32x512_8 SRAM2
     (
     `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (clk),
      .csb0   (csb0[2]),
      .web0   (web0),
      .wmask0 (wmask0),
      .addr0  (addr0[8:0]),
      .din0   (din0),
      .dout0  (sram2_data0),
      .clk1   (clk),
      .csb1   (csb1[2]),
      .addr1  (addr1[8:0]),
      .dout1  (sram2_data1)
      );

sky130_sram_4kbyte_1rw1r_32x1024_8 SRAM3
     (
     `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (clk),
      .csb0   (csb0[3]),
      .web0   (web0),
      .wmask0 (wmask0),
      .addr0  (addr0[9:0]),
      .din0   (din0),
      .dout0  (sram3_data0),
      .clk1   (clk),
      .csb1   (csb1[3]),
      .addr1  (addr1[9:0]),
      .dout1  (sram3_data1)
      );
   
sky130_sram_8kbyte_1rw1r_32x2048_8 SRAM4
     (
     `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (clk),
      .csb0   (csb0[4]),
      .web0   (web0),
      .wmask0 (wmask0),
      .addr0  (addr0[10:0]),
      .din0   (din0),
      .dout0  (sram4_data0),
      .clk1   (clk),
      .csb1   (csb1[4]),
      .addr1  (addr1[10:0]),
      .dout1  (sram4_data1)
      );

// Not working yet
// sky130_sram_16kbyte_1rw1r_32x4096_8 SRAM6
//      (
//      `ifdef USE_POWER_PINS
//       .vccd1(vccd1),
//       .vssd1(vssd1), 
//       `endif
//       .clk0   (clk),
//       .csb0   (csb0[6]),
//       .web0   (web0),
//       .wmask0 (wmask0),
//       .addr0  (addr0),
//       .din0   (din0),
//       .dout0  (sram6_data0),
//       .clk1   (clk),
//       .csb1   (csb1[6]),
//       .addr1  (addr1),
//       .dout1  (sram6_data1)
//       );
   
  
  
// Single port memories
sram_1rw0r0w_32_256_sky130 SRAM8
    (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (clk),
      .csb0   (csb0[8]),
      .web0   (web0),
      .wmask0 (wmask0),
      .addr0  (addr0[7:0]),
      .din0   (din0),
      .dout0  (sram8_data0)
     );
assign sram8_data1 = 0;

sram_1rw0r0w_32_512_sky130 SRAM9
    (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (clk),
      .csb0   (csb0[9]),
      .web0   (web0),
      .wmask0 (wmask0),
      .addr0  (addr0[8:0]),
      .din0   (din0),
      .dout0  (sram9_data0)
     );
assign sram9_data1 = 0;

sram_1rw0r0w_32_1024_sky130 SRAM10
    (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (clk),
      .csb0   (csb0[10]),
      .web0   (web0),
      .wmask0 (wmask0),
      .addr0  (addr0[9:0]),
      .din0   (din0),
      .dout0  (sram10_data0)
     );
assign sram10_data1 = 0;

wire [63:0] temp_sram11_data0;
sram_1rw0r0w_64_512_sky130 SRAM11
    (
      `ifdef USE_POWER_PINS
      .vccd1(vccd1),
      .vssd1(vssd1), 
      `endif
      .clk0   (clk),
      .csb0   (csb0[11]),
      .web0   (web0),
      .wmask0 ({4'd0, wmask0}),
      .addr0  (addr0[8:0]),
      .din0   ({din0[31:16], 32'd0, din0[15:0]}),
      .dout0  (temp_sram11_data0)
     );

assign sram11_data1 = 0;
assign sram11_data0 = {temp_sram11_data0[64:49], temp_sram11_data0[15:0]};

integer i, j;
reg [3:0] sel;
reg [111:0] in_data;
reg [111:0] out_data;

initial begin
  $dumpfile("testchip_tb.vcd");
  $dumpvars(0, test_chip_tb);
  la_in_load = 0;
  la_sram_load = 0;
  la_data_in = 0;
  resetn = 1;
  global_csb = 1;
  clk = 1;
  
  //Testing 32B Dual Port Memories
  for(i = 0; i < 5; i = i + 1) begin
    sel = i;
      
    //Write 1 to addr1 using GPIO Pins
    gpio_scan = 1;
    gpio_sram_load = 0;
    in_data = {sel, 16'd1, 32'd1, 1'b0, 1'b0, 4'd15, 16'd0, 32'd0, 1'b1, 1'b1, 4'd0};
    
    for(j = 0; j < 112; j = j + 1) begin
      gpio_in = in_data[111 - j];
      #10;
    end
    
    gpio_scan = 0;
    global_csb = 0;
    #10;
    global_csb = 1;
    gpio_sram_load = 1;
    #10;
      
    //Write 2 to addr2 using GPIO Pins
    gpio_scan = 1;
    gpio_sram_load = 0;
    in_data = {sel, 16'd2, 32'd2, 1'b0, 1'b0, 4'd15, 16'd0, 32'd0, 1'b1, 1'b1, 4'd0};
    
    for(j = 0; j < 112; j = j + 1) begin
      gpio_in = in_data[111 - j];
      #10;
    end

    gpio_scan = 0;
    global_csb = 0;
    #10;
    global_csb = 1;
    gpio_sram_load = 1;
    #10;     
    
    #10;
    //Read addr1 and addr2
    gpio_scan = 1;
    gpio_sram_load = 0;
    in_data = {sel, 16'd1, 32'd0, 1'b0, 1'b1, 4'd0, 16'd2, 32'd0, 1'b0, 1'b1, 4'd0};
    
    for(j = 0; j < 112; j = j + 1) begin
      gpio_in = in_data[111 - j];
      #10;
    end

    gpio_scan = 0;
    global_csb = 0;
    #10;
    global_csb = 1;
    gpio_sram_load = 1;
    #10;
    
    #10
    gpio_sram_load = 0;
    gpio_scan = 1;
    for(j = 0; j < 112; j = j + 1) begin
      out_data[111 - j] = gpio_out;
      #10;
    end
    #10;
    `assert(out_data, {sel, 16'd1, 32'd1, 1'b0, 1'b1, 4'd0, 16'd2, 32'd2, 1'b0, 1'b1, 4'd0});
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
      #10;
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
      #10;
    end

    gpio_scan = 0;
    global_csb = 0;
    #10;
    global_csb = 1;
    gpio_sram_load = 1;
    #10;    
      
    #10;
    gpio_sram_load = 0;
    gpio_scan = 1;
    for(j = 0; j < 112; j = j + 1) begin
      out_data[111 - j] = gpio_out;
      #10;
    end
    #10;
    `assert(out_data, {sel, 16'd1, 32'd1, 1'b0, 1'b1, 4'd0, 16'd0, 32'd0, 1'b0, 1'b0, 4'd0});
  end

  //Testing 64b Single Port Memory
  sel = 11;
      
  //Write 1 to addr1 using GPIO Pins
  gpio_scan = 1;
  gpio_sram_load = 0;
  in_data = {sel, 16'd1, 32'd1, 1'b0, 1'b0, 4'd15, 16'd0, 32'd0, 1'b0, 1'b0, 4'd0};
  
  for(j = 0; j < 112; j = j + 1) begin
    gpio_in = in_data[111 - j];
    #10;
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
    #10;
  end

  gpio_scan = 0;
  global_csb = 0;
  #10;
  global_csb = 1;
  gpio_sram_load = 1;
  #10;    
    
  #10;
  gpio_sram_load = 0;
  gpio_scan = 1;
  for(j = 0; j < 112; j = j + 1) begin
    out_data[111 - j] = gpio_out;
    #10;
  end
  
  #10;
  `assert(out_data[111:92], {sel, 16'd1});
  `assert(out_data[75:60], 16'd1);
  `assert(out_data[59:0], {1'b0, 1'b1, 4'd0, 16'd0, 32'd0, 1'b0, 1'b0, 4'd0});
  
  #10;$finish;
end

always 
    #5 clk = !clk;
endmodule
