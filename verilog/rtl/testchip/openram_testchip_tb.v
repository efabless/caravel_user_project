`define assert(signal, value) \
if (!(signal === value)) begin \
   $display("ASSERTION FAILED in %m: signal != value"); \
   $finish;\
end

`timescale 1ns/1ns

//`include "control_logic.v"
//`include "sky130_sram_1kbyte_1rw1r_32x256_8.v"
`include "openram_testchip.v"

module test_chip_tb;

reg clk_in;
reg rst;
reg [55:0] from_analyzer;
reg [55:0] from_gpio;
reg in_select;

wire [31:0] read_data;

openram_testchip test_logic(.clk_in(clk_in),
                     .rst(rst),
                     .analyzer_packet(from_analyzer),
                     .gpio_packet(from_gpio),
                     .in_select(in_select),
                     .sram_data(read_data)
);

initial begin
    $dumpfile("test_chip_tb.vcd");
    $dumpvars(0, test_chip_tb);
    clk_in = 1;
    rst = 0;
    //Send packet using logic analyzer
    in_select = 0;
    from_analyzer = 55'd0;
    from_gpio =  55'd0;
    //Write 1 to address 1 in SRAM 0
    from_analyzer = {1'b0, 1'b0, 1'b0, 4'd15, 8'd1, 32'd1, 1'b0, 8'd0};
    #10;

    //Disable write enable after write
    from_analyzer = {1'b0, 1'b0, 1'b1, 4'd15, 8'd1, 32'd1, 1'b0, 8'd0};
    #20;

    //Read from address 1 in SRAM 0
    from_analyzer = {1'b0, 1'b0, 1'b1, 4'd0, 8'd1, 32'd0, 1'b1, 8'd0};
    #25;
    `assert(read_data, 32'd1);

    //Send packet using GPIO pins
    in_select = 1;
    //Write 1 to address 1 in SRAM 0
    from_gpio = {1'b0, 1'b0, 1'b0, 4'd15, 8'd2, 32'd2, 1'b0, 8'd0};
    #10;
    
    //Disable write enable after write
    from_gpio = {1'b0, 1'b0, 1'b1, 4'd15, 8'd2, 32'd2, 1'b0, 8'd0};
    #20;

    //Read from address 1 in SRAM 0 using RO Port
    from_gpio = {1'b0, 1'b1, 1'b1, 4'd0, 8'd0, 32'd0, 1'b0, 8'd2};
    #40;
    `assert(read_data, 32'd2);

    in_select = 0;
    //Write 1 to address 1 in SRAM 1
    from_analyzer = {1'b1, 1'b0, 1'b0, 4'd15, 8'd1, 32'd1, 1'b0, 8'd0};
    #10

    //Disable write enable after write
    from_analyzer = {1'b1, 1'b0, 1'b1, 4'd15, 8'd1, 32'd1, 1'b0, 8'd0};
    #20;

    //Read from address 1 in SRAM 1
    from_analyzer = {1'b1, 1'b0, 1'b1, 4'd0, 8'd1, 32'd0, 1'b1, 8'd0};
    #40;
    `assert(read_data, 32'd1);
    
    //Send packet using GPIO pins
    in_select = 1;
    //Write 1 to address 1 in SRAM 1
    from_gpio = {1'b1, 1'b0, 1'b0, 4'd15, 8'd2, 32'd2, 1'b0, 8'd0};
    #10;

    //Disable write enable after write
    from_gpio = {1'b1, 1'b0, 1'b1, 4'd15, 8'd2, 32'd2, 1'b0, 8'd0};
    #20;
    
    //Read from address 1 in SRAM 1 using RO Port
    from_gpio = {1'b1, 1'b1, 1'b1, 4'd0, 8'd0, 32'd0, 1'b0, 8'd2};
    #40;
    `assert(read_data, 32'd2);
    
    #30;$finish;
end

always 
    #5 clk_in = !clk_in;

endmodule
