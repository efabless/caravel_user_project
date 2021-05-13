`default_nettype  none


module test_chip(
    input clk_in,
    input [55:0] analyzer_packet,
    input [55:0] gpio_packet, 
    output reg [31:0] sram_data
);

