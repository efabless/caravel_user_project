`default_nettype  none

module control_logic (
    input clk_in,
    input [:0] packet,
    input [31:0] read_data,
    output [31:0] write_to_sram,
    output [31:0] read_to_pico    
);

//Connections for R/W Port
reg csb0_reg;
reg web0_reg;
reg [3:0] wmask_reg;
reg [7:0] addr0_reg;
reg [31:0] din_reg;

//Connections for RO Port
reg csb1_reg;
reg [7:0] addr1_reg;

//Capture data from pico into registers
always @ (???) begin
    csb0_reg <= packet[]
    web0_reg <= packet[]
    wmask_reg <= packet[]
    addr0_reg <= packet[]
    din_reg <= packet[]
    
    csb1_reg <= packet[]
    addr1_reg <= packet[]
end

endmodule
`default_nettype wire 