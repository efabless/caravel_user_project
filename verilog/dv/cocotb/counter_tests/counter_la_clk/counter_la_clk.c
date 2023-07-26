#include <firmware_apis.h>

void main(){
    // Enable managment gpio as output to use as indicator for finishing configuration  
    ManagmentGpio_outputEnable();
    ManagmentGpio_write(0);
    enableHkSpi(0); // disable housekeeping spi
    // configure all gpios as  user out then chenge gpios from 32 to 37 before loading this configurations
    GPIOs_configureAll(GPIO_MODE_USER_STD_OUT_MONITORED);
    GPIOs_configure(32,GPIO_MODE_MGMT_STD_OUTPUT);
    GPIOs_configure(33,GPIO_MODE_MGMT_STD_OUTPUT);
    GPIOs_configure(34,GPIO_MODE_MGMT_STD_OUTPUT);
    GPIOs_configure(35,GPIO_MODE_MGMT_STD_OUTPUT);
    GPIOs_configure(36,GPIO_MODE_MGMT_STD_OUTPUT);
    GPIOs_configure(37,GPIO_MODE_MGMT_STD_OUTPUT);
    GPIOs_loadConfigs(); // load the configuration 
    // configure la 64 (clk enable by la) as output from cpu
    // writing 1 in bit 64(first bit in reg 2) to reset 
    LogicAnalyzer_write(2,0);
    LogicAnalyzer_inputEnable(2,0x1);
    LogicAnalyzer_outputEnable(2,0xFFFFFFFE);
    ManagmentGpio_write(1); // configuration finished 

    for (int i = 0; i < 7; i++){
        LogicAnalyzer_write(2,1); // clk pose edge
        ManagmentGpio_write(0); 
        LogicAnalyzer_write(2,0);// clk pose edge
        ManagmentGpio_write(1); 
        }
    return;
}