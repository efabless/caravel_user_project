#include <common.h>

void main(){
    // Enable managment gpio as output to use as indicator for finishing configuration  
    mgmt_gpio_o_enable();
    mgmt_gpio_wr(0);
    enable_hk_spi(0); // disable housekeeping spi
    // configure all gpios as  user out then chenge gpios from 32 to 37 before loading this configurations
    configure_all_gpios(GPIO_MODE_USER_STD_OUT_MONITORED);
    configure_gpio(32,GPIO_MODE_USER_STD_OUT_MONITORED);
    configure_gpio(33,GPIO_MODE_USER_STD_OUT_MONITORED);
    configure_gpio(34,GPIO_MODE_USER_STD_OUT_MONITORED);
    configure_gpio(35,GPIO_MODE_USER_STD_OUT_MONITORED);
    configure_gpio(36,GPIO_MODE_USER_STD_OUT_MONITORED);
    configure_gpio(37,GPIO_MODE_USER_STD_OUT_MONITORED);
    gpio_config_load(); // load the configuration 
    enable_user_interface(); // this necessary when reading or writing between wishbone and user project if interface isn't enabled no ack would be recieve and the command will be stuck
    mgmt_gpio_wr(1); // configuration finished 

    // writing to any address inside user project address space would reload the counter value
    write_user_double_word(0x7,0x88);
    mgmt_gpio_wr(0); // start counting from 0

    return;
}