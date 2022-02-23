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
#
# SPDX-License-Identifier: Apache-2.0



PWDD := $(shell pwd)
BLOCKS := $(shell basename $(PWDD))
CARAVEL_USER_PROJECT_ROOT=$(shell readlink -f ../../../)

# ---- Include Partitioned Makefiles ----

CONFIG = caravel_user_project

# Simulation variables
SIM?=RTL
DESIGNS?=${CARAVEL_USER_PROJECT_ROOT}
CARAVEL_VERILOG_PATH?=${CARAVEL_USER_PROJECT_ROOT}/caravel/verilog
CORE_VERILOG_PATH?=${CARAVEL_USER_PROJECT_ROOT}/caravel_mgmt_soc_litex/verilog
export CARAVEL_PATH=${CARAVEL_USER_PROJECT_ROOT}/caravel/verilog
export VERILOG_PATH=${CARAVEL_USER_PROJECT_ROOT}/mgmt_core_wrapper/verilog
export USER_PROJECT_VERILOG=${CARAVEL_USER_PROJECT_ROOT}/verilog

# Firmware variables
TESTCASE=io_ports
PATH := /opt/riscv32i/bin:${PATH}
FIRMWARE_SOURCE_DIR := ${CARAVEL_USER_PROJECT_ROOT}/caravel_firmware
FIRMWARE_BUILD_DIR := ${CARAVEL_USER_PROJECT_ROOT}/build

.PHONY: configure
configure:
	cmake \
	-DCMAKE_TOOLCHAIN_FILE=${FIRMWARE_SOURCE_DIR}/cmake/vexriscv_toolchain.cmake \
	-B${FIRMWARE_BUILD_DIR} \
	${FIRMWARE_SOURCE_DIR}

.PHONY: build
build: configure
	cmake --build ${FIRMWARE_BUILD_DIR}

.PHONY: rebuild
rebuild: configure
	cmake --build ${FIRMWARE_BUILD_DIR} --clean-first

.PHONY: sim
sim: rebuild
	cp -f ${FIRMWARE_BUILD_DIR}/src/testcases/${TESTCASE}/${TESTCASE}.hex .
	sed -ie 's/@10/@00/g' ${TESTCASE}.hex
	iverilog \
	-Ttyp \
	-DFUNCTIONAL \
	-DSIM \
	-DUSE_POWER_PINS \
	-DUNIT_DELAY=#1 \
	-f${CARAVEL_USER_PROJECT_ROOT}/mgmt_core_wrapper/verilog/includes/includes.rtl.${CONFIG} \
	-o ${TESTCASE}.vvp ${TESTCASE}_tb.v
	vvp ${TESTCASE}.vvp
	mv ${TESTCASE}.vcd RTL-${TESTCASE}.vcd

.PHONY: clean
clean: clean-build clean-hex

.PHONY: clean-build
clean-build:
	cmake --build ${FIRMWARE_BUILD_DIR} --target clean

.PHONY: clean-hex
clean-hex:
	rm *.hex *.hexe
