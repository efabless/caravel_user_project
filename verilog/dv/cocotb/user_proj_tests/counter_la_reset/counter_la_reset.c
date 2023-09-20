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
    ManagmentGpio_write(1); // configuration finished 
    // configure la 65 (reset enable by la) as output from cpu
    // writing 1 in bit 65(second bit in reg 2) to reset 
    LogicAnalyzer_write(2,2);
    LogicAnalyzer_inputEnable(2,0x2);
    LogicAnalyzer_outputEnable(2,0xFFFFFFFD);
    LogicAnalyzer_inputEnable(2,0);
    LogicAnalyzer_outputEnable(2,0xFFFFFFFF);

    return;
}