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

#ifndef _SPI_CONTROLS_H_
#define _SPI_CONTROLS_H_

#include <stdint.h>

// Flash Control SPI Configuration (2D00_0000)
#define reg_spictrl (*(volatile uint32_t*)0x2d000000)

// Bit fields for Flash SPI control
#define FLASH_BITBANG_IO0	0x00000001
#define FLASH_BITBANG_IO1	0x00000002
#define FLASH_BITBANG_CLK	0x00000010
#define FLASH_BITBANG_CSB	0x00000020
#define FLASH_BITBANG_OEB0	0x00000100
#define FLASH_BITBANG_OEB1	0x00000200
#define FLASH_ENABLE		0x80000000

// SPI Master Configuration
//#define reg_spimaster_config (*(volatile uint32_t*) 0x24000000)
#define reg_spimaster_control (*(volatile uint32_t*) CSR_SPI_MASTER_CONTROL_ADDR)
#define reg_spimaster_status (*(volatile uint32_t*) CSR_SPI_MASTER_STATUS_ADDR)
//#define reg_spimaster_data   (*(volatile uint32_t*) 0x24000004)
#define reg_spimaster_wdata   (*(volatile uint32_t*) CSR_SPI_MASTER_MOSI_ADDR)
#define reg_spimaster_rdata   (*(volatile uint32_t*) CSR_SPI_MASTER_MISO_ADDR)
#define reg_spimaster_cs   (*(volatile uint32_t*) CSR_SPI_MASTER_CS_ADDR)
#define reg_spimaster_clk_divider   (*(volatile uint32_t*) CSR_SPI_MASTER_CLK_DIVIDER_ADDR)
#define reg_spi_enable (*(volatile uint32_t*) CSR_SPI_ENABLED_OUT_ADDR)

// Bit fields for SPI master configuration
//#define SPI_MASTER_DIV_MASK	0x00ff
//#define SPI_MASTER_MLB		0x0100
//#define SPI_MASTER_INV_CSB	0x0200
//#define SPI_MASTER_INV_CLK	0x0400
//#define SPI_MASTER_MODE_1	0x0800
//#define SPI_MASTER_STREAM	0x1000
//#define SPI_MASTER_ENABLE	0x2000
//#define SPI_MASTER_IRQ_ENABLE	0x4000
//#define SPI_HOUSEKEEPING_CONN	0x8000

#endif
