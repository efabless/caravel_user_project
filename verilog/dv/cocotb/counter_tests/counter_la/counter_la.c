#include <common.h>

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
    mgmt_gpio_wr(1); // configuration finished 
    // configure la [63:32] as output from cpu
    set_la_reg(1,7);
    set_la_ien(1,0xFFFFFFF);
    set_la_oen(1,0);
    set_la_ien(1,0);
    set_la_oen(1,0xFFFFFFF);

    return;
}