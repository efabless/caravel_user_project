#include <common.h>

void main(){
    mgmt_gpio_wr(0);
    mgmt_gpio_o_enable();
    configure_gpio(6,GPIO_MODE_MGMT_STD_OUTPUT);
    gpio_config_load();
    uart_TX_enable();
    mgmt_gpio_wr(1); // configuration finished 

    print("Hello World\n");
    return;
}