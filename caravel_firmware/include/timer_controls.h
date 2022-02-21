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

#ifndef _TIMER_CONTROLS_H_
#define _TIMER_CONTROLS_H_

#include <stdint.h>

// Counter-Timer 0 Configuration
#define reg_timer0_config (*(volatile uint32_t*) CSR_TIMER0_EN_ADDR)
#define reg_timer0_update  (*(volatile uint32_t*) CSR_TIMER0_UPDATE_VALUE_ADDR)
#define reg_timer0_value  (*(volatile uint32_t*) CSR_TIMER0_VALUE_ADDR)
#define reg_timer0_data   (*(volatile uint32_t*) CSR_TIMER0_LOAD_ADDR)
#define reg_timer0_irq_en   (*(volatile uint32_t*) CSR_TIMER0_EV_ENABLE_ADDR)

// Counter-Timer 1 Configuration
#define reg_timer1_config (*(volatile uint32_t*)0x23000000)
#define reg_timer1_value  (*(volatile uint32_t*)0x23000004)
#define reg_timer1_data   (*(volatile uint32_t*)0x23000008)

// Bit fields for Counter-timer configuration
#define TIMER_ENABLE		0x01
#define TIMER_ONESHOT		0x02
#define TIMER_UPCOUNT		0x04
#define TIMER_CHAIN		0x08
#define TIMER_IRQ_ENABLE	0x10

#endif
