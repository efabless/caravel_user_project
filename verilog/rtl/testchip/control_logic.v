`default_nettype  none
`include "sky130_sram_1kbyte_1rw1r_32x256_8.v"

module SRAM_IN (
    input clk_in,
    input chip_select,
    input [54:0] packet,
    
    //SRAM0
    //RW Port
    output reg mgmt_ena0, 
    output reg mgmt_wen0, 
    output reg [3:0] mgmt_wen_mask0,  
    output reg [7:0] mgmt_addr0,
    output reg [31:0] mgmt_wdata0,

    //RO Port
    output reg mgmt_ena_ro0,
    output reg [7:0] mgmt_addr_ro0,

    //SRAM1
    output reg mgmt_ena1, 
    output reg mgmt_wen1, 
    output reg [3:0] mgmt_wen_mask1,  
    output reg [7:0] mgmt_addr1,
    output reg [31:0] mgmt_wdata1,

    //RO Port
    output reg mgmt_ena_ro1,
    output reg [7:0] mgmt_addr_ro1
);

reg [54:0] in_packet;
reg cs;

always @(packet) begin
    in_packet <= packet[54:0];
    cs <= chip_select;
end

//Forward input bits to proper SRAM and
//0's to other SRAM pins
always @(in_packet, cs) begin
    case(cs)
    1'b0 : begin
            mgmt_ena0 <= in_packet[54];
            mgmt_wen0 <= in_packet[53];
            mgmt_wen_mask0 <= in_packet[52:49];
            mgmt_addr0 <= in_packet[48:41];
            mgmt_wdata0 = in_packet[40:9];
            mgmt_ena_ro0 = in_packet[8];
            mgmt_addr_ro0 = in_packet[7:0];

            mgmt_ena1 <= 1'b0;
            mgmt_wen1 <= 1'b0;
            mgmt_wen_mask1 <= 4'b0000;
            mgmt_addr1 <= 8'd0;
            mgmt_wdata1 = 32'd0;
            mgmt_ena_ro1 = 1'b0;
            mgmt_addr_ro1 = 8'd0;
        end 

        1'b1 : begin
            mgmt_ena1 <= in_packet[54];
            mgmt_wen1 <= in_packet[53];
            mgmt_wen_mask1 <= in_packet[52:49];
            mgmt_addr1 <= in_packet[48:41];
            mgmt_wdata1 = in_packet[40:9];
            mgmt_ena_ro1 = in_packet[8];
            mgmt_addr_ro1 = in_packet[7:0];

            mgmt_ena0 <= 1'b0;
            mgmt_wen0 <= 1'b0;
            mgmt_wen_mask0 <= 4'b0000;
            mgmt_addr0 <= 8'd0;
            mgmt_wdata0 = 32'd0;
            mgmt_ena_ro0 = 1'b0;
            mgmt_addr_ro0 = 8'd0;
        end

    endcase

end
endmodule

module SRAM_OUT(
    input chip_select,
    input [31:0] sram0_data,
    input [31:0] sram1_data,
    output reg [31:0] sram_contents
);

//Mux read values from different SRAMS
//and send to picorv
always @(sram0_data, sram1_data) begin
    if(chip_select == 0)
        sram_contents <= sram0_data;
    else if(chip_select == 1)
        sram_contents <= sram1_data;
end
endmodule
`default_nettype wire 