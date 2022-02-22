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

#ifndef _DEF_H_
#define _DEF_H_

#include <stdint.h>
#include <stdbool.h>

#include "csr.h"

// a pointer to this is a null pointer, but the compiler does not
// know that because "sram" is a linker symbol from sections.lds.
extern uint32_t sram;

// Pointer to firmware flash routines
extern uint32_t flashio_worker_begin;
extern uint32_t flashio_worker_end;

// Storage area (MGMT: 0x0100_0000, User: 0x0200_0000)
#define reg_rw_block0  (*(volatile uint32_t*)0x01000000)
#define reg_rw_block1  (*(volatile uint32_t*)0x01100000)
#define reg_ro_block0  (*(volatile uint32_t*)0x02000000)

// UART (0x2000_0000)
//#define reg_uart_clkdiv (*(volatile uint32_t*)0x20000000)
#define reg_uart_data   (*(volatile uint32_t*) CSR_UART_RXTX_ADDR)
#define reg_uart_txfull   (*(volatile uint32_t*) CSR_UART_TXFULL_ADDR)
#define reg_uart_enable (*(volatile uint32_t*) CSR_UART_ENABLED_OUT_ADDR)

// DEBUG (0x2000_0000)
//#define reg_uart_clkdiv (*(volatile uint32_t*)0x20000000)
#define reg_reset   (*(volatile uint32_t*) CSR_CTRL_RESET_ADDR)
#define reg_debug_data   (*(volatile uint32_t*) CSR_DEBUG_RXTX_ADDR)
#define reg_debug_txfull   (*(volatile uint32_t*) CSR_DEBUG_TXFULL_ADDR)
#define reg_debug_irq_en   (*(volatile uint32_t*) CSR_USER_IRQ_3_EV_ENABLE_ADDR)
//#define reg_debug_enable (*(volatile uint32_t*) CSR_UART_ENABLED_OUT_ADDR)

// System Area (0x2F00_0000)
#define reg_power_good    (*(volatile uint32_t*)0x2F000000)
#define reg_clk_out_dest  (*(volatile uint32_t*)0x2F000004)
#define reg_trap_out_dest (*(volatile uint32_t*)0x2F000008)
#define reg_irq_source    (*(volatile uint32_t*)0x2F00000C)

// Bit fields for reg_power_good
#define USER1_VCCD_POWER_GOOD 0x01
#define USER2_VCCD_POWER_GOOD 0x02
#define USER1_VDDA_POWER_GOOD 0x04
#define USER2_VDDA_POWER_GOOD 0x08

// Bit fields for reg_clk_out_dest
#define CLOCK1_MONITOR 0x01
#define CLOCK2_MONITOR 0x02

// Bit fields for reg_irq_source
#define IRQ7_SOURCE 0x01
#define IRQ8_SOURCE 0x02

// --------------------------------------------------------
#endif
