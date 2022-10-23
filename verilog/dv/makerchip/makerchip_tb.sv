  module top(input wire clk, input wire reset, input wire [31:0] cyc_cnt, output wire passed, output wire failed);    /* verilator lint_save */ /* verilator lint_off UNOPTFLAT */  bit [256:0] RW_rand_raw; bit [256+63:0] RW_rand_vect; pseudo_rand #(.WIDTH(257)) pseudo_rand (clk, reset, RW_rand_raw[256:0]); assign RW_rand_vect[256+63:0] = {RW_rand_raw[62:0], RW_rand_raw};  /* verilator lint_restore */  /* verilator lint_off WIDTH */ /* verilator lint_off UNOPTFLAT */   // (Expanded in Nav-TLV pane.)
   
   logic wb_clk_i;
   logic wb_rst_i;
   logic wbs_stb_i;
   logic wbs_cyc_i;
   logic wbs_we_i;
   logic [3:0] wbs_sel_i;
   logic [31:0] wbs_dat_i;
   logic [31:0] wbs_adr_i;
   logic wbs_ack_o;
   logic [31:0] wbs_dat_o;

   // Logic Analyzer Signals
   logic  [127:0] la_data_in;
   logic  [127:0] la_data_out;
   logic  [127:0] la_oenb;

   // IOs
   logic [`MPRJ_IO_PADS-1:0] io_in;
   logic [`MPRJ_IO_PADS-1:0] io_out;
   logic [`MPRJ_IO_PADS-1:0] io_oeb;
   logic [`MPRJ_IO_PADS-10:0] analog_io;

   // IRQ
   logic [2:0] irq;
   logic cnt;
            
   user_project_wrapper dut (
   `ifdef USE_POWER_PINS
      .vccd1(vccd1),	// User area 1 1.8V power
      .vssd1(vssd1),	// User area 1 digital ground
   `endif

      .wb_clk_i(wb_clk_i),
      .wb_rst_i(wb_rst_i),

      // MGMT SoC Wishbone Slave

      .wbs_cyc_i(wbs_cyc_i),
      .wbs_stb_i(wbs_stb_i),
      .wbs_we_i(wbs_we_i),
      .wbs_sel_i(wbs_sel_i),
      .wbs_adr_i(wbs_adr_i),
      .wbs_dat_i(wbs_dat_i),
      .wbs_ack_o(wbs_ack_o),
      .wbs_dat_o(wbs_dat_o),

      // Logic Analyzer

      .la_data_in(la_data_in),
      .la_data_out(la_data_out),
      .la_oenb (la_oenb),

      // IO Pads

      .io_in (io_in),
      .io_out(io_out),
      .io_oeb(io_oeb),

      // IRQ
      .analog_io(analog_io),
      .user_clock2(clk),
      .user_irq(irq)
   );

   always_ff @ (posedge clk) begin
      if(reset) begin
      	  wb_rst_i = 1;
           la_oenb = '1;
      end else begin
           wb_rst_i = 0;
      end
   end

   assign wb_clk_i = clk;
      
   endmodule