`define assert(signal, value) \
if (!(signal === value)) begin \
   $display("ASSERTION FAILED in %m: signal != value"); \
   $finish;\
end

`timescale 1ns/1ns

`include "sky130_sram_1kbyte_1rw1r_32x256_8.v"
`include "sram_1rw0r0w_32_256_sky130.v"
`include "sram_1rw0r0w_32_512_sky130.v"
`include "sram_1rw0r0w_32_1024_sky130.v"
`include "sram_1rw0r0w_64_512_sky130.v"
`include "openram_testchip.v"

module test_chip_tb;

reg clk_in;
reg rst;
reg [85:0] from_analyzer;
reg        from_gpio;
reg in_select;

wire [55:0] sram0_connections;
wire [55:0] sram1_connections;
wire [48:0] sram2_connections;
wire [46:0] sram3_connections;
wire [47:0] sram4_connections;
wire [83:0] sram5_connections;

wire [31:0] sram0_rw_out;
wire [31:0] sram0_ro_out;
wire [31:0] sram1_rw_out;
wire [31:0] sram1_ro_out;
wire [31:0] sram2_rw_out;
wire [31:0] sram3_rw_out;
wire [31:0] sram4_rw_out;
wire [63:0] sram5_rw_out;

wire [63:0] to_la;
wire to_gpio;

openram_testchip CONTROL_LOGIC(
    .wb_clock(clk_in),
    .gpio_clock(clk_in),
    .reset(rst),
    .la_packet(from_analyzer),
    .gpio_packet(from_gpio),
    .in_select(in_select),
    .sram0_rw_in(sram0_rw_out),
    .sram0_ro_in(sram0_ro_out),
    .sram1_rw_in(sram1_rw_out),
    .sram1_ro_in(sram1_ro_out),
    .sram2_rw_in(sram2_rw_out),
    .sram3_rw_in(sram3_rw_out),
    .sram4_rw_in(sram4_rw_out),
    .sram5_rw_in(sram5_rw_out),
    .sram0_connections(sram0_connections),
    .sram1_connections(sram1_connections),
    .sram2_connections(sram2_connections),
    .sram3_connections(sram3_connections),
    .sram4_connections(sram4_connections),
    .sram5_connections(sram5_connections),
    .la_data(to_la),
    .gpio_data(to_gpio)
);

sky130_sram_1kbyte_1rw1r_32x256_8 SRAM0
     (
      .clk0   (sram0_connections[55]),
      .csb0   (sram0_connections[54]),
      .web0   (sram0_connections[53]),
      .wmask0 (sram0_connections[52:49]),
      .addr0  (sram0_connections[48:41]),
      .din0   (sram0_connections[40:9]),
      .dout0  (sram0_rw_out),
      .clk1   (sram0_connections[55]),
      .csb1   (sram0_connections[8]),
      .addr1  (sram0_connections[7:0]),
      .dout1  (sram0_ro_out));

sky130_sram_1kbyte_1rw1r_32x256_8 SRAM1
     (
      .clk0   (sram1_connections[55]),
      .csb0   (sram1_connections[54]),
      .web0   (sram1_connections[53]),
      .wmask0 (sram1_connections[52:49]),
      .addr0  (sram1_connections[48:41]),
      .din0   (sram1_connections[40:9]),
      .dout0  (sram1_rw_out),
      .clk1   (sram1_connections[55]),
      .csb1   (sram1_connections[8]),
      .addr1  (sram1_connections[7:0]),
      .dout1  (sram1_ro_out));      

sram_1rw0r0w_32_1024_sky130 SRAM2
    (
      .clk0   (sram2_connections[48]),
      .csb0   (sram2_connections[47]),
      .web0   (sram2_connections[46]),
      .wmask0 (sram2_connections[45:42]),
      .addr0  (sram2_connections[41:32]),
      .din0   (sram2_connections[31:0]),
      .dout0  (sram2_rw_out)); 

sram_1rw0r0w_32_256_sky130 SRAM3
    (
      .clk0   (sram3_connections[46]),
      .csb0   (sram3_connections[45]),
      .web0   (sram3_connections[44]),
      .wmask0 (sram3_connections[43:40]),
      .addr0  (sram3_connections[39:32]),
      .din0   (sram3_connections[31:0]),
      .dout0  (sram3_rw_out));

