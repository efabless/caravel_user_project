module openram_testchip(
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
			input         reset,
			// Select either GPIO or LA mode
			input         in_select,
			
			input         la_clk,
			input         la_sram_clk,
			input         la_in_load, 
			input         la_sram_load,
			input  [111:0] la_data_in,
			// GPIO bit to clock control register
			input         gpio_clk,
			input         gpio_in,
			input         gpio_sram_clk,
			input         gpio_scan,
			input         gpio_sram_load,

			// SRAM data outputs to be captured
			input  [31:0] sram0_dout0,
			input  [31:0] sram0_dout1,
			input  [31:0] sram1_dout0,
			input  [31:0] sram1_dout1,
			input  [31:0] sram2_dout0,
			input  [31:0] sram2_dout1,
			input  [31:0] sram3_dout0,
			input  [31:0] sram3_dout1,
			input  [31:0] sram4_dout0,
			input  [31:0] sram4_dout1,
			input  [31:0] sram5_dout0,
			input  [31:0] sram5_dout1,
			input  [31:0] sram6_dout0,
			input  [31:0] sram6_dout1,
			input  [31:0] sram7_dout0,
			input  [31:0] sram7_dout1,
			input  [31:0] sram8_dout0,
			input  [31:0] sram8_dout1,
			input  [31:0] sram9_dout0,
			input  [31:0] sram9_dout1,
			input  [31:0] sram10_dout0,
			input  [31:0] sram10_dout1,
			input  [31:0] sram11_dout0,
			input  [31:0] sram11_dout1,
			input  [31:0] sram12_dout0,
			input  [31:0] sram12_dout1,
			input  [31:0] sram13_dout0,
			input  [31:0] sram13_dout1,
			input  [31:0] sram14_dout0,
			input  [31:0] sram14_dout1,
			input  [31:0] sram15_dout0,
			input  [31:0] sram15_dout1,
			
			// Shared control/data to the SRAMs
			output reg [15:0] addr0;
			output reg [31:0] din0;
			output reg 	  web0;
			output reg [3:0]  wmask0;
			output reg [15:0] addr1;
			output reg [31:0] din1;
			output reg 	  web1;
			output reg [3:0]  wmask1;
			// One CSB for each SRAM
			output reg [15:0] csb0;
			output reg [15:0] csb1;
			
			// Clocks for each SRAM
			output reg sram0_clk,
			output reg sram1_clk,
			output reg sram2_clk,
			output reg sram3_clk,
			output reg sram4_clk,
			output reg sram5_clk,
			output reg sram6_clk,
			output reg sram7_clk,
			output reg sram8_clk,
			output reg sram9_clk,
			output reg sram10_clk,
			output reg sram11_clk,
			output reg sram12_clk,
			output reg sram13_clk,
			output reg sram14_clk,
			output reg sram15_clk,
			output reg [111:0] la_data_in,
			output reg gpio_out
);

   reg clk;
   reg sram_clk;

// Store input instruction
   reg [111:0] sram_register;
   reg 	       csb0_temp;
   reg 	       csb1_temp;

// Hold dout from SRAM
// clocked by SRAM clk
   reg [31:0] sram0_dout0;
   reg [31:0] sram0_dout1;
   reg [31:0] sram1_dout0;
   reg [31:0] sram1_dout1;
   reg [31:0] sram2_dout0;
   reg [31:0] sram2_dout1;
   reg [31:0] sram3_dout0;
   reg [31:0] sram3_dout1;
   reg [31:0] sram4_dout0;
   reg [31:0] sram4_dout1;
   reg [31:0] sram5_dout0;
   reg [31:0] sram5_dout1;
   reg [31:0] sram6_dout0;
   reg [31:0] sram6_dout1;
   reg [31:0] sram7_dout0;
   reg [31:0] sram7_dout1;
   reg [31:0] sram8_dout0;
   reg [31:0] sram8_dout1;
   reg [31:0] sram9_dout0;
   reg [31:0] sram9_dout1;
   reg [31:0] sram10_dout0;
   reg [31:0] sram10_dout1;
   reg [31:0] sram11_dout0;
   reg [31:0] sram11_dout1;
   reg [31:0] sram12_dout0;
   reg [31:0] sram12_dout1;
   reg [31:0] sram13_dout0;
   reg [31:0] sram13_dout1;
   reg [31:0] sram14_dout0;
   reg [31:0] sram14_dout1;
   reg [31:0] sram15_dout0;
   reg [31:0] sram15_dout1;

