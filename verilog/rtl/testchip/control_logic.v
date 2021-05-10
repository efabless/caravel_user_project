`default_nettype  none
`include "sky130_sram_1kbyte_1rw1r_32x256_8.v"

module SRAM_IN (
    input clk_in,
    input [54:0] packet,
    
    //SRAM0
    //RW Port
    output mgmt_ena0, 
    output mgmt_wen0, 
    output [3:0] mgmt_wen_mask0,  
    output [7:0] mgmt_addr0,
    output [31:0] mgmt_wdata0,

    //RO Port
    output mgmt_ena_ro0,
    output [7:0] mgmt_addr_ro0,

    //SRAM1
    output mgmt_ena1, 
    output mgmt_wen1, 
    output [3:0] mgmt_wen_mask1,  
    output [7:0] mgmt_addr1,
    output [31:0] mgmt_wdata1,

    //RO Port
    output mgmt_ena_ro1,
    output [7:0] mgmt_addr_ro1
);

reg [54:0] in_packet;
reg chip_select;

reg sram0_csb0; 
reg sram0_web0; 
reg [3:0] sram0_wmask;  
reg [7:0] sram0_addr0;
reg [31:0] sram0_wdata;

reg sram0_csb1;
reg [7:0] sram0_addr1;

reg sram1_csb0; 
reg sram1_web0; 
reg [3:0] sram1_wmask;  
reg [7:0] sram1_addr0;
reg [31:0] sram1_wdata;

reg sram1_csb1;
reg [7:0] sram1_addr1;

always @(packet) begin
    in_packet <= packet[54:0];
    chip_select <= packet[55];
end

//Forward input bits to proper SRAM and
//0's to other SRAM pins
always @(in_packet, chip_select) begin
    case(chip_select)
        1'b0 : begin
            sram0_csb0 = in_packet[54];
            sram0_web0 = in_packet[53];
            sram0_wmask = in_packet[52:49];
            sram0_addr0 = in_packet[48:41];
            sram0_wdata = in_packet[40:9];
            sram0_csb1 = in_packet[8];
            sram0_addr1 = in_packet[7:0];

            sram1_csb0 = 0;
            sram1_web0 = 0;
            sram1_wmask = 0;
            sram1_addr0 = 0;
            sram1_wdata = 0;
            sram1_csb1 = 0;
            sram1_addr1 = 0;
        end 

        1'b1 : begin
            sram1_csb0 = in_packet[54];
            sram1_web0 = in_packet[53];
            sram1_wmask = in_packet[52:49];
            sram1_addr0 = in_packet[48:41];
            sram1_wdata = in_packet[40:9];
            sram1_csb1 = in_packet[8];
            sram1_addr1 = in_packet[7:0];

            sram0_csb0 = 0;
            sram0_web0 = 0;
            sram0_wmask = 0;
            sram0_addr0 = 0;
            sram0_wdata = 0;
            sram0_csb1 = 0;
            sram0_addr1 = 0;
        end

    endcase
end

always @(*) begin
    //Connect output to SRAM0
    mgmt_ena0 = sram0_csb0;
    mgmt_wen0 = sram0_web0;
    mgmt_wen_mask0 = sram0_wmask;
    mgmt_addr0 = sram0_addr0;
    mgmt_wdata0 = sram0_wdata;

    mgmt_ena_ro0 = sram0_csb1;
    mgmt_addr_ro0 = sram0_addr1;

    //Connect output to SRAM1
    mgmt_ena1 = sram1_csb0; 
    mgmt_wen1 = sram1_web0;
    mgmt_wen_mask1 = sram1_wmask;
    mgmt_addr1 = sram1_addr0;
    mgmt_wdata1 = sram1_wdata;

    mgmt_ena_ro1 = sram1_csb1;
    mgmt_addr_ro1 = sram1_addr1;
end
endmodule

module SRAM_OUT(
    input chip_select,
    input [31:0] sram0_data,
    input [31:0] sram1_data,
    output [31:0] sram_contents
);

//Mux read values from different SRAMS
//and send to picorv
always @(sram0_data, sram1_data) begin
    if(chip_select == 0)
        sram_contents = sram0_data;
    else if(chip_select == 1)
        sram_contents = sram1_data;
end
endmodule
`default_nettype wire 