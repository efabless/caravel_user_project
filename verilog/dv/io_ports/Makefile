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

# ---- Include Partitioned Makefiles ----

CONFIG = caravel_user_project

SIM?=RTL
CARAVEL_USER_PROJECT_ROOT=$(shell readlink -f ../../../)
FIRMWARE_SOURCE_DIR=${CARAVEL_USER_PROJECT_ROOT}/caravel_firmware
FIRMWARE_BUILD_DIR=${CARAVEL_USER_PROJECT_ROOT}/build
TESTCASE=io_ports

.PHONY: configure
configure:
	echo ${CARAVEL_USER_PROJECT_ROOT}
	cmake \
	-DCMAKE_TOOLCHAIN_FILE=${FIRMWARE_SOURCE_DIR}/cmake/vexriscv_toolchain.cmake \
	-B${FIRMWARE_BUILD_DIR} \
	${FIRMWARE_SOURCE_DIR}

.PHONY: build
build: configure
	cmake --build ${FIRMWARE_BUILD_DIR}

.PHONY: clean
clean:
	rm -rf ${FIRMWARE_BUILD_DIR}
	rm *.hex

.PHONY: sim
sim: build
	cp ${FIRMWARE_BUILD_DIR}/src/testcases/${TESTCASE}/${TESTCASE}.hex .
	iverilog -Ttyp -DFUNCTIONAL -DSIM -DUSER_POWER_PINS -DUNIT_DELAY=#1 \
	-f${VERILOG_PATH}/includes/includes.rtl.${CONFIG} -o $@ $<