// Mux output to connect final output data
// into sram_register
   reg [31:0] read_data0;
   reg [31:0] read_data1;

// SRAM input connections
   reg [3:0]  chip_select;

//Selecting clock pin
always @(*) begin
    clk = in_select ? gpio_clk : la_clk;
    sram_clk = in_select ? gpio_sram_clk : la_sram_clk;
    sram0_clk = sram_clk;
    sram1_clk = sram_clk;
    sram2_clk = sram_clk;
    sram3_clk = sram_clk;
    sram4_clk = sram_clk;
    sram5_clk = sram_clk;
    sram6_clk = sram_clk;
    sram7_clk = sram_clk;
    sram8_clk = sram_clk;
    sram9_clk = sram_clk;
    sram10_clk = sram_clk;
    sram11_clk = sram_clk;
    sram12_clk = sram_clk;
    sram13_clk = sram_clk;
    sram14_clk = sram_clk;
    sram15_clk = sram_clk;
end

always @ (posedge clk) begin
   if(reset) begin
      sram_register <= 112'd1;
   end
   // GPIO scanning for transfer
   else if(gpio_scan) begin
      sram_register <= {sram_register[110:0], gpio_in};
   end
   // LA parallel load
   else if(la_in_load) begin
      sram_register <= la_data_in;
   end
   // Store results for read out
   else if(gpio_sram_load || la_sram_load) begin
      sram_register <= {sram_register[111:92], read_data0, sram_register[59:38], read_data1, sram_register[5:0]};
   end
end

// Splitting register bits into fields
always @(sram_register) begin
    chip_select = sram_register[111:108];
        
    addr0 = sram_register[107:92];
    din0 = sram_register[91:60];
    csb0_temp = sram_register[59];
    web0 = sram_register[58];
    wmask0 = sram_register[57:54];

    addr1 = sram_register[53:38];
    din1 = sram_register[37:6];
    csb1_temp = sram_register[5];
    web1 = sram_register[4];
    wmask1 = sram_register[3:0];
end // always @ (sram_register)
   
// Apply the correct CSB
always @(*) begin
   csb0 = csb0_temp << chip_select;
   csb1 = csb1_temp << chip_select;
end
       

// Store dout of each SRAM  
always @ (posedge sram_clk) begin   
    if(reset) begin
        sram0_data0 <= 32'd0;
        sram0_data1 <= 32'd0;
        sram1_data0 <= 32'd0;
        sram1_data1 <= 32'd0;
        sram2_data0 <= 32'd0;
        sram2_data1 <= 32'd0;
        sram3_data0 <= 32'd0;
        sram3_data1 <= 32'd0;
        sram4_data0 <= 32'd0;
        sram4_data1 <= 32'd0;
        sram5_data0 <= 32'd0;
        sram5_data1 <= 32'd0;
        sram6_data0 <= 32'd0;
        sram6_data1 <= 32'd0;
        sram7_data0 <= 32'd0;
        sram7_data1 <= 32'd0;
        sram8_data0 <= 32'd0;
        sram8_data1 <= 32'd0;
        sram9_data0 <= 32'd0;
        sram9_data1 <= 32'd0;
        sram10_data0 <= 32'd0;
        sram10_data1 <= 32'd0;
        sram11_data0 <= 32'd0;
        sram11_data1 <= 32'd0;
        sram12_data0 <= 32'd0;
        sram12_data1 <= 32'd0;
        sram13_data0 <= 32'd0;
        sram13_data1 <= 32'd0;
        sram14_data0 <= 32'd0;
        sram14_data1 <= 32'd0;
        sram15_data0 <= 32'd0;
        sram15_data1 <= 32'd0;
    end
    else begin
       sram0_data0 <= sram0_dout0;
       sram0_data1 <= sram0_dout1;
       sram1_data0 <= sram1_dout0;
       sram1_data1 <= sram1_dout1;
       sram2_data0 <= sram2_dout0;
       sram2_data1 <= sram2_dout1;
       sram3_data0 <= sram3_dout0;
       sram3_data1 <= sram3_dout1;
       sram4_data0 <= sram4_dout0;
       sram4_data1 <= sram4_dout1;
       sram5_data0 <= sram5_dout0;
       sram5_data1 <= sram5_dout1;
       sram6_data0 <= sram6_dout0;
       sram6_data1 <= sram6_dout1;
       sram7_data0 <= sram7_dout0;
       sram7_data1 <= sram7_dout1;
       sram8_data0 <= sram8_dout0;
       sram8_data1 <= sram8_dout1;
       sram9_data0 <= sram9_dout0;
       sram9_data1 <= sram9_dout1;
       sram10_data0 <= sram10_dout0;
       sram10_data1 <= sram10_dout1;
       sram11_data0 <= sram11_dout0;
       sram11_data1 <= sram11_dout1;
       sram12_data0 <= sram12_dout0;
       sram12_data1 <= sram12_dout1;
       sram13_data0 <= sram13_dout0;
       sram13_data1 <= sram13_dout1;
       sram14_data0 <= sram14_dout0;
       sram14_data1 <= sram14_dout1;
       sram15_data0 <= sram15_dout0;
       sram15_data1 <= sram15_dout1;
    end
end

// Mux value of correct SRAM dout FF to feed into 
// DFF clocked by la/gpio clk 
always @ (*) begin
    case(chip_select)
    4'd0: begin
       read_data0 = sram0_dout0;
       read_data1 = sram0_dout1;
    end
    4'd1: begin
       read_data0 = sram1_dout0;
       read_data1 = sram1_dout1;
    end
    4'd2: begin
       read_data0 = sram2_dout0;
       read_data1 = sram2_dout1;
    end
    4'd3: begin
       read_data0 = sram3_dout0;
       read_data1 = sram3_dout1;
    end
    4'd4: begin
       read_data0 = sram4_dout0;
       read_data1 = sram4_dout1;
    end
    4'd5: begin
       read_data0 = sram5_dout0;
       read_data1 = sram5_dout1;
    end
    4'd6: begin
       read_data0 = sram6_dout0;
       read_data1 = sram6_dout1;
    end
    4'd7: begin
       read_data0 = sram7_dout0;
       read_data1 = sram7_dout1;
    end
    4'd8: begin
       read_data0 = sram8_dout0;
       read_data1 = sram8_dout1;
    end
    4'd9: begin
       read_data0 = sram9_dout0;
       read_data1 = sram9_dout1;
    end
    4'd10: begin
       read_data0 = sram10_dout0;
       read_data1 = sram10_dout1;
    end
    4'd11: begin
       read_data0 = sram11_dout0;
       read_data1 = sram11_dout1;
    end
    4'd12: begin
       read_data0 = sram12_dout0;
       read_data1 = sram12_dout1;
    end
    4'd13: begin
       read_data0 = sram13_dout0;
       read_data1 = sram13_dout1;
    end
    4'd14: begin
       read_data0 = sram14_dout0;
       read_data1 = sram14_dout1;
    end
    4'd15: begin
       read_data0 = sram15_dout0;
       read_data1 = sram15_dout1;
    end
    endcase
end

// Output logic
always @ (*) begin
   gpio_out = sram_register[111];
   la_data_out = {16'd0, sram_register};
end

endmodule


