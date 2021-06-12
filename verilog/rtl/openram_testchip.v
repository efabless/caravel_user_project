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
  input         la_clk,
  input         gpio_clk,
  input         la_sram_clk,
  input         gpio_sram_clk,
  input         reset,
  input         la_in_load, 
  input         gpio_in_load,
  input         la_sram_load,
  input         gpio_sram_load,
  input  [111:0] la_bits,
  input         gpio_bit,
  input         in_select,
  input  [63:0] sram0_rw_in,
  input  [63:0] sram0_ro_in,
  input  [63:0] sram1_rw_in,
  input  [63:0] sram1_ro_in,
  input  [63:0] sram2_rw_in,
  input  [63:0] sram3_rw_in,
  input  [63:0] sram4_rw_in,
  input  [63:0] sram5_rw_in,
  output reg [54:0] sram0_connections,
  output reg [54:0] sram1_connections,
  output reg [47:0] sram2_connections,
  output reg [45:0] sram3_connections,
  output reg [46:0] sram4_connections,
  output reg [82:0] sram5_connections,
  output reg [63:0] la_data,
  output reg gpio_data
);

reg [111:0] sram_register;
reg [3:0] chip_select;

reg [63:0] read_data;
reg [63:0] sram_data;

reg clk;
reg sram_clk;

always @(*) begin
    clk = in_select ? gpio_clk : la_clk;
    sram_clk = in_select ? gpio_clk : la_clk;
end

always @ (posedge clk) begin
    if(reset) begin
        sram_register <= 112'd0;
    end
    else if(gpio_in_load) begin
        sram_register <= {sram_register[110:0], gpio_bit};
    end
    else if(la_in_load) begin
        sram_register <= la_bits;
    end
    else if(gpio_sram_load || la_sram_load) begin
        
    end
end

always @ (posedge clk) begin
    if(reset) begin
        input_connection <= 84'd0;
        chip_select <= 3'd0;
    end
    else begin
        if(in_select) begin
            input_connection <= {input_connection[82:0], gpio_packet};
        end
        else begin
           input_connection <= la_packet[82:0];
           chip_select <= la_packet[85:83]; 
        end
    end
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
    
end

always @ (input_connection) begin
    sram0_connections = (chip_select == 0) ? input_connection[54:0] : {55{1'b0}};
    sram1_connections = (chip_select == 1) ? input_connection[54:0] : {55{1'b0}};
    sram2_connections = (chip_select == 2) ? input_connection[47:0] : {48{1'b0}};
    sram3_connections = (chip_select == 3) ? input_connection[45:0] : {46{1'b0}};
    sram4_connections = (chip_select == 4) ? input_connection[46:0] : {47{1'b0}};
    sram5_connections = (chip_select == 5) ? input_connection[82:0] : {83{1'b0}};
end

always @ (*) begin   
    case(chip_select)
    3'd0: read_data <= csb0 ? sram0_ro_in : sram0_rw_in;
    3'd1: read_data <= csb0 ? sram1_ro_in : sram1_rw_in;
    3'd2: read_data <= sram2_rw_in;
    3'd3: read_data <= sram3_rw_in;
    3'd4: read_data <= sram4_rw_in;
    3'd5: read_data <= sram5_rw_in;
    default: read_data <= 64'd0;
    endcase
end

always @(posedge clk) begin
    if(reset) begin
       sram_data <= 64'd0; 
    end
    else begin
        if(web) begin
            sram_data <= read_data;
            sram_data <= sram_data >> 1;
        end
    end
end

always @ (*) begin
    if(in_select) begin
        gpio_data = sram_data[0];
    end    
    else begin
        la_data = sram_data;
    end
end

endmodule


