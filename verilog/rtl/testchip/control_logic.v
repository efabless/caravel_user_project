`default_nettype  none
`include "sky130_sram_1kbyte_1rw1r_32x256_8.v"

module control_logic (
    input clk_in,
    input [:0] packet,
    input [31:0] read_data,
    output [31:0] write_to_sram,
    output [31:0] read_to_pico    
);

parameter NUM_SRAM = 2 ;

//Connections for R/W Port
reg [$clog2(NUM_SRAM) - 1:0] chip_select;
reg csb0_reg;
reg web0_reg;
reg [3:0] wmask_reg;
reg [7:0] addr0_reg;
reg [31:0] din_reg;

//Connections for RO Port
reg csb1_reg;
reg [7:0] addr1_reg;

//Capture data from pico into registers
always @ (packet) begin
    chip_select <= packet[]
    csb0_reg <= packet[]
    web0_reg <= packet[]
    wmask_reg <= packet[]
    addr0_reg <= packet[]
    din_reg <= packet[]
    
    csb1_reg <= packet[]
    addr1_reg <= packet[]
end

//Declare wires to connect to SRAM ports
//SRAM0
wire sram0_csb0;
wire sram0_web0;
wire [3:0] sram0_wmask;
wire [7:0] sram0_addr0;
wire [31:0] sram0_din;
wire [31:0] sram0_dout0;

wire sram0_csb1;
wire [7:0] sram0_addr1;
wire [31:0] sram0_dout1;

//SRAM1
wire sram1_csb0;
wire sram1_web0;
wire [3:0] sram1_wmask;
wire [7:0] sram1_addr0;
wire [31:0] sram1_din;
wire [31:0] sram1_dout0;

wire sram1_csb1;
wire [7:0] sram1_addr1;
wire [31:0] sram1_dout1;

//Create SRAM Blocks

sky130_sram_1kbyte_1rw1r_32x256_8 SRAM0 (
        // MGMT R/W port
        .clk0(clk_in), 
        .csb0(sram0_csb0),   
        .web0(sram0_web0),  
        .wmask0(sram0_wmask),
        .addr0(sram0_addr0),
        .din0(sram0_din),
        .dout0(sram0_dout0),
        // MGMT RO port
        .clk1(clk_in),
        .csb1(sram0_csb1), 
        .addr1(sram0_addr1),
        .dout1(sram0_dout1)
    );

sky130_sram_1kbyte_1rw1r_32x256_8 SRAM1 (
        // MGMT R/W port
        .clk0(clk_in), 
        .csb0(sram1_csb0),   
        .web0(sram1_web0),  
        .wmask0(sram1_wmask),
        .addr0(sram1_addr0),
        .din0(sram1_din),
        .dout0(sram1_dout0),
        // MGMT RO port
        .clk1(clk_in),
        .csb1(sram1_csb1), 
        .addr1(sram1_addr1),
        .dout1(sram1_dout1)
    );

always @ (chip_select) begin
    //Demux values from flops into SRAM
end

endmodule
`default_nettype wire 