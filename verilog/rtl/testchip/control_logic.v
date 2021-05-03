`default_nettype  none

module control_logic (
    input clk_in,
    input [] packet,
    
    //R/W Port Pins
    output [`RAM_BLOCKS-1:0] chip_select,
    output [`RAM_BLOCKS-1:0] write_en,
    output [(`RAM_BLOCKS*4)-1:0] write_mask,
    output [7:0] addr,
    output [31:0] data,

    //RO Port Pins
    output read_enable,
    output [7:0] read_addr,
    input [31:0] read_data
);