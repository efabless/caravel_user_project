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

#ifndef _USER_PROJECT_CONTROLS_H_
#define _USER_PROJECT_CONTROLS_H_

#include <stdint.h>

// User Project Slaves (0x3000_0000)
#define reg_mprj_slave (*(volatile uint32_t*)0x30000000)
#define reg_wb_enable	  (*(volatile uint32_t*)0xf0003800)

// User Project Control (0x2300_0000)
#define reg_mprj_xfer (*(volatile uint32_t*)0x26000000)
#define reg_mprj_pwr  (*(volatile uint32_t*)0x26000004)
#define reg_mprj_irq  (*(volatile uint32_t*)0x26000008)
#define reg_mprj_datal (*(volatile uint32_t*)0x2600000c)
#define reg_mprj_datah (*(volatile uint32_t*)0x26000010)

#define reg_mprj_io_0 (*(volatile uint32_t*)0x26000024)
#define reg_mprj_io_1 (*(volatile uint32_t*)0x26000028)
#define reg_mprj_io_2 (*(volatile uint32_t*)0x2600002c)
#define reg_mprj_io_3 (*(volatile uint32_t*)0x26000030)
#define reg_mprj_io_4 (*(volatile uint32_t*)0x26000034)
#define reg_mprj_io_5 (*(volatile uint32_t*)0x26000038)
#define reg_mprj_io_6 (*(volatile uint32_t*)0x2600003c)
#define reg_mprj_io_7 (*(volatile uint32_t*)0x26000040)
#define reg_mprj_io_8 (*(volatile uint32_t*)0x26000044)
#define reg_mprj_io_9 (*(volatile uint32_t*)0x26000048)
#define reg_mprj_io_10 (*(volatile uint32_t*)0x2600004c)
#define reg_mprj_io_11 (*(volatile uint32_t*)0x26000050)
#define reg_mprj_io_12 (*(volatile uint32_t*)0x26000054)
#define reg_mprj_io_13 (*(volatile uint32_t*)0x26000058)
#define reg_mprj_io_14 (*(volatile uint32_t*)0x2600005c)
#define reg_mprj_io_15 (*(volatile uint32_t*)0x26000060)
#define reg_mprj_io_16 (*(volatile uint32_t*)0x26000064)
#define reg_mprj_io_17 (*(volatile uint32_t*)0x26000068)
#define reg_mprj_io_18 (*(volatile uint32_t*)0x2600006c)
#define reg_mprj_io_19 (*(volatile uint32_t*)0x26000070)
#define reg_mprj_io_20 (*(volatile uint32_t*)0x26000074)
#define reg_mprj_io_21 (*(volatile uint32_t*)0x26000078)
#define reg_mprj_io_22 (*(volatile uint32_t*)0x2600007c)
#define reg_mprj_io_23 (*(volatile uint32_t*)0x26000080)
#define reg_mprj_io_24 (*(volatile uint32_t*)0x26000084)
#define reg_mprj_io_25 (*(volatile uint32_t*)0x26000088)
#define reg_mprj_io_26 (*(volatile uint32_t*)0x2600008c)
#define reg_mprj_io_27 (*(volatile uint32_t*)0x26000090)
#define reg_mprj_io_28 (*(volatile uint32_t*)0x26000094)
#define reg_mprj_io_29 (*(volatile uint32_t*)0x26000098)
#define reg_mprj_io_30 (*(volatile uint32_t*)0x2600009c)
#define reg_mprj_io_31 (*(volatile uint32_t*)0x260000a0)
#define reg_mprj_io_32 (*(volatile uint32_t*)0x260000a4)
#define reg_mprj_io_33 (*(volatile uint32_t*)0x260000a8)
#define reg_mprj_io_34 (*(volatile uint32_t*)0x260000ac)
#define reg_mprj_io_35 (*(volatile uint32_t*)0x260000b0)
#define reg_mprj_io_36 (*(volatile uint32_t*)0x260000b4)
#define reg_mprj_io_37 (*(volatile uint32_t*)0x260000b8)


#endif
