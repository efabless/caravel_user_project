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
  input  [32:0] gpio_packet,
  input         in_select,
  input  [31:0] sram0_rw_in,
  input  [31:0] sram0_ro_in,
  input  [31:0] sram1_rw_in,
  input  [31:0] sram1_ro_in,
  input  [31:0] sram2_rw_in,
  input  [31:0] sram3_rw_in,
  input  [31:0] sram4_rw_in,
  input  [63:0] sram5_rw_in,
  output reg [55:0] sram0_connections,
  output reg [55:0] sram1_connections,
  output reg [48:0] sram2_connections,
  output reg [46:0] sram3_connections,
  output reg [47:0] sram4_connections,
  output reg [83:0] sram5_connections,
  output reg [63:0] sram_data
);

reg [83:0] input_connection;
reg [2:0] chip_select;

reg clk;
reg sram_clk;
reg web;
reg csb0;
reg toggle_clk;

always @(*) begin
    clk = in_select ? gpio_clock : wb_clock;
end 


always @ (posedge clk) begin
    if(reset) begin
        input_connection <= ~0;
        chip_select <= 0;
        sram_clk <= 0;
    end
    else begin
        input_connection <= la_packet[82:0];
        chip_select <= la_packet[85:83];
    end
end 

always @(input_connection) begin
    toggle_clk <= 1;
end

always @(posedge clk) begin
    toggle_clk <= toggle_clk;
    if(toggle_clk) begin
            toggle_clk <= 0;
    end
end

always @(posedge clk) begin
    sram_clk <= toggle_clk;   
end

always @(posedge clk) begin
    if(reset) begin
        csb0 <= 1;
        web <= 1;
    end
    else begin
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
end

always @ (posedge clk) begin
    sram0_connections <= (chip_select == 0) ? {sram_clk || toggle_clk, input_connection[54:0]} : {56{1'b0}};
    sram1_connections <= (chip_select == 1) ? {sram_clk || toggle_clk, input_connection[54:0]} : {56{1'b0}};
    sram2_connections <= (chip_select == 2) ? {sram_clk || toggle_clk, input_connection[47:0]} : {48{1'b0}};
    sram3_connections <= (chip_select == 3) ? {sram_clk || toggle_clk, input_connection[45:0]} : {46{1'b0}};
    sram4_connections <= (chip_select == 4) ? {sram_clk || toggle_clk, input_connection[46:0]} : {47{1'b0}};
    sram5_connections <= (chip_select == 5) ? {sram_clk || toggle_clk, input_connection[82:0]} : {83{1'b0}};
end

always @ (posedge clk) begin
    if(web) begin
        case(chip_select)
        3'd0: sram_data <= csb0 ? sram0_ro_in : sram0_rw_in;
        3'd1: sram_data <= csb0 ? sram1_ro_in : sram1_rw_in;
        3'd2: sram_data <= sram2_rw_in;
        3'd3: sram_data <= sram3_rw_in;
        3'd4: sram_data <= sram4_rw_in;
        3'd5: sram_data <= sram5_rw_in;
        default: sram_data <= 64'd0;
        endcase
    end
end

endmodule


