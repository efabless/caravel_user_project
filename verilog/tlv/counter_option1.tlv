\m4_TLV_version 1d: tl-x.org
\SV
   m4_ifelse(M4_MAKERCHIP,1,['
   // Including Caravel Definitions
   m4_sv_include_url(['https://raw.githubusercontent.com/efabless/caravel/main/verilog/rtl/defines.v'])
   // Including the top level wrapper
   m4_sv_include_url(['https://raw.githubusercontent.com/ALI11-2000/Open-MPW-Framework-TLV/main/verilog/rtl/user_project_wrapper.v'])
   // Including the top level makerchip testbench
   m4_sv_include_url(['https://raw.githubusercontent.com/ALI11-2000/Open-MPW-Framework-TLV/main/verilog/dv/makerchip_tb/tb_counter.sv'])
   '])                            
   
   module counter_option1 #(
    parameter BITS = 32
   )(
   `ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
   `endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
    );
   
   wire clk;

\TLV
   // WB MI A
   $valid = *wbs_cyc_i && *wbs_stb_i; 
   $wstrb[3:0] = *wbs_sel_i & {4{*wbs_we_i}};
   *wbs_dat_o = $rdata[31:0];
   *wbs_ack_o = $ready;
   $wdata[31:0] = *wbs_dat_i;

    // IO
   *io_out = >>1$count;
   *io_oeb = {(`MPRJ_IO_PADS-1){$rst}};

    // IRQ
   *irq = '0;// Unused

    // LA
   *la_data_out = {{(127-BITS){1'b0}}, >>1$count};
    // Assuming LA probes [63:32] are for controlling the count register  
   $la_write[31:0] = ~*la_oenb[63:32] & ~{BITS{$valid}};
    // Assuming LA probes [65:64] are for controlling the count clk & reset  
   *clk = (~*la_oenb[64]) ? *la_data_in[64]: *wb_clk_i;
   $rst = (~*la_oenb[65]) ? *la_data_in[65]: *wb_rst_i;

   $count[BITS-1:0] = $rst ? '0 :
                      ($valid && !>>1$ready) ? {{$wstrb[3] ? $wdata[31:24] : >>1$count[31:24]},
                                             {$wstrb[2] ? $wdata[23:16] : >>1$count[23:16]},
                                             {$wstrb[1] ? $wdata[15: 8] : >>1$count[15: 8]},
                                             {$wstrb[0] ? $wdata[7 : 0] : >>1$count[ 7: 0]}}:
                      ~|$la_write ? >>1$count+1:
                      |$la_write ? $la_write & la_data_in[63:32]:
                      >>1$count;
                      
   $ready = $valid && !>>1$ready;
   $rdata[31:0] = ($valid && !>>1$ready) ? >>1$count : '0;
  
\SV
   endmodule