`default_nettype  none
`include "control_logic.v"
`include "sky130_sram_1kbyte_1rw1r_32x256_8.v"

module openram_testchip(
    input clk_in,
    input rst,
    input [55:0] analyzer_packet,
    input [55:0] gpio_packet,
    input in_select,  
    output reg [31:0] sram_data
   
    `ifdef USE_POWER_PINS
      inout vdda1,        // User area 1 3.3V supply
      inout vdda2,        // User area 2 3.3V supply
      inout vssa1,        // User area 1 analog ground
      inout vssa2,        // User area 2 analog ground
      inout vccd1,        // User area 1 1.8V supply
      inout vccd2,        // User area 2 1.8v supply
      inout vssd1,        // User area 1 digital ground
      inout vssd2,        // User area 2 digital ground
  `endif
);

reg [54:0] packet;
reg chip_select;

//SRAM0
//RW Port
wire mgmt_ena0; 
wire mgmt_wen0; 
wire [3:0] mgmt_wen_mask0;  
wire [7:0] mgmt_addr0;
wire [31:0] mgmt_wdata0;
wire [31:0] mgmt_rdata0;
//RO Port
wire mgmt_ena_ro0;
wire [7:0] mgmt_addr_ro0;
wire [31:0] mgmt_rdata_ro0;

//SRAM1
wire mgmt_ena1; 
wire mgmt_wen1; 
wire [3:0] mgmt_wen_mask1;  
wire [7:0] mgmt_addr1;
wire [31:0] mgmt_wdata1;
wire [31:0] mgmt_rdata1;
//RO Port
wire mgmt_ena_ro1;
wire [7:0] mgmt_addr_ro1;
wire [31:0] mgmt_rdata_ro1;

//Data from SRAMs
wire [31:0] sram0_data;
wire [31:0] sram1_data;
wire [31:0] read_data;

//Read in input packet from analyzer or GPIO pins
always @(posedge clk_in or rst) begin
    if(rst) begin
        chip_select <= 0;
        packet <= 0;
    end
    
    else begin
        if(in_select == 0) begin
            chip_select <= analyzer_packet[55]; 
            packet <= analyzer_packet[54:0];
        end
        else if(in_select == 1) begin
            chip_select <= gpio_packet[55]; 
            packet <= gpio_packet[54:0];
        end
    end
end

//Instantitate port connections
SRAM_IN in_control(.clk_in(clk_in),
                   .rst(rst),
                   .chip_select(chip_select),
                   .packet(packet),
                   .mgmt_ena0(mgmt_ena0),
                   .mgmt_wen0(mgmt_wen0),
                   .mgmt_wen_mask0(mgmt_wen_mask0),
                   .mgmt_addr0(mgmt_addr0),
                   .mgmt_wdata0(mgmt_wdata0),
                   .mgmt_ena_ro0(mgmt_ena_ro0),
                   .mgmt_addr_ro0(mgmt_addr_ro0),
                   .mgmt_ena1(mgmt_ena1),
                   .mgmt_wen1(mgmt_wen1),
                   .mgmt_wen_mask1(mgmt_wen_mask1),
                   .mgmt_addr1(mgmt_addr1),
                   .mgmt_wdata1(mgmt_wdata1),
                   .mgmt_ena_ro1(mgmt_ena_ro1),
                   .mgmt_addr_ro1(mgmt_addr_ro1)
);

sky130_sram_1kbyte_1rw1r_32x256_8 SRAM_0 (
// MGMT R/W port
    .clk0(clk_in), 
    .csb0(mgmt_ena0),   
    .web0(mgmt_wen0),  
    .wmask0(mgmt_wen_mask0),
    .addr0(mgmt_addr0),
    .din0(mgmt_wdata0),
    .dout0(mgmt_rdata0),
    // MGMT RO port
    .clk1(clk_in),
    .csb1(mgmt_ena_ro0), 
    .addr1(mgmt_addr_ro0),
    .dout1(mgmt_rdata_ro0)
); 

sky130_sram_1kbyte_1rw1r_32x256_8 SRAM_1 (
    // MGMT R/W port
     .clk0(clk_in), 
    .csb0(mgmt_ena1),   
    .web0(mgmt_wen1),  
    .wmask0(mgmt_wen_mask1),
    .addr0(mgmt_addr1),
    .din0(mgmt_wdata1),
    .dout0(mgmt_rdata1),
    // MGMT RO port
    .clk1(clk_in),
    .csb1(mgmt_ena_ro1), 
    .addr1(mgmt_addr_ro1),
    .dout1(mgmt_rdata_ro1)
);  

SRAM_DATA sram0_out(.csb0(packet[54]),
          .rst(rst),
          .csb1(packet[8]),
          .dout0(mgmt_rdata0),
          .dout1(mgmt_rdata_ro0),
          .sram_data(sram0_data)
);

SRAM_DATA sram1_out(.csb0(packet[54]),
          .rst(rst),
          .csb1(packet[8]),
          .dout0(mgmt_rdata1),
          .dout1(mgmt_rdata_ro1),
          .sram_data(sram1_data)
);

SRAM_OUT out_control(.chip_select(chip_select),
                     .rst(rst),
                     .sram0_data(sram0_data),
                     .sram1_data(sram1_data),
                     .sram_contents(read_data)
);

always @(posedge clk_in) begin
    sram_data <= read_data;
end
endmodule
`default_nettype wire
