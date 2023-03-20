module emulator (
    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,
);
    user_project_wrapper upw(
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),

        .io_in(io_in),
        .io_out(io_out),
        .io_oeb(io_oeb),

        // Unsupported Inputs
        /// Wishbone
        .wbs_stb_i(1'b0),
        .wbs_cyc_i(1'b0),
        .wbs_we_i(1'b0),
        .wbs_sel_i(4'b0),
        .wbs_dat_i(32'b0),
        .wbs_adr_i(32'b0),

        /// Logic Analyzer
        .la_data_in(128'b0),
        .la_oenb(128'b0),

        /// Alternate clock
        .user_clock2(1'b0)
    );


endmodule