`define assert(signal, value) \
if (!(signal === value)) begin \
   $display("ASSERTION FAILED in %m: signal != value"); \
   $finish;\
end

`timescale 1ns/1ns

`include "control_logic.v"
`include "sky130_sram_1kbyte_1rw1r_32x256_8.v"

module control_logic_tb;

reg clk_in;
reg chip_select;
reg [54:0] packet;

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

wire [31:0] read_data;

//Instantitate port connections
SRAM_IN in_control(.clk_in(clk_in),
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


SRAM_OUT out_control(.chip_select(chip_select),
                     .sram0_data(mgmt_rdata0),
                     .sram1_data(mgmt_rdata1),
                     .sram_contents(read_data)
);


initial begin
    clk_in = 1;
    chip_select = 0;
    //Write 1 to address 0 in SRAM 0
    assign packet_bits = {1'b1, 1'b1, 4'd0, 8'd0, 32'd1, 1'b0, 8'd0}
    packet = packet_bits

    #20
    //Check each output is being sent properly to SRAM
    `assert(mgmt_ena0, 1'b1)
    `assert(mgmt_wen0, 1'b1)
    `assert(mgmt_wen_mask0, 4'd0)
    `assert(mgmt_addr0, 8'd0)
    `assert(mgmt_wdata0, 32'd1)

    //RO Port
    `assert(mgmt_ena_ro0, 1'b0)
    `assert(mgmt_wen0, 8'd0)
end

endmodule