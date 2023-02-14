#include <common.c>

void main(){
    // Enable managment gpio as output to use as indicator for finishing configuration  
    mgmt_gpio_o_enable();
    mgmt_gpio_wr(0);
    hk_spi_disable(); // disable housekeeping spi
    // configure all gpios as  user out then chenge gpios from 32 to 37 before loading this configurations
    configure_all_gpios(GPIO_MODE_USER_STD_OUT_MONITORED);
    configure_gpio(32,GPIO_MODE_MGMT_STD_OUTPUT);
    configure_gpio(33,GPIO_MODE_MGMT_STD_OUTPUT);
    configure_gpio(34,GPIO_MODE_MGMT_STD_OUTPUT);
    configure_gpio(35,GPIO_MODE_MGMT_STD_OUTPUT);
    configure_gpio(36,GPIO_MODE_MGMT_STD_OUTPUT);
    configure_gpio(37,GPIO_MODE_MGMT_STD_OUTPUT);
    gpio_config_load(); // load the configuration 
    // configure la 64 (clk enable by la) as output from cpu
    // writing 1 in bit 64(first bit in reg 2) to reset 
    set_la_reg(2,0);
    set_la_ien(2,0x1);
    set_la_oenb(2,0x1);
    mgmt_gpio_wr(1); // configuration finished 

    for (int i = 0; i < 7; i++){
        set_la_reg(2,1); // clk pose edge
        mgmt_gpio_wr(0); 
        set_la_reg(2,0);// clk pose edge
        mgmt_gpio_wr(1); 
        }
    


    return;
}