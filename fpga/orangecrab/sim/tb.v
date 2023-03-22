`default_nettype wire

module tb;

    reg clk48;
    reg rst_n;

    reg usr_btn;

    top duet(
        .clk48(clk48),
        .rst_n(rst_n),

        .gpio_0(gpio_0),
        .gpio_1(gpio_1),
        .gpio_5(gpio_5),
        .gpio_6(gpio_6),
        .gpio_9(gpio_9),
        .gpio_10(gpio_10),
        .gpio_11(gpio_11),
        .gpio_12(gpio_12),
        .gpio_13(gpio_13),

        .gpio_a0(gpio_a0),
        .gpio_a1(gpio_a1),
        .gpio_a2(gpio_a2),
        .gpio_a3(gpio_a3),

        .usr_btn(usr_btn),
        .rgb_led0_r(rgb_led0_r),
        .rgb_led0_g(rgb_led0_g),
        .rgb_led0_b(rgb_led0_b)
    );

    always #1 clk48 = !clk48;

    initial begin
        $dumpvars(0, tb);
        clk48 = 0;
        usr_btn = 1;
        #1000;
        $finish;
    end

endmodule

`default_nettype none