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

#ifndef _UART_CONTROLS_H_
#define _UART_CONTROLS_H_

#include <stdint.h>
#include "csr.h"

// UART (0x2000_0000)
//#define reg_uart_clkdiv (*(volatile uint32_t*)0x20000000)
#define reg_uart_data   (*(volatile uint32_t*) CSR_UART_RXTX_ADDR)
#define reg_uart_txfull   (*(volatile uint32_t*) CSR_UART_TXFULL_ADDR)
#define reg_uart_enable (*(volatile uint32_t*) CSR_UART_ENABLED_OUT_ADDR)

#endif
