#include <firmware_apis.h>

void main(){
    // Enable managment gpio as output to use as indicator for finishing configuration  
    ManagmentGpio_outputEnable();
    ManagmentGpio_write(0);
    enableHkSpi(0); // disable housekeeping spi
    // configure all gpios as  user out then chenge gpios from 32 to 37 before loading this configurations
    GPIOs_configureAll(GPIO_MODE_USER_STD_OUT_MONITORED);
    GPIOs_configure(32,GPIO_MODE_USER_STD_OUT_MONITORED);
    GPIOs_configure(33,GPIO_MODE_USER_STD_OUT_MONITORED);
    GPIOs_configure(34,GPIO_MODE_USER_STD_OUT_MONITORED);
    GPIOs_configure(35,GPIO_MODE_USER_STD_OUT_MONITORED);
    GPIOs_configure(36,GPIO_MODE_USER_STD_OUT_MONITORED);
    GPIOs_configure(37,GPIO_MODE_USER_STD_OUT_MONITORED);
    GPIOs_loadConfigs(); // load the configuration 
    ManagmentGpio_write(1); // configuration finished 
    // configure la [63:32] as output from cpu
    LogicAnalyzer_write(1,7);
    LogicAnalyzer_outputEnable(1,0);
    ManagmentGpio_write(0); // configuration finished 
    LogicAnalyzer_outputEnable(1,0xFFFFFFFF);
    return;
}