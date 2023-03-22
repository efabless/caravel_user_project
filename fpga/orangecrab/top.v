module top(
    input clk48,
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

    input usr_btn,
    output rgb_led0_r,
    output rgb_led0_g,
    output rgb_led0_b

);
    localparam reserved_top = 2;
    localparam gpio_msb = `MPRJ_IO_PADS - reserved_top - 1;
    reg rst_i;

    always @ (posedge clk48) begin
        rst_i <= ~rst_n; 
    end

    wire[gpio_msb:0] io_in;
    wire[gpio_msb:0] io_out;
    wire[gpio_msb:0] io_oeb;

    BB tristate[gpio_msb:0] (
        .I(io_out),
        .O(io_in),
        .T(~io_oeb),
        .B({
            gpio_0,
            gpio_1,
            gpio_5,
            gpio_6,
            gpio_9,
            gpio_10,
            gpio_11,
            gpio_12,
            gpio_13,

            gpio_a0,
            gpio_a1,
            gpio_a2,
            gpio_a3
        })
    );


    wire _; // For ignored output
    wire led;
    emulator emu(
        .wb_clk_i(clk48),
        .wb_rst_i(rst_n),

        .io_in({usr_btn, 1'b0, io_in}),
        .io_out({_, led, io_out}),
        .io_oeb({_, _, io_oeb})
    );
    assign rgb_led0_r = led;
    assign rgb_led0_g = led;
    assign rgb_led0_b = led;
endmodule