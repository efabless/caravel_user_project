module top(
    input clk,
    input rst_n,

    inout gpio_0,
    inout gpio_1,
    inout gpio_5,
    inout gpio_6,
    inout gpio_9,
    inout gpio_10,
    inout gpio_11,
    inout gpio_12,
    inout gpio_13,
    inout gpio_a0,
    inout gpio_a1,
    inout gpio_a2,
    inout gpio_a3,
    inout gpio_a4,
    inout gpio_a5,
    inout gpio_sck,
    inout gpio_mosi,
    inout gpio_miso,
    inout gpio_scl,
    inout gpio_sda,

    input usr_btn,
    output rgb_led0_r,
    output rgb_led0_g,
    output rgb_led0_b

);
    localparam reserved_top = 2;
    localparam gpio_msb = `FPGA_AVAILABLE_IO - reserved_top - 1;
    localparam remaining = `MPRJ_IO_PADS - `FPGA_AVAILABLE_IO;

    wire rst_i = ~rst_n;

    wire[gpio_msb:0] io_in;
    wire[gpio_msb:0] io_out;
    wire[gpio_msb:0] io_oeb;
    wire[remaining-1:0] io_in_rem = {remaining{1'b0}};
    wire[remaining-1:0] io_out_rem;
    wire[remaining-1:0] io_oeb_rem;

    BB tristate[gpio_msb:0] (
        .I(io_out),
        .O(io_in),
        .T(~io_oeb),
        .B({
            gpio_sda,
            gpio_scl,
            gpio_miso,
            gpio_mosi,
            gpio_sck,
            gpio_a5,
            gpio_a4,
            gpio_a3,
            gpio_a2,
            gpio_a1,
            gpio_a0,
            gpio_13,
            gpio_12,
            gpio_11,
            gpio_10,
            gpio_9,
            gpio_6,
            gpio_5,
            gpio_1,
            gpio_0
        })
    );


    wire _; // For ignored output
    wire led;
    caravel_fpga emu(
        .wb_clk_i(clk),
        .wb_rst_i(rst_i),

        .io_in({usr_btn, 1'b0, io_in_rem, io_in}),
        .io_out({_, led, io_out_rem, io_out}),
        .io_oeb({ _, _, io_oeb_rem,io_oeb})
    );
    assign rgb_led0_r = led;
    assign rgb_led0_g = led;
    assign rgb_led0_b = led;
endmodule