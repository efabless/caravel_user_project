# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# Base Configurations. Don't Touch
# section begin
set script_dir [file dirname [file normalize [info script]]]

source $script_dir/../../caravel/openlane/user_project_wrapper_empty/fixed_wrapper_cfgs.tcl

set ::env(DESIGN_NAME) user_project_wrapper
#section end

# User Configurations

## Source Verilog Files
set ::env(VERILOG_FILES) "\
	$script_dir/../../caravel/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/user_project_wrapper.v \
	$script_dir/../../verilog/rtl/testchip/openram_testchip.v"

## Clock configurations
set ::env(CLOCK_PORT) "wb_clk_i"
set ::env(CLOCK_NET) "wb_clk_i"

set ::env(CLOCK_PERIOD) "10"

## Internal Macros
### Macro Placement
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg

### Black-box verilog and views
set ::env(VERILOG_FILES_BLACKBOX) "\
	$script_dir/../../caravel/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/sky130_sram_1kbyte_1rw1r_32x256_8.v \
	$script_dir/../../verilog/rtl/sram_1rw0r0w_32_1024_sky130.v \
	$script_dir/../../verilog/rtl/sram_1rw0r0w_32_256_sky130.v \
	$script_dir/../../verilog/rtl/sram_1rw0r0w_32_512_sky130.v \
	$script_dir/../../verilog/rtl/sram_1rw0r0w_64_512_sky130.v "

set ::env(EXTRA_LEFS) "\
	$script_dir/../../lef/user_project_wrapper.lef \
	$script_dir/../../lef/sky130_sram_1kbyte_1rw1r_32x256_8.lef \
	$script_dir/../../lef/sram_1rw0r0w_32_1024_sky130.lef \
	$script_dir/../../lef/sram_1rw0r0w_32_256_sky130.lef \
	$script_dir/../../lef/sram_1rw0r0w_32_512_sky130.lef \
	$script_dir/../../lef/sram_1rw0r0w_64_512_sky130.lef "

set ::env(EXTRA_GDS_FILES) "\
	$script_dir/../../gds/user_project_wrapper.gds \
	$script_dir/../../gds/sky130_sram_1kbyte_1rw1r_32x256_8.gds \
	$script_dir/../../gds/sram_1rw0r0w_32_1024_sky130.gds \
	$script_dir/../../gds/sram_1rw0r0w_32_256_sky130.gds \
	$script_dir/../../gds/sram_1rw0r0w_32_512_sky130.gds \
	$script_dir/../../gds/sram_1rw0r0w_64_512_sky130.gds "

set ::env(GLB_RT_MAXLAYER) 5

set ::env(FP_PDN_CHECK_NODES) 0
# Power config

#set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

# Placement config
set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0

set ::env(PL_RANDOM_GLB_PLACEMENT) 1

set ::env(GLB_RT_ADJUSTMENT) 0.40
set ::env(PL_TARGET_DENSITY) 0.40

#set ::env(MAGIC_DRC_USE_GDS) 0

set ::env(RUN_KLAYOUT_DRC) 0

