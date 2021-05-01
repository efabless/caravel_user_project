// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
 
module storage (
    // MGMT_AREA R/W Interface 
    input mgmt_clk,
    input [`RAM_BLOCKS-1:0] mgmt_ena, 
    input [`RAM_BLOCKS-1:0] mgmt_wen, // not shared 
    input [(`RAM_BLOCKS*4)-1:0] mgmt_wen_mask, // not shared 
    input [7:0] mgmt_addr,
    input [31:0] mgmt_wdata,
    output [(`RAM_BLOCKS*32)-1:0] mgmt_rdata,

    // MGMT_AREA RO Interface
    input mgmt_ena_ro,
    input [7:0] mgmt_addr_ro,
    output [31:0] mgmt_rdata_ro
);
    sky130_sram_1kbyte_1rw1r_32x256_8 SRAM_0 (
        // MGMT R/W port
        .clk0(mgmt_clk), 
        .csb0(mgmt_ena[0]),   
        .web0(mgmt_wen[0]),  
        .wmask0(mgmt_wen_mask[3:0]),
        .addr0(mgmt_addr),
        .din0(mgmt_wdata),
        .dout0(mgmt_rdata[31:0]),
        // MGMT RO port
        .clk1(mgmt_clk),
        .csb1(mgmt_ena_ro), 
        .addr1(mgmt_addr_ro),
        .dout1(mgmt_rdata_ro)
    ); 

    sky130_sram_1kbyte_1rw1r_32x256_8 SRAM_1 (
        // MGMT R/W port
        .clk0(mgmt_clk), 
        .csb0(mgmt_ena[1]),   
        .web0(mgmt_wen[1]),  
        .wmask0(mgmt_wen_mask[7:4]),
        .addr0(mgmt_addr),
        .din0(mgmt_wdata),
        .dout0(mgmt_rdata[63:32])
    );  

endmodule
`default_nettype wire
