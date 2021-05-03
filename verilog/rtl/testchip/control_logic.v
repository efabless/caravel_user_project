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

    //Instantiating storage module instance and
    //connecting ports
    storage connections(
        // MGMT_AREA R/W Interface 
        .mgmt_clk(clk_in),
        .mgmt_ena(chip_select), 
        .mgmt_wen(write_en), // not shared 
        .mgmt_wen_mask(write_mask), // not shared 
        .mgmt_addr(addr),
        .mgmt_wdata(data),
        .mgmt_rdata(???),

        // MGMT_AREA RO Interface
        .mgmt_ena_ro(read_enable),
        .mgmt_addr_ro(read_addr),
        .mgmt_rdata_ro(read_data)
    );

endmodule
`default_nettype wire 