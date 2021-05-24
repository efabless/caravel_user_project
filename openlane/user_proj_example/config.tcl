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

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) user_proj


set ::env(VERILOG_FILES) "\
	$script_dir/../../caravel/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/user_proj.v \
	$script_dir/../../verilog/rtl/ecc_registers/register_file.v \
	$script_dir/../../verilog/rtl/ecc_registers/register_data.v \
	$script_dir/../../verilog/rtl/ecc_registers/data_verificator.v \
	$script_dir/../../verilog/rtl/ecc_registers/decoder_output.v \
	$script_dir/../../verilog/rtl/ecc_registers/parity_calculator.v \
	$script_dir/../../verilog/rtl/ecc_registers/state_counters.v"

set ::env(CLOCK_PORT) ""
set ::env(CLOCK_NET) "register_file.clk_i"
set ::env(CLOCK_PERIOD) "10"



set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 900 600"
set ::env(DESIGN_IS_CORE) 0

set ::env(VDD_NETS) [list {vccd1} {vccd2} {vdda1} {vdda2}]
set ::env(GND_NETS) [list {vssd1} {vssd2} {vssa1} {vssa2}]

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_TARGET_DENSITY) 0.2



# If you're going to use multiple power domains, then keep this disabled.
set ::env(RUN_CVC) 0

set ::env(ROUTING_OPT_ITERS) 70
set ::env(ROUTING_CORES) 8
#set ::env(DETAILED_ROUTER) drcu

