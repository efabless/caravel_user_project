`default_nettype wire
`timescale 1ns/1ns

module tb;
    reg clk;
    reg rst_n;

    reg usr_btn;

    top duet(
        .clk(clk),
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
        .gpio_a4(gpio_a4),
        .gpio_a5(gpio_a5),
        .gpio_sck(gpio_sck),
        .gpio_mosi(gpio_mosi),
        .gpio_miso(gpio_miso),
        .gpio_scl(gpio_scl),
        .gpio_sda(gpio_sda),

        .usr_btn(usr_btn),
        .rgb_led0_r(rgb_led0_r),
        .rgb_led0_g(rgb_led0_g),
        .rgb_led0_b(rgb_led0_b)
    );

    always #1 clk = !clk;

    initial begin
        $dumpvars(0, tb);
        rst_n = 0;
        clk = 0;
        usr_btn = 1;
        #100;
        rst_n = 1;
        #1000;
        $finish;
    end

endmodule

`default_nettype none