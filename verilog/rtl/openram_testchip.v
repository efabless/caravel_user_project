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
  input         gpio_in_scan,
  input         la_sram_load,
  input         gpio_sram_load,
  input         gpio_out_scan,
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
  //input  [63:0] sram5_rw_in,
  output reg [54:0] sram0_connections,
  output reg [54:0] sram1_connections,
  output reg [47:0] sram2_connections,
  output reg [45:0] sram3_connections,
  output reg [46:0] sram4_connections,
  //output reg [82:0] sram5_connections,
  output reg [63:0] la_data0,
  output reg [63:0] la_data1,
  output reg gpio_data0,
  output reg gpio_data1
);

reg clk;
reg sram_clk;

// Store input instruction
reg [111:0] sram_register;

// Hold dout from SRAM
// clocked by SRAM clk
reg [63:0] sram0_rw_data;
reg [63:0] sram0_ro_data;
reg [63:0] sram1_rw_data;
reg [63:0] sram1_ro_data;
reg [63:0] sram2_data;
reg [63:0] sram3_data;
reg [63:0] sram4_data;
//reg [63:0] sram5_data;

// Mux output to connect final output data
// into sram_register
reg [63:0] read_data0;
reg [63:0] read_data1;

// SRAM input connections
reg [3:0] chip_select;

reg [15:0] addr0;
reg [31:0] din0;
reg csb0;
reg web0;
reg [3:0] wmask0;

reg [15:0] addr1;
reg [31:0] din1;
reg csb1;
reg web1;
reg [3:0] wmask1;

//Selecting clock pin
always @(*) begin
    clk = in_select ? gpio_clk : la_clk;
    sram_clk = in_select ? gpio_clk : la_clk;
end

always @ (posedge clk) begin
    if(reset) begin
        sram_register <= 112'd0;
    end
    //GPIO scanning for input transfer
    else if(gpio_in_scan) begin
        sram_register <= {sram_register[110:0], gpio_bit};
    end
    else if(la_in_load) begin
        sram_register <= la_bits;
    end
    else if(gpio_sram_load || la_sram_load) begin
        sram_register <= {sram_register[bits above DIN0], DOUT0, sram_register[bits between DIN0 and DIN1], DOUT1, sram_register[bits below din1}
    end
    //GPIO scanning for output transfer
    else if(gpio_out_scan) begin
        sram_register <= sram_register >> 1;
    end
end

// Splitting register bits into fields
always @(sram_register) begin
    chip_select = sram_register[111:108];
        
    addr0 = sram_register[107:92];
    din0 = sram_register[91:60];
    csb0 = sram_register[59];
    web0 = sram_register[58];
    wmask0 = sram_register[57:54];

    addr1 = sram_register[53:38];
    din1 = sram_register[37:6];
    csb1 = sram_register[5];
    web1 = sram_register[4];
    wmask1 = sram_register[3:0];
end

always @ (*) begin
    sram0_connections = (chip_select == 0) ? {csb0, web0, wmask0, addr0[7:0], din0, csb1, addr1} : {55{1'b0}};     //32x256 Dual Port
    sram1_connections = (chip_select == 1) ? {csb0, web0, wmask0, addr0[7:0], din0, csb1, addr1} : {55{1'b0}};     //32x256 Dual Port
    sram2_connections = (chip_select == 2) ? {csb0, web0, wmask0, addr0[9:0], din0} : {48{1'b0}};   //32x1024 Single Port
    sram3_connections = (chip_select == 3) ? {csb0, web0, wmask0, addr0[7:0], din0} : {46{1'b0}};      //32x256 Single Port
    sram4_connections = (chip_select == 4) ? {csb0, web0, wmask0, addr0[8:0], din0} : {47{1'b0}};      //32x512 Single Port
    //sram5_connections = (chip_select == 5) ? {csb0, web0, wmask0, addr0, din0} : {83{1'b0}};
end

// Store dout of each SRAM  
always @ (posedge sram_clk) begin   
    if(reset) begin
        sram0_rw_data <= 32'd0;
        sram0_ro_data <= 32'd0;

        sram1_rw_data <= 32'd0;
        sram1_ro_data <= 32'd0;

        sram2_data <= 32'd0;
        sram3_data <= 32'd0;
        sram4_data <= 32'd0;
        //sram5_data <= 32'd0; 
    end
    else begin
        sram0_rw_data <= sram0_rw_in;
        sram0_ro_data <= sram0_ro_in;

        sram1_rw_data <= sram1_rw_in;
        sram1_ro_data <= sram1_ro_in;

        sram2_data <= sram2_rw_in;
        sram3_data <= sram3_rw_in;
        sram4_data <= sram4_rw_in;
        //sram5_data <= sram5_rw_in; 
    end
end

// Mux value of correct SRAM dout FF to feed into 
// DFF clocked by la/gpio clk 
always @ (*) begin
    case(chip_select)
    3'd0: begin
        read_data0 = sram0_rw_data;
        read_data1 = sram0_ro_data;
    end 
    3'd1: begin
        read_data0 = sram1_rw_data;
        read_data1 = sram1_ro_data;
    end 
    3'd2: read_data0 = sram2_data;
    3'd3: read_data0 = sram3_data;
    3'd4: read_data0 = sram4_data;
    //3'd5: assign read_data0 = sram5_data;
    default: begin
        read_data0 = 64'd0;
        read_data1 = 64'd0;
    end
    endcase
end

// Output transfer
always @ (*) begin
    if(in_select) begin
        gpio_data0 = sram_register[???];
        gpio_data1 = sram_register[???];
    end    
    else begin
        la_data0 = sram_data0;
        la_data1 = sram_data1;
    end
end

endmodule


