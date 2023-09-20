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

// SPDX-License-Identifier: Apache-2.0




#include <firmware_apis.h> // include required APIs
void main(){
   // Enable managment gpio as output to use as indicator for finishing configuration 
   ManagmentGpio_outputEnable();
   ManagmentGpio_write(0);
   enableHkSpi(0); // disable housekeeping spi
   //GPIOs_configureAll(GPIO_MODE_MGMT_STD_OUT);
   GPIOs_configureAll(GPIO_MODE_MGMT_STD_OUTPUT);
   GPIOs_loadConfigs();
   set_gpio_l(0x8F);
   ManagmentGpio_write(1); // configuration finished 

   
   return;
}