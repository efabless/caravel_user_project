`default_nettype  none

module SRAM_IN(
    input clk_in,
    input rst,
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

always @(posedge clk_in or rst) begin
    if(rst) begin
        in_packet <= 55'b0;
        cs <= 0;
    end
    else begin
        in_packet <= packet[54:0];
        cs <= chip_select;
    end
end

//Forward input bits to proper SRAM and
//0's to other SRAM pins
always @(posedge clk_in, rst) begin
    if(rst) begin
        mgmt_ena0 <= 1'b1;
        mgmt_wen0 <= 1'b1;
        mgmt_wen_mask0 <= 4'b0000;
        mgmt_addr0 <= 8'd0;
        mgmt_wdata0 = 32'd0;
        mgmt_ena_ro0 = 1'b1;
        mgmt_addr_ro0 = 8'd0;

        mgmt_ena1 <= 1'b1;
        mgmt_wen1 <= 1'b1;
        mgmt_wen_mask1 <= 4'b0000;
        mgmt_addr1 <= 8'd0;
        mgmt_wdata1 = 32'd0;
        mgmt_ena_ro1 = 1'b1;
        mgmt_addr_ro1 = 8'd0;
    end
    else begin
        case(cs)
        1'b0 : begin
            mgmt_ena0 <= in_packet[54];
            mgmt_wen0 <= in_packet[53];
            mgmt_wen_mask0 <= in_packet[52:49];
            mgmt_addr0 <= in_packet[48:41];
            mgmt_wdata0 = in_packet[40:9];
            mgmt_ena_ro0 = in_packet[8];
            mgmt_addr_ro0 = in_packet[7:0];

            mgmt_ena1 <= 1'b1;
            mgmt_wen1 <= 1'b1;
            mgmt_wen_mask1 <= 4'b0000;
            mgmt_addr1 <= 8'd0;
            mgmt_wdata1 = 32'd0;
            mgmt_ena_ro1 = 1'b1;
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

            mgmt_ena0 <= 1'b1;
            mgmt_wen0 <= 1'b1;
            mgmt_wen_mask0 <= 4'b0000;
            mgmt_addr0 <= 8'd0;
            mgmt_wdata0 = 32'd0;
            mgmt_ena_ro0 = 1'b0;
            mgmt_addr_ro0 = 8'd0;
        end
    endcase
    end
end
endmodule

module SRAM_DATA(
    input clk_in,
    input rst,
    input csb0, 
    input csb1,
    input [31:0] dout0,
    input [31:0] dout1,
    output reg [31:0] sram_data
);

//Mux out values from SRAM Ports 
always @(posedge clk_in or rst) begin
    if(rst) begin
        sram_data <= 32'd0;
    end
    
    else begin
        if(csb0 == 0)
            sram_data <= dout0;
        else if(csb1 == 0)
            sram_data <= dout1;
    end
end
endmodule

module SRAM_OUT(
    input clk_in,
    input rst,
    input chip_select,
    input [31:0] sram0_data,
    input [31:0] sram1_data,
    output reg [31:0] sram_contents
);

//Mux read values from different SRAMS
//and send to picorv
always @(posedge clk_in or rst) begin
    if(rst) begin
        sram_contents <= 32'd0;
    end
    else begin
        if(chip_select == 0)
            sram_contents <= sram0_data;
        else if(chip_select == 1)
            sram_contents <= sram1_data;
    end
end
endmodule
`default_nettype wire 