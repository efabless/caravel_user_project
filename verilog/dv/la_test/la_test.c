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
	IO Test:
		- Configures MPRJ lower 8-IO pins as outputs
		- Observes counter value through the MPRJ lower 8 IO pins (in the testbench)
*/


   /* wire     la_clk = la_data_in[127]; */
   /* wire     la_reset = la_data_in[126]; */
   /* wire     la_in_load = la_data_in[125]; */
   /* wire     la_sram_load = la_data_in[124]; */
   /* wire     la_global_cs = la_data_in[123]; */
/* * chip_select (4) */
/* * addr0 (16) */
/* * din0 (32) */
/* * csb0 (1) */
/* * web0 (1) */
/* * wmask0 (1) */
/* * addr1 (16) */
/* * din1 (32) */
/* * csb1 (1) */
/* * web1 (1) */
/* * wmask1 (4) */
typedef struct bit_fields {

  unsigned int clk : 1;
  unsigned int rst : 1;
  unsigned int in_load : 1;
  unsigned int sram_load : 1;
  unsigned int cs : 1;

  // unused bits
  unsigned int unused : 15;

  // 112 bits
  unsigned int addr0 : 16;
  unsigned int din0 : 32;
  unsigned int csb0 : 1;
  unsigned int web0 : 1;
  unsigned int wmask0 : 4;

  unsigned int addr1 : 16;
  unsigned int din1 : 32;
  unsigned int csb1 : 1;
  unsigned int web1 : 1;
  unsigned int wmask1 : 4;
} bit_fields_t;

typedef struct word_fields {

  unsigned int word3 : 32;
  unsigned int word2 : 32;
  unsigned int word1 : 32;
  unsigned int word0 : 32;
} word_fields_t;

union packet {
  bit_fields_t bif;
  word_fields_t byf;
};


void main()
{
	reg_spimaster_config = 0xa002;	// Enable, prescaler = 2,
                                        // connect to housekeeping SPI
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


	union packet p;
	p.bif.rst = 0;
	reg_la0_data = p.byf.word0;
	reg_la1_data = p.byf.word1;
	reg_la2_data = p.byf.word2;
	reg_la3_data = p.byf.word3;

	p.bif.rst = 1;
	reg_la0_data = p.byf.word0;
	reg_la1_data = p.byf.word1;
	reg_la2_data = p.byf.word2;
	reg_la3_data = p.byf.word3;

	p.bif.rst = 0;
	reg_la0_data = p.byf.word0;
	reg_la1_data = p.byf.word1;
	reg_la2_data = p.byf.word2;
	reg_la3_data = p.byf.word3;

	p.bif.addr0 = 0x000000001;
	p.bif.din0 = 0xDEADBEEF;
	p.bif.csb0 = 0;
	p.bif.web0 = 0;
	p.bif.csb1 = 1;
	p.bif.web1 = 1;
	reg_la0_data = p.byf.word0;
	reg_la1_data = p.byf.word1;
	reg_la2_data = p.byf.word2;
	reg_la3_data = p.byf.word3;


	// On success, set pin 22 to 1
	reg_mprj_datal = 0xFFFFFFFF;
	/* Apply configuration */
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);

}
