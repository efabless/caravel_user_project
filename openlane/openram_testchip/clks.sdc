create_clock [get_ports la_clk_]  -name la_clk  -period 10
create_clock [get_ports gpio_clk]  -name gpio_clk  -period 10
set_clock_groups -asynchronous \
   -group [get_clocks {la_clk}] \
   -group [get_clocks {gpio_clk}]