sram_1rw0r0w_32_512_sky130 SRAM4
    (
      .clk0   (sram4_connections[47]),
      .csb0   (sram4_connections[46]),
      .web0   (sram4_connections[45]),
      .wmask0 (sram4_connections[44:41]),
      .addr0  (sram4_connections[40:32]),
      .din0   (sram4_connections[31:0]),
      .dout0  (sram4_rw_out));

sram_1rw0r0w_64_512_sky130 SRAM5
    (
      .clk0   (sram5_connections[83]),
      .csb0   (sram5_connections[82]),
      .web0   (sram5_connections[81]),
      .wmask0 (sram5_connections[80:73]),
      .addr0  (sram5_connections[72:64]),
      .din0   (sram5_connections[63:0]),
      .dout0  (sram5_rw_out));

initial begin
    $dumpfile("testchip_tb.vcd");
    $dumpvars(0, test_chip_tb);
    clk_in = 1;
    rst = 0;
    //Send packet using logic analyzer
    in_select = 0;
    from_analyzer = 86'd0;
    from_gpio =  1'd0;
    
    //Write 1 to address 1 in SRAM 0
    from_analyzer = {3'd0, 28'd0, 1'b0, 1'b0, 4'd15, 8'd1, 32'd1, 1'b0, 8'd0};
    #20;

    //Read from address 1 in SRAM 0
    from_analyzer = {3'd0, 28'd0, 1'b0, 1'b1, 4'd0, 8'd1, 32'd0, 1'b1, 8'd0};
    #60;
    `assert(to_la, 64'd1);

    //Read from address 1 in SRAM 0 using RO Port
    from_analyzer = {3'd0, 28'd0, 1'b1, 1'b1, 4'd0, 8'd0, 32'd0, 1'b0, 8'd1};
    #60;
    `assert(to_la, 64'd1);

    //Write 1 to address 1 in SRAM 1
    from_analyzer = {3'd1, 28'd0, 1'b0, 1'b0, 4'd15, 8'd1, 32'd1, 1'b0, 8'd0};
    #20

    //Read from address 1 in SRAM 1
    from_analyzer = {3'd1, 28'd0, 1'b0, 1'b1, 4'd0, 8'd1, 32'd0, 1'b1, 8'd0};
    #60;

    `assert(to_la, 64'd1);

    //Read from address 1 in SRAM 1 using RO Port
    from_analyzer = {3'd0, 28'd0, 1'b1, 1'b1, 4'd0, 8'd0, 32'd0, 1'b0, 8'd1};
    #60;
    `assert(to_la, 64'd1);

    //Write 2 to address 2 in SRAM 2
    from_analyzer = {3'd2, 35'd0, 1'b0, 1'b0, 4'd15, 10'd2, 32'd2};
    #20

    //Read from address 2 in SRAM 2
    from_analyzer = {3'd2, 35'd0, 1'b0, 1'b1, 4'd0, 10'd2, 32'd0};
    #60;

    `assert(to_la, 64'd2);
    
    //Write 3 to address 3 in SRAM 3
    from_analyzer = {3'd3, 37'd0, 1'b0, 1'b0, 4'd15, 8'd3, 32'd3};
    #20

    //Read from address 3 in SRAM 3
    from_analyzer = {3'd3, 37'd0, 1'b0, 1'b1, 4'd0, 8'd3, 32'd0};
    #60;
    `assert(to_la, 64'd3);
    
    //Write 4 to address 4 in SRAM 4
    from_analyzer = {3'd4, 36'd0, 1'b0, 1'b0, 4'd15, 9'd4, 32'd4};
    #20

    //Read from address 4 in SRAM 4
    from_analyzer = {3'd4, 36'd0, 1'b0, 1'b1, 4'd0, 9'd4, 32'd0};
    #60;

    `assert(to_la, 64'd4);

    //Write 5 to address 5 in SRAM 5
    from_analyzer = {3'd5, 1'b0, 1'b0, 8'd255, 9'd5, 64'd5};
    #20

    //Read from address 5 in SRAM 5
    from_analyzer = {3'd5, 1'b0, 1'b1, 8'd0, 9'd5, 64'd0};
    #60;
    `assert(to_la, 64'd5);
    #10;$finish;
end

always 
    #5 clk_in = !clk_in;
endmodule
