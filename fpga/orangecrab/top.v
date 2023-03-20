module top(
    input clk48,
    input rst_n,

    // inout gpio_0,
    // inout gpio_1,
    // inout gpio_2,
    // inout gpio_5,
    // inout gpio_6,
    // inout gpio_9,
    // inout gpio_10,
    // inout gpio_11,
    // inout gpio_12,
    // inout gpio_13,

    // inout gpio_a0,
    // inout gpio_a1,
    // inout gpio_a2,
    // inout gpio_a3,

    input usr_btn,
    output rgb_led0_r,
    output rgb_led0_g,
    output rgb_led0_b, 

);
    reg rst_i;

    always @ (posedge clk) begin
        rst_i <= ~rst_n; 
    end

    wire trash;

    emulator emu(
        .wb_clk_i(clk48),
        .wb_rst_i(rst_n),

        .io_in({usr_btn, 3'b0}),
        .io_out({trash, rgb_led0_r, rgb_led0_g, rgb_led0_b})
    );
endmodule