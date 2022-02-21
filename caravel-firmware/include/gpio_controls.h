/*
 * SPDX-FileCopyrightText: 2020 Efabless Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * SPDX-License-Identifier: Apache-2.0
 */

#ifndef _GPIO_CONTROLS_H_
#define _GPIO_CONTROLS_H_

#include <stdint.h>

// GPIO (0x2100_0000)
#define reg_gpio_mode1  (*(volatile uint32_t*) CSR_GPIO_MODE1_ADDR)
#define reg_gpio_mode0  (*(volatile uint32_t*) CSR_GPIO_MODE0_ADDR)
#define reg_gpio_ien    (*(volatile uint32_t*) CSR_GPIO_IEN_ADDR)
#define reg_gpio_oe     (*(volatile uint32_t*) CSR_GPIO_OE_ADDR)
#define reg_gpio_in     (*(volatile uint32_t*) CSR_GPIO_IN_ADDR)
#define reg_gpio_out    (*(volatile uint32_t*) CSR_GPIO_OUT_ADDR)
//#define reg_gpio_pu   (*(volatile uint32_t*)0x21000008)
//#define reg_gpio_pd   (*(volatile uint32_t*)0x2100000c)

// Individual bit fields for the GPIO pad control
#define MGMT_ENABLE	  0x0001
#define OUTPUT_DISABLE	  0x0002
#define HOLD_OVERRIDE	  0x0004
#define INPUT_DISABLE	  0x0008
#define MODE_SELECT	  0x0010
#define ANALOG_ENABLE	  0x0020
#define ANALOG_SELECT	  0x0040
#define ANALOG_POLARITY	  0x0080
#define SLOW_SLEW_MODE	  0x0100
#define TRIPPOINT_SEL	  0x0200
#define DIGITAL_MODE_MASK 0x1c00

// Useful GPIO mode values
#define GPIO_MODE_MGMT_STD_INPUT_NOPULL    0x0403
#define GPIO_MODE_MGMT_STD_INPUT_PULLDOWN  0x0803
#define GPIO_MODE_MGMT_STD_INPUT_PULLUP	   0x0c03
#define GPIO_MODE_MGMT_STD_OUTPUT	   0x1809
#define GPIO_MODE_MGMT_STD_BIDIRECTIONAL   0x1801
#define GPIO_MODE_MGMT_STD_ANALOG   	   0x000b

#define GPIO_MODE_USER_STD_INPUT_NOPULL	   0x0402
#define GPIO_MODE_USER_STD_INPUT_PULLDOWN  0x0802
#define GPIO_MODE_USER_STD_INPUT_PULLUP	   0x0c02
#define GPIO_MODE_USER_STD_OUTPUT	   0x1808
#define GPIO_MODE_USER_STD_BIDIRECTIONAL   0x1800
#define GPIO_MODE_USER_STD_OUT_MONITORED   0x1802
#define GPIO_MODE_USER_STD_ANALOG   	   0x000a

#endif
