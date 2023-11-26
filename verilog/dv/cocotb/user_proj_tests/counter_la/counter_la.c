// SPDX-FileCopyrightText: 2023 Efabless Corporation

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//      http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


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
    #ifdef GF
    LogicAnalyzer_write(1,7<<14);
    LogicAnalyzer_outputEnable(1,0xC0000000);
    #else
    LogicAnalyzer_write(1,7<<16);
    LogicAnalyzer_outputEnable(1,0);
    #endif // GF
    ManagmentGpio_write(0); // configuration finished 
    LogicAnalyzer_outputEnable(1,0xFFFFFFFF);
    return;
}