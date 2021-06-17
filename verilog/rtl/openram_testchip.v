`include "openram_defines.v"

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
			input         resetn,
			input         clk,
			input         la_in_load,
			input         la_sram_load,
			input  [`TOTAL_SIZE-1:0] la_data_in,
			// GPIO bit to clock control register
			input         gpio_in,
			input         gpio_scan,
			input         gpio_sram_load,
         input         global_csr,
			// SRAM data outputs to be captured
			input  [`DATA_SIZE-1:0] sram0_data0,
			input  [`DATA_SIZE-1:0] sram0_data1,
			input  [`DATA_SIZE-1:0] sram1_data0,
			input  [`DATA_SIZE-1:0] sram1_data1,
			input  [`DATA_SIZE-1:0] sram2_data0,
			input  [`DATA_SIZE-1:0] sram2_data1,
			input  [`DATA_SIZE-1:0] sram3_data0,
			input  [`DATA_SIZE-1:0] sram3_data1,
			input  [`DATA_SIZE-1:0] sram4_data0,
			input  [`DATA_SIZE-1:0] sram4_data1,
			input  [`DATA_SIZE-1:0] sram5_data0,
			input  [`DATA_SIZE-1:0] sram5_data1,
			input  [`DATA_SIZE-1:0] sram6_data0,
			input  [`DATA_SIZE-1:0] sram6_data1,
			input  [`DATA_SIZE-1:0] sram7_data0,
			input  [`DATA_SIZE-1:0] sram7_data1,
			input  [`DATA_SIZE-1:0] sram8_data0,
			input  [`DATA_SIZE-1:0] sram8_data1,
			input  [`DATA_SIZE-1:0] sram9_data0,
			input  [`DATA_SIZE-1:0] sram9_data1,
			input  [`DATA_SIZE-1:0] sram10_data0,
			input  [`DATA_SIZE-1:0] sram10_data1,
			input  [`DATA_SIZE-1:0] sram11_data0,
			input  [`DATA_SIZE-1:0] sram11_data1,
			input  [`DATA_SIZE-1:0] sram12_data0,
			input  [`DATA_SIZE-1:0] sram12_data1,
			input  [`DATA_SIZE-1:0] sram13_data0,
			input  [`DATA_SIZE-1:0] sram13_data1,
			input  [`DATA_SIZE-1:0] sram14_data0,
			input  [`DATA_SIZE-1:0] sram14_data1,
			input  [`DATA_SIZE-1:0] sram15_data0,
			input  [`DATA_SIZE-1:0] sram15_data1,

			// Shared control/data to the SRAMs
			output reg [`ADDR_SIZE-1:0] left_addr0,
			output reg [`DATA_SIZE-1:0] left_din0,
			output reg 	  left_web0,
			output reg [`WMASK_SIZE-1:0]  left_wmask0,
			output reg [`ADDR_SIZE-1:0] left_addr1,
			output reg [`DATA_SIZE-1:0] left_din1,
			output reg 	  left_web1,
			output reg [`WMASK_SIZE-1:0]  left_wmask1,
			// One CSB for each SRAM
			// One CSB for each SRAM
			output reg [`MAX_CHIPS-1:0] left_csb0,
			output reg [`MAX_CHIPS-1:0] left_csb1,

			// Shared control/data to the SRAMs
			output [`ADDR_SIZE-1:0] right_addr0,
			output [`DATA_SIZE-1:0] right_din0,
			output 	  right_web0,
			output [`WMASK_SIZE-1:0]  right_wmask0,
			// One CSB for each SRAM
			output [`MAX_CHIPS-1:0] right_csb0,

			output reg [`TOTAL_SIZE-1:0] la_data_out,
			output reg gpio_out
);

// Store input instruction
   reg [`TOTAL_SIZE-1:0] sram_register;
   reg 		       csb0_temp;
   reg 		       csb1_temp;

   // Mux output to connect final output data
   // into sram_register
   reg [`DATA_SIZE-1:0] read_data0;
   reg [`DATA_SIZE-1:0] read_data1;

   // SRAM input connections
   reg [`SELECT_SIZE-1:0]  chip_select;

   // Duplicate pins on other side
   wire [`ADDR_SIZE-1:0] right_addr0 = left_addr0;
   wire [`DATA_SIZE-1:0] right_din0 = left_din0;
   wire 		   right_web0 = left_web0;
   wire [`WMASK_SIZE-1:0] right_wmask0 = left_wmask0;
   wire [`MAX_CHIPS-1:0]  right_csb0 = left_csb0;

always @ (posedge clk) begin
   if(!resetn) begin
      sram_register <= {`TOTAL_SIZE{1'b0}};
   end
   // GPIO scanning for transfer
   else if(gpio_scan) begin
      sram_register <= {sram_register[`TOTAL_SIZE-2:0], gpio_in};
   end
   // LA parallel load
   else if(la_in_load) begin
      sram_register <= la_data_in;
   end
   // Store results for read out
   else if(gpio_sram_load || la_sram_load) begin

      sram_register <= {sram_register[`TOTAL_SIZE-1:`TOTAL_SIZE-`SELECT_SIZE-`ADDR_SIZE],
			read_data0,
			sram_register[`ADDR_SIZE+`DATA_SIZE+2*`WMASK_SIZE+3:`DATA_SIZE+`WMASK_SIZE+2],
			read_data1,
			sram_register[`WMASK_SIZE+1:0]};
   end
end


// Splitting register bits into fields
always @(*) begin
   chip_select = sram_register[`TOTAL_SIZE-1:`TOTAL_SIZE-`SELECT_SIZE];

   left_addr0 = sram_register[`TOTAL_SIZE-`SELECT_SIZE-1:`TOTAL_SIZE-`SELECT_SIZE-`ADDR_SIZE];
   left_din0 = sram_register[`DATA_SIZE+`PORT_SIZE+`WMASK_SIZE+1:`PORT_SIZE+`WMASK_SIZE+2];
   csb0_temp = global_csr | sram_register[`PORT_SIZE+`WMASK_SIZE+1];
   left_web0 = sram_register[`PORT_SIZE+`WMASK_SIZE];
   left_wmask0 = sram_register[`PORT_SIZE+`WMASK_SIZE-1:`PORT_SIZE];

   left_addr1 = sram_register[`PORT_SIZE-1:`DATA_SIZE+`WMASK_SIZE+2];
   left_din1 = sram_register[`DATA_SIZE+`WMASK_SIZE+1:`WMASK_SIZE+2];
   csb1_temp = global_csr | sram_register[`WMASK_SIZE+1];
   left_web1 = sram_register[`WMASK_SIZE];
   left_wmask1 = sram_register[`WMASK_SIZE-1:0];
end

// Apply the correct CSB
always @(*) begin
   left_csb0 = ~( (~{15'b111111111111111, csb0_temp}) << chip_select);
   left_csb1 = ~(  (~{15'b111111111111111, csb1_temp}) << chip_select);
end

// Mux value of correct SRAM data input to feed into
// DFF clocked by la/gpio clk
always @ (*) begin
    case(chip_select)
    4'd0: begin
       read_data0 = sram0_data0;
       read_data1 = sram0_data1;
    end
    4'd1: begin
       read_data0 = sram1_data0;
       read_data1 = sram1_data1;
    end
    4'd2: begin
       read_data0 = sram2_data0;
       read_data1 = sram2_data1;
    end
    4'd3: begin
       read_data0 = sram3_data0;
       read_data1 = sram3_data1;
    end
    4'd4: begin
       read_data0 = sram4_data0;
       read_data1 = sram4_data1;
    end
    4'd5: begin
       read_data0 = sram5_data0;
       read_data1 = sram5_data1;
    end
    4'd6: begin
       read_data0 = sram6_data0;
       read_data1 = sram6_data1;
    end
    4'd7: begin
       read_data0 = sram7_data0;
       read_data1 = sram7_data1;
    end
    4'd8: begin
       read_data0 = sram8_data0;
       read_data1 = sram8_data1;
    end
    4'd9: begin
       read_data0 = sram9_data0;
       read_data1 = sram9_data1;
    end
    4'd10: begin
       read_data0 = sram10_data0;
       read_data1 = sram10_data1;
    end
    4'd11: begin
       read_data0 = sram11_data0;
       read_data1 = sram11_data1;
    end
    4'd12: begin
       read_data0 = sram12_data0;
       read_data1 = sram12_data1;
    end
    4'd13: begin
       read_data0 = sram13_data0;
       read_data1 = sram13_data1;
    end
    4'd14: begin
       read_data0 = sram14_data0;
       read_data1 = sram14_data1;
    end
    4'd15: begin
       read_data0 = sram15_data0;
       read_data1 = sram15_data1;
    end
    endcase
end

// Output logic
always @ (*) begin
   gpio_out = sram_register[`TOTAL_SIZE-1];
   la_data_out = sram_register;
end

endmodule
