`default_nettype  none

module control_logic (
    input clk_in,
    input [(`RAM_BLOCKS*6+48):0] packet,
    input [31:0] read_data,
    output [31:0] read_to_pico    
    /*
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
    */
);

    //Store input in a register 
    reg [(`RAM_BLOCKS*6+48):0] in_packet;
    always @(posedge clk_in) begin
        in_packet <= packet
    end

    assign chip_select = in_packet[(`RAM_BLOCKS*6+48):50 + 5*`RAM_BLOCKS-1];
    assign write_en = in_packet[50 + 5*`RAM_BLOCKS-2:50+(`RAM_BLOCKS*4-1)]; 
    assign write_mask = in_packet[49+(`RAM_BLOCKS*4-1):49];
    assign addr = in_packet[48:41];
    assign data = in_packet[40:9];
    wire [31:0] rw_read_data;

    assign read_enable = in_packet[8];
    assign read_addr = in_packet[7:0];
    wire [31:0] r_data;

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
        .mgmt_rdata(rw_read_data),

        // MGMT_AREA RO Interface
        .mgmt_ena_ro(read_enable),
        .mgmt_addr_ro(read_addr),
        .mgmt_rdata_ro(r_data)
    );

    //Mux read output from correct port
    always@(rw_read_data or r_data or ???) begin
        if(???)
        assign read_to_pico = rw_read_data
        else
        assign read_to_pico = r_data
    end
endmodule
`default_nettype wire 