`default_nettype  none


module test_chip(
    input clk_in,
    input [55:0] analyzer_packet,
    input [55:0] gpio_packet,
    input in_select,  
    output reg [31:0] sram_data
);

reg [54:0] packet;
reg chip_select;

always @(analyzer_packet, gpio_packet) begin
    if(in_select == 0) begin
       chip_select <= analyzer_packet[55]; 
       packet <= analyzer_packet[54:0];
    end
    else if(in_select == 1) begin
       chip_select <= gpio_packet[55]; 
        packet <= gpio_packet[54:0];
    end
end
endmodule