`default_nettype  none
`include "sky130_sram_1kbyte_1rw1r_32x256_8.v"

module control_logic (
    input clk_in,
    input [55:0] packet,
    output [31:0] read_to_pico    
);

parameter NUM_SRAM = 2 ;

//Connections for R/W Port
reg chip_select;
reg csb0_reg;
reg web0_reg;
reg [3:0] wmask_reg;
reg [7:0] addr0_reg;
reg [31:0] din_reg;
reg [31:0] dout0_reg;

//Connections for RO Port
reg csb1_reg;
reg [7:0] addr1_reg;
reg[31:0] dout1_reg;

//Capture data from pico into registers
always @ (packet) begin
    chip_select <= packet[55]
    csb0_reg <= packet[54]
    web0_reg <= packet[53]
    wmask_reg <= packet[52:49]
    addr0_reg <= packet[48:41]
    din_reg <= packet[40:9]
    
    csb1_reg <= packet[8]
    addr1_reg <= packet[7:0]
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

//Demux values from flops into SRAM
always @ (chip_select) begin
    case 1'b0: begin
        sram0_csb0 <= csb0_reg;
        sram0_web0 <= web0_reg;
        sram0_wmask <= wmask_reg;
        sram0_addr0 <= addr0_reg;
        sram0_din <= din_reg;

        sram0_csb1 <= csb1_reg;
        sram0_addr1 <= addr1_reg;
    end

    case 1'b1: begin
        sram1_csb0 <= csb0_reg;
        sram1_web0 <= web0_reg;
        sram1_wmask <= wmask_reg;
        sram1_addr0 <= addr0_reg;
        sram1_din <= din_reg;

        sram1_csb1 <= csb1_reg;
        sram1_addr1 <= addr1_reg;
    end
end

//Mux in values read from SRAM
always @ (sram0_dout0, sram0_dout1, sram1_dout0, sram1_dout1) begin
    if(chip_select == 0) begin
       dout0_reg <= sram0_dout0;
       dout1_reg <= sram0_dout1;
    end
    else if(chip_select == 1) begin
       dout0_reg <= sram1_dout0;
       dout1_reg <= sram1_dout1;
    end
end

//Forward read data to Picorv
always @ (*) begin
    if (port == 0)
        read_to_pico <= dout0_reg;
    else if (port == 1)
        read_to_pico <= dout1_reg;
end

endmodule
`default_nettype wire 