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
	LA Test:
		- Reads to and writes from each SRAM
		- Uses Logic Analyzer interface for communication between SRAMs and CPU
*/

typedef struct bit_fields {

  unsigned int clk : 1;
  unsigned int rst : 1;
  unsigned int in_load : 1;
  unsigned int sram_load : 1;
  unsigned int la_gcs : 1;

  // unused bits
  unsigned int unused : 11;

  // 112 bits
  unsigned int cs : 4;
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
  bit_fields_t bf;
  word_fields_t wf;
};

int clk = 0;
int i;

void main()
{
	reg_spimaster_config = 0xa002;	// Enable, prescaler = 2,
                                        // connect to housekeeping SPI

	// This is to signal when the code is ready to the test bench
	reg_mprj_io_0 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_1 = GPIO_MODE_MGMT_STD_OUTPUT;

	/* Apply configuration */
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);

	// Configure LA probes as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0x00000000;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]
	
	// To start, set pin 0 to 1
	reg_mprj_datal = 0x00000001;

	/* DUAL PORT MEMORIES */

	//SRAM 0
	// Write 1 to address 1
	// Send input packet
	reg_la3_data = 0xA0000000;
	reg_la2_data = 0x10000000;
	reg_la1_data = 0x13C00000;
	reg_la0_data = 0x00000030;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20000000;
	reg_la3_data = 0xA0000000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x08000000;
	reg_la3_data = 0x80000000;

	// Write 2 to address 2
	// Send input packet
	reg_la3_data = 0xA0000000;
	reg_la2_data = 0x20000000;
	reg_la1_data = 0x23C00000;
	reg_la0_data = 0x00000030;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20000000;
	reg_la3_data = 0xA0000000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x08000000;
	reg_la3_data = 0x80000000;

	// Read back data
	// Send input packet
	reg_la3_data = 0xA0000000;
	reg_la2_data = 0x20000000;
	reg_la1_data = 0x04000040;
	reg_la0_data = 0x00000010;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20000000;
	reg_la3_data = 0xA0000000;
	
	// Toggle clock to read SRAM
	reg_la3_data = 0x08000000;
	reg_la3_data = 0x80000000;

	// Toggle clock to store into dout FF
	reg_la3_data = 0x00000000;
	reg_la3_data = 0x80000000;

	// Toggle clock to replace din with dout
	reg_la3_data = 0x10000000;
	reg_la3_data = 0x90000000;

	// Read from the LA
	// This will trigger a sample of the LA bits to read
	// Configure LA probes as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0xFFFFFFFF;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0xFFFFFFFF;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0xFFFFFFFF;    // [127:96]
	
	reg_la_sample = 1;
	// Now read them
	if(reg_la0_data != 0x00000050){
		reg_mprj_datal = 0x00000003;
	}

	// Configure LA as CPU output
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0x00000000;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]

	//SRAM 1
	// Write 1 to address 1
	// Send input packet
	reg_la3_data = 0xA0001000;
	reg_la2_data = 0x10000000;
	reg_la1_data = 0x13C00000;
	reg_la0_data = 0x00000030;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20001000;
	reg_la3_data = 0xA0001000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x08001000;
	reg_la3_data = 0x80001000;

	// Write 2 to address 2
	// Send input packet
	reg_la3_data = 0xA0001000;
	reg_la2_data = 0x20000000;
	reg_la1_data = 0x23C00000;
	reg_la0_data = 0x00000030;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20001000;
	reg_la3_data = 0xA0001000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x08001000;
	reg_la3_data = 0x80001000;

	// Read back data
	// Send input packet
	reg_la3_data = 0xA0001000;
	reg_la2_data = 0x20000000;
	reg_la1_data = 0x04000040;
	reg_la0_data = 0x00000010;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20001000;
	reg_la3_data = 0xA0001000;
	
	// Toggle clock to read SRAM
	reg_la3_data = 0x08001000;
	reg_la3_data = 0x80001000;

	// Toggle clock to store into dout FF
	reg_la3_data = 0x00001000;
	reg_la3_data = 0x80001000;

	// Toggle clock to replace din with dout
	reg_la3_data = 0x100001000;
	reg_la3_data = 0x900001000;

	// Read from the LA
	// This will trigger a sample of the LA bits to read
	// Configure LA probes as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0xFFFFFFFF;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0xFFFFFFFF;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0xFFFFFFFF;    // [127:96]
	
	reg_la_sample = 1;
	// Now read them
	if(reg_la0_data != 0x00000050){
		reg_mprj_datal = 0x00000001;
	}

	// Configure LA as CPU output
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0x00000000;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]

	// SRAM 2
	// Write 1 to address 1
	// Send input packet
	reg_la3_data = 0xA0002000;
	reg_la2_data = 0x10000000;
	reg_la1_data = 0x13C00000;
	reg_la0_data = 0x00000030;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20002000;
	reg_la3_data = 0xA0002000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x08002000;
	reg_la3_data = 0x80002000;

	// Write 2 to address 2
	// Send input packet
	reg_la3_data = 0xA0002000;
	reg_la2_data = 0x20000000;
	reg_la1_data = 0x23C00000;
	reg_la0_data = 0x00000030;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20002000;
	reg_la3_data = 0xA0002000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x08002000;
	reg_la3_data = 0x80002000;

	// Read back data
	// Send input packet
	reg_la3_data = 0xA0002000;
	reg_la2_data = 0x20000000;
	reg_la1_data = 0x04000040;
	reg_la0_data = 0x00000010;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20002000;
	reg_la3_data = 0xA0002000;
	
	// Toggle clock to read SRAM
	reg_la3_data = 0x08002000;
	reg_la3_data = 0x80002000;

	// Toggle clock to store into dout FF
	reg_la3_data = 0x00002000;
	reg_la3_data = 0x80002000;

	// Toggle clock to replace din with dout
	reg_la3_data = 0x100002000;
	reg_la3_data = 0x900002000;

	// Read from the LA
	// This will trigger a sample of the LA bits to read
	// Configure LA probes as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0xFFFFFFFF;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0xFFFFFFFF;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0xFFFFFFFF;    // [127:96]
	
	reg_la_sample = 1;
	// Now read them
	if(reg_la0_data != 0x00000050){
		reg_mprj_datal = 0x00000003;
	}

	// Configure LA as CPU output
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0x00000000;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]

	// SRAM 3
	// Write 1 to address 1
	// Send input packet
	reg_la3_data = 0xA0003000;
	reg_la2_data = 0x10000000;
	reg_la1_data = 0x13C00000;
	reg_la0_data = 0x00000030;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20003000;
	reg_la3_data = 0xA0003000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x08003000;
	reg_la3_data = 0x80003000;

	// Write 2 to address 2
	// Send input packet
	reg_la3_data = 0xA0003000;
	reg_la2_data = 0x20000000;
	reg_la1_data = 0x23C00000;
	reg_la0_data = 0x00000030;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20003000;
	reg_la3_data = 0xA0003000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x08003000;
	reg_la3_data = 0x80003000;

	// Read back data
	// Send input packet
	reg_la3_data = 0xA0003000;
	reg_la2_data = 0x20000000;
	reg_la1_data = 0x04000040;
	reg_la0_data = 0x00000010;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20003000;
	reg_la3_data = 0xA0003000;
	
	// Toggle clock to read SRAM
	reg_la3_data = 0x08003000;
	reg_la3_data = 0x80003000;

	// Toggle clock to store into dout FF
	reg_la3_data = 0x00003000;
	reg_la3_data = 0x80003000;

	// Toggle clock to replace din with dout
	reg_la3_data = 0x100003000;
	reg_la3_data = 0x900003000;

	// Read from the LA
	// This will trigger a sample of the LA bits to read
	// Configure LA probes as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0xFFFFFFFF;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0xFFFFFFFF;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0xFFFFFFFF;    // [127:96]
	
	reg_la_sample = 1;
	// Now read them
	if(reg_la0_data != 0x00000050){
		reg_mprj_datal = 0x00000001;
	}

	// Configure LA as CPU output
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0x00000000;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]

	// SRAM 4
	// Write 1 to address 1
	// Send input packet
	reg_la3_data = 0xA0004000;
	reg_la2_data = 0x10000000;
	reg_la1_data = 0x13C00000;
	reg_la0_data = 0x00000030;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20004000;
	reg_la3_data = 0xA0004000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x08004000;
	reg_la3_data = 0x80004000;

	// Write 2 to address 2
	// Send input packet
	reg_la3_data = 0xA0004000;
	reg_la2_data = 0x20000000;
	reg_la1_data = 0x23C00000;
	reg_la0_data = 0x00000030;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20004000;
	reg_la3_data = 0xA0004000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x08004000;
	reg_la3_data = 0x80004000;

	// Read back data
	// Send input packet
	reg_la3_data = 0xA0004000;
	reg_la2_data = 0x20000000;
	reg_la1_data = 0x04000040;
	reg_la0_data = 0x00000010;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20004000;
	reg_la3_data = 0xA0004000;
	
	// Toggle clock to read SRAM
	reg_la3_data = 0x08004000;
	reg_la3_data = 0x80004000;

	// Toggle clock to store into dout FF
	reg_la3_data = 0x00004000;
	reg_la3_data = 0x80004000;

	// Toggle clock to replace din with dout
	reg_la3_data = 0x100004000;
	reg_la3_data = 0x900004000;

	// Read from the LA
	// This will trigger a sample of the LA bits to read
	// Configure LA probes as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0xFFFFFFFF;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0xFFFFFFFF;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0xFFFFFFFF;    // [127:96]
	
	reg_la_sample = 1;
	// Now read them
	if(reg_la0_data != 0x00000050){
		reg_mprj_datal = 0x00000003;
	}

	// Configure LA as CPU output
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0x00000000;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]

	/* SINGLE PORT MEMORIES */
	// SRAM 8
	// Write DEADBEEF to address 1
	// Send input packet
	reg_la3_data = 0xA0008000;
	reg_la2_data = 0x1DEADBEE;
	reg_la1_data = 0xF3C00000;
	reg_la0_data = 0x00000000;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20008000;
	reg_la3_data = 0xA0008000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x08008000;
	reg_la3_data = 0x80008000;

	// Read back data
	// Send input packet
	reg_la3_data = 0xA0008000;
	reg_la2_data = 0x10000000;
	reg_la1_data = 0x04000000;
	reg_la0_data = 0x00000000;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20008000;
	reg_la3_data = 0xA0008000;
	
	// Toggle clock to read SRAM
	reg_la3_data = 0x08008000;
	reg_la3_data = 0x80008000;

	// Toggle clock to store into dout FF
	reg_la3_data = 0x00008000;
	reg_la3_data = 0x80008000;

	// Toggle clock to replace din with dout
	reg_la3_data = 0x100008000;
	reg_la3_data = 0x900008000;

	// Read from the LA
	// This will trigger a sample of the LA bits to read
	// Configure LA probes as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0xFFFFFFFF;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0xFFFFFFFF;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0xFFFFFFFF;    // [127:96]
	
	reg_la_sample = 1;
	// Now read them
	if(reg_la2_data != 0x1DEADBEE){
		reg_mprj_datal = 0x00000001;
	}

	// Configure LA as CPU output
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0x00000000;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]

	// SRAM 9
	// Write DEADBEEF to address 1
	// Send input packet
	reg_la3_data = 0xA0009000;
	reg_la2_data = 0x1DEADBEE;
	reg_la1_data = 0xF3C00000;
	reg_la0_data = 0x00000000;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20009000;
	reg_la3_data = 0xA0009000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x08009000;
	reg_la3_data = 0x80009000;

	// Read back data
	// Send input packet
	reg_la3_data = 0xA0009000;
	reg_la2_data = 0x10000000;
	reg_la1_data = 0x04000000;
	reg_la0_data = 0x00000000;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x20009000;
	reg_la3_data = 0xA0009000;
	
	// Toggle clock to read SRAM
	reg_la3_data = 0x08009000;
	reg_la3_data = 0x80009000;

	// Toggle clock to store into dout FF
	reg_la3_data = 0x00009000;
	reg_la3_data = 0x80009000;

	// Toggle clock to replace din with dout
	reg_la3_data = 0x100009000;
	reg_la3_data = 0x900009000;

	// Read from the LA
	// This will trigger a sample of the LA bits to read
	// Configure LA probes as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0xFFFFFFFF;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0xFFFFFFFF;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0xFFFFFFFF;    // [127:96]
	
	reg_la_sample = 1;
	// Now read them
	if(reg_la2_data != 0x1DEADBEE){
		reg_mprj_datal = 0x00000003;
	}

	// Configure LA as CPU output
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0x00000000;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]

	// SRAM 10
	// Write DEADBEEF to address 1
	// Send input packet
	reg_la3_data = 0xA000A000;
	reg_la2_data = 0x1DEADBEE;
	reg_la1_data = 0xF3C00000;
	reg_la0_data = 0x00000000;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x2000A000;
	reg_la3_data = 0xA000A000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x0800A000;
	reg_la3_data = 0x8000A000;

	// Read back data
	// Send input packet
	reg_la3_data = 0xA000A000;
	reg_la2_data = 0x10000000;
	reg_la1_data = 0x04000000;
	reg_la0_data = 0x00000000;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x2000A000;
	reg_la3_data = 0xA000A000;
	
	// Toggle clock to read SRAM
	reg_la3_data = 0x0800A000;
	reg_la3_data = 0x8000A000;

	// Toggle clock to store into dout FF
	reg_la3_data = 0x0000A000;
	reg_la3_data = 0x8000A000;

	// Toggle clock to replace din with dout
	reg_la3_data = 0x10000A000;
	reg_la3_data = 0x90000A000;

		// Read from the LA
	// This will trigger a sample of the LA bits to read
	// Configure LA probes as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0xFFFFFFFF;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0xFFFFFFFF;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0xFFFFFFFF;    // [127:96]
	
	reg_la_sample = 1;
	// Now read them
	if(reg_la2_data != 0x1DEADBEE){
		reg_mprj_datal = 0x00000001;
	}

	// Configure LA as CPU output
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0x00000000;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]

	// SRAM 11
	// Write DEADBEEF to address 1
	// Send input packet
	reg_la3_data = 0xA000B000;
	reg_la2_data = 0x1DEADBEE;
	reg_la1_data = 0xF3C00000;
	reg_la0_data = 0x00000000;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x2000B000;
	reg_la3_data = 0xA000B000;
	
	// Toggle clock to write SRAM
	reg_la3_data = 0x0800B000;
	reg_la3_data = 0x8000B000;

	// Read back data
	// Send input packet
	reg_la3_data = 0xA000B000;
	reg_la2_data = 0x10000000;
	reg_la1_data = 0x04000000;
	reg_la0_data = 0x00000000;

	// Toggle clock to load into SRAM register
	reg_la3_data = 0x2000B000;
	reg_la3_data = 0xA000B000;
	
	// Toggle clock to read SRAM
	reg_la3_data = 0x0800B000;
	reg_la3_data = 0x8000B000;

	// Toggle clock to store into dout FF
	reg_la3_data = 0x0000B000;
	reg_la3_data = 0x8000B000;

	// Toggle clock to replace din with dout
	reg_la3_data = 0x10000B000;
	reg_la3_data = 0x90000B000;

	// Read from the LA
	// This will trigger a sample of the LA bits to read
	// Configure LA probes as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0xFFFFFFFF;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0xFFFFFFFF;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0xFFFFFFFF;    // [127:96]
	
	reg_la_sample = 1;
	// Now read them
	if(reg_la2_data != 0x1DEADBEE){
		reg_mprj_datal = 0x00000003;
	}

	// Configure LA as CPU output
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0x00000000;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]
	
	// On end, set pin 0 to 0
	reg_mprj_datal = 0x00000000;
}
