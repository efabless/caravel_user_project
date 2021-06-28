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

// This include is relative to $CARAVEL_PATH (see Makefile)
#include "verilog/dv/caravel/defs.h"
#include "verilog/dv/caravel/stub.c"

/*
	GPIO Test:
		- Reads to and writes from each SRAM
		- Uses Logic Analyzer interface for communication between SRAMs and CPU
*/

void main()
{
	/*
	IO Control Registers
	| DM     | VTRIP | SLOW  | AN_POL | AN_SEL | AN_EN | MOD_SEL | INP_DIS | HOLDH | OEB_N | MGMT_EN |
	| 3-bits | 1-bit | 1-bit | 1-bit  | 1-bit  | 1-bit | 1-bit   | 1-bit   | 1-bit | 1-bit | 1-bit   |

	Output: 0000_0110_0000_1110  (0x1808) = GPIO_MODE_USER_STD_OUTPUT
	| DM     | VTRIP | SLOW  | AN_POL | AN_SEL | AN_EN | MOD_SEL | INP_DIS | HOLDH | OEB_N | MGMT_EN |
	| 110    | 0     | 0     | 0      | 0      | 0     | 0       | 1       | 0     | 0     | 0       |


	Input: 0000_0001_0000_1111 (0x0402) = GPIO_MODE_USER_STD_INPUT_NOPULL
	| DM     | VTRIP | SLOW  | AN_POL | AN_SEL | AN_EN | MOD_SEL | INP_DIS | HOLDH | OEB_N | MGMT_EN |
	| 001    | 0     | 0     | 0      | 0      | 0     | 0       | 0       | 0     | 1     | 0       |

	*/

	/* Set up the housekeeping SPI to be connected internally so	*/
	/* that external pin changes don't affect it.			*/

	reg_spimaster_config = 0xa002;	// Enable, prescaler = 2,
                                        // connect to housekeeping SPI

	// This is to signal when the code is done to the test bench
	reg_mprj_io_0 = GPIO_MODE_MGMT_STD_OUTPUT;

	reg_mprj_io_15 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_16 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_17 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_18 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_19 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_20 =  GPIO_MODE_USER_STD_INPUT_NOPULL;
	reg_mprj_io_21 =  GPIO_MODE_USER_STD_INPUT_NOPULL;

	// Configure Pin 22 as user output
	// Observe counter value in the testbench
	reg_mprj_io_22 =  GPIO_MODE_USER_STD_OUTPUT;


	// Configure LA probes as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0x00000000;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]
	reg_la0_data = 0x00000000;
	reg_la1_data = 0x00000000;
	reg_la2_data = 0x00000000;
	reg_la3_data = 0x00000000;

	// Set bit 0 when done
	reg_mprj_datal = 0x00000001;

	/* Apply configuration */
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);

}
