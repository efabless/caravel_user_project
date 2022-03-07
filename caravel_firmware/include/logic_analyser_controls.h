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

#ifndef _LOGIC_ANALYSER_CONTROLS_H_
#define _LOGIC_ANALYSER_CONTROLS_H_

#include <stdint.h>
#include "csr.h"

// Logic Analyzer (0x2200_0000)
#define reg_la3_data (*(volatile uint32_t*) CSR_LA_OUT_ADDR)
#define reg_la2_data (*(volatile uint32_t*) (CSR_LA_OUT_ADDR + 4))
#define reg_la1_data (*(volatile uint32_t*) (CSR_LA_OUT_ADDR + 8))
#define reg_la0_data (*(volatile uint32_t*) (CSR_LA_OUT_ADDR + 12))

#define reg_la3_data_in (*(volatile uint32_t*) CSR_LA_IN_ADDR)
#define reg_la2_data_in (*(volatile uint32_t*) (CSR_LA_IN_ADDR + 4))
#define reg_la1_data_in (*(volatile uint32_t*) (CSR_LA_IN_ADDR + 8))
#define reg_la0_data_in (*(volatile uint32_t*) (CSR_LA_IN_ADDR + 12))

#define reg_la3_oenb (*(volatile uint32_t*) CSR_LA_OE_ADDR)
#define reg_la2_oenb (*(volatile uint32_t*) (CSR_LA_OE_ADDR + 4))
#define reg_la1_oenb (*(volatile uint32_t*) (CSR_LA_OE_ADDR + 8))
#define reg_la0_oenb (*(volatile uint32_t*) (CSR_LA_OE_ADDR + 12))

#define reg_la3_iena (*(volatile uint32_t*) CSR_LA_IEN_ADDR)
#define reg_la2_iena (*(volatile uint32_t*) (CSR_LA_IEN_ADDR + 4))
#define reg_la1_iena (*(volatile uint32_t*) (CSR_LA_IEN_ADDR + 8))
#define reg_la0_iena (*(volatile uint32_t*) (CSR_LA_IEN_ADDR + 12))

#define reg_la_sample (*(volatile uint32_t*)0x25000030)

#endif
