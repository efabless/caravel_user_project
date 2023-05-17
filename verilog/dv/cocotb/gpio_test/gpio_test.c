#include <common.h> // include required APIs
void main(){
   // Enable managment gpio as output to use as indicator for finishing configuration 
   mgmt_gpio_o_enable();
   mgmt_gpio_wr(0);
   enable_hk_spi(0); // disable housekeeping spi
   //configure_all_gpios(GPIO_MODE_MGMT_STD_OUT);
   configure_all_gpios(GPIO_MODE_MGMT_STD_OUTPUT);
   gpio_config_load();
   set_gpio_l(0x8F);
   mgmt_gpio_wr(1); // configuration finished 

   
   return;
}