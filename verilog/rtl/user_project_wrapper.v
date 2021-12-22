`define MPRJ_IO_PADS 38


module user_project_wrapper (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
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

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    inout [`MPRJ_IO_PADS-10:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

rest_top mprj (
`ifdef USE_POWER_PINS
    .vccd1	(vccd1),	// User area 1 1.8V supply
    .vssd1	(vssd1),	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    .wb_clk_i	(wb_clk_i),
    .wb_rst_i	(wb_rst_i),
    .wbs_stb_i	(wbs_stb_i),
    .wbs_cyc_i	(wbs_cyc_i),
    .wbs_we_i	(wbs_we_i),
    .wbs_sel_i	(wbs_sel_i),
    .wbs_dat_i	(wbs_dat_i),
    .wbs_adr_i	(wbs_adr_i),
    .wbs_ack_o	(wbs_ack_o),
    .wbs_dat_o	(wbs_dat_o),

    // Logic Analyzer Signals
    .la_data_in	(la_data_in),
    .la_data_out(la_data_out),
    .la_oenb	(la_oenb),

    // IOs
    .io_in	(io_in),
    .io_out	(io_out),
    .io_oeb	(io_oeb),

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
    .analog_io	(analog_io),

    // Independent clock (on independent integer divider)
    .user_clock2(user_clock2),

    // User maskable interrupt signals
    .user_irq	(user_irq)
);

endmodule	// user_project_wrapper