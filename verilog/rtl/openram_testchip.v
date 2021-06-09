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
  input         wb_clock,
  input         gpio_clock,
  input         reset,
  input  [85:0] la_packet,
  input  [55:0] gpio_packet,
  input         in_select,
  input  [31:0] sram0_rw_in,
  input  [31:0] sram0_r0_in,
  input  [31:0] sram1_rw_in,
  input  [31:0] sram1_ro_in,
  input  [31:0] sram2_rw_in,
  input  [31:0] sram3_rw_in,
  input  [31:0] sram4_rw_in,
  input  [63:0] sram5_rw_in,
  output reg [54:0] sram0_connections,
  output reg [54:0] sram1_connections,
  output reg [47:0] sram2_connections,
  output reg [45:0] sram3_connections,
  output reg [46:0] sram4_connections,
  output reg [82:0] sram5_connections,
  output reg [63:0] sram_data
);

reg [82:0] input_connection;
reg [2:0] chip_select;

reg clk;
reg web;
reg csb0;

always @(*) begin
    clk = in_select ? gpio_clock : wb_clock;
end 


always @ (posedge clk) begin
    if(reset) begin
        input_connection <= ~0;
        chip_select <= 0;
    end
    else begin
        input_connection <= la_packet[82:0];
        chip_select <= la_packet[85:83];
    end
end 

always @(*) begin
    case(chip_select)
    3'd0: begin
        csb0 <= input_connection[54];
        web <= input_connection[53]; 
    end
    3'd1: begin
        csb0 <= input_connection[54];
        web <= input_connection[53];
    end 
    3'd2: web <= input_connection[46];
    3'd3: web <= input_connection[44];
    3'd4: web <= input_connection[45];
    3'd5: web <= input_connection[81];
    default : begin
        csb0 <= 1;
        web <= 1;
    end
    endcase
end

always @ (posedge clk) begin
    sram0_connections <= (chip_select == 0) ? input_connection[54:0] : {55{1'b1}};
    sram1_connections <= (chip_select == 1) ? input_connection[54:0] : {55{1'b1}};
    sram2_connections <= (chip_select == 2) ? input_connection[47:0] : {47{1'b1}};
    sram3_connections <= (chip_select == 3) ? input_connection[45:0] : {45{1'b1}};
    sram4_connections <= (chip_select == 4) ? input_connection[46:0] : {46{1'b1}};
    sram5_connections <= (chip_select == 5) ? input_connection[82:0] : {82{1'b1}};
end

endmodule


