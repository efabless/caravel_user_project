#include <firmware_apis.h>

void main(){
    ManagmentGpio_write(0);
    ManagmentGpio_outputEnable();
    GPIOs_configure(6,GPIO_MODE_MGMT_STD_OUTPUT);
    GPIOs_loadConfigs();
    UART_enableTX(1);
    ManagmentGpio_write(1); // configuration finished 

    print("Hello World\n");
    return;
}