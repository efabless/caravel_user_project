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
MAKEFLAGS+=--warn-undefined-variables

CARAVEL_ROOT?=$(PWD)/caravel
PRECHECK_ROOT?=${HOME}/mpw_precheck
MCW_ROOT?=$(PWD)/mgmt_core_wrapper
SIM ?= RTL

# Install lite version of caravel, (1): caravel-lite, (0): caravel
CARAVEL_LITE?=1

ifeq ($(CARAVEL_LITE),1) 
	CARAVEL_NAME := caravel-lite
	CARAVEL_REPO := https://github.com/efabless/caravel-lite 
	CARAVEL_TAG := 'mpw-5b'
else
	CARAVEL_NAME := caravel
	CARAVEL_REPO := https://github.com/efabless/caravel 
	CARAVEL_TAG := 'mpw-5b'
endif


# Include Caravel Makefile Targets
.PHONY: % : check-caravel
%: 
	export CARAVEL_ROOT=$(CARAVEL_ROOT) && $(MAKE) -f $(CARAVEL_ROOT)/Makefile $@

.PHONY: install
install: $(CARAVEL_ROOT)

# Install caravel
$(CARAVEL_ROOT):
	@echo "Installing $(CARAVEL_NAME).."
	@git clone -b $(CARAVEL_TAG) $(CARAVEL_REPO) $(CARAVEL_ROOT) --depth=1

# Install DV setup
.PHONY: simenv
simenv:
	docker pull efabless/dv_setup:latest

patterns=$(shell cd verilog/dv && find * -maxdepth 0 -type d)
dv_targets = $(patterns:%=verify-%)
TARGET_PATH=$(shell pwd)
verify_command="cd ${TARGET_PATH}/verilog/dv/$* && export SIM=${SIM} && make"

blocks = $(shell cd openlane && find * -maxdepth 0 -type d)
netlists = $(blocks:%=./verilog/gl/%.v)
$(netlists): ./verilog/gl/%.v : $(CARAVEL_ROOT) $(OPENLANE_ROOT) $(PDK_ROOT)
	export CARAVEL_ROOT=$(CARAVEL_ROOT) && cd openlane && $(MAKE) $*

.PHONY: $(blocks)
$(blocks): % : ./verilog/gl/%.v

.PHONY: verify
verify: dv_all

.PHONY: dv_all
dv_all:$(dv_targets)

$(dv_targets): verify-% : ./verilog/dv/% simenv install openlane $(netlists) install_mcw check-env pdk
	docker run -v ${TARGET_PATH}:${TARGET_PATH} -v ${PDK_ROOT}:${PDK_ROOT} \
		-v ${CARAVEL_ROOT}:${CARAVEL_ROOT} \
		-e TARGET_PATH=${TARGET_PATH} -e PDK_ROOT=${PDK_ROOT} \
		-e CARAVEL_ROOT=${CARAVEL_ROOT} \
		-e TOOLS=/opt/riscv32i \
		-e DESIGNS=$(TARGET_PATH) \
		-e CORE_VERILOG_PATH=$(TARGET_PATH)/mgmt_core_wrapper/verilog \
		-e GCC_PREFIX=riscv32-unknown-elf \
		-e MCW_ROOT=$(MCW_ROOT) \
		-u $$(id -u $$USER):$$(id -g $$USER) efabless/dv_setup:latest \
		sh -c $(verify_command)
				

clean-targets=$(blocks:%=clean-%)
.PHONY: $(clean-targets)
$(clean-targets): clean-%:
	rm ./verilog/gl/$*.v
	rm ./spef/$*.spef
	rm ./sdc/$*.sdc
	rm ./sdf/$*.sdf
	rm ./gds/$*.gds
	rm ./mag/$*.mag
	rm ./lef/$*.lef
	rm ./maglef/*.maglef

# Install Openlane
.PHONY: openlane
openlane: 
	cd openlane && $(MAKE) openlane

#### Not sure if the targets following are of any use

# Create symbolic links to caravel's main files
.PHONY: simlink
simlink: check-caravel
### Symbolic links relative path to $CARAVEL_ROOT 
	$(eval MAKEFILE_PATH := $(shell realpath --relative-to=openlane $(CARAVEL_ROOT)/openlane/Makefile))
	$(eval PIN_CFG_PATH  := $(shell realpath --relative-to=openlane/user_project_wrapper $(CARAVEL_ROOT)/openlane/user_project_wrapper_empty/pin_order.cfg))
	mkdir -p openlane
	mkdir -p openlane/user_project_wrapper
	cd openlane &&\
	ln -sf $(MAKEFILE_PATH) Makefile
	cd openlane/user_project_wrapper &&\
	ln -sf $(PIN_CFG_PATH) pin_order.cfg

# Update Caravel
.PHONY: update_caravel
update_caravel: check-caravel
	cd $(CARAVEL_ROOT)/ && git checkout $(CARAVEL_TAG) && git pull

# Uninstall Caravel
.PHONY: uninstall
uninstall: 
	rm -rf $(CARAVEL_ROOT)


# Install Pre-check
# Default installs to the user home directory, override by "export PRECHECK_ROOT=<precheck-installation-path>"
.PHONY: precheck
precheck:
	@git clone --depth=1 --branch mpw-5a https://github.com/efabless/mpw_precheck.git $(PRECHECK_ROOT)
	@docker pull efabless/mpw_precheck:latest

.PHONY: run-precheck
run-precheck: check-pdk check-precheck
	$(eval INPUT_DIRECTORY := $(shell pwd))
	cd $(PRECHECK_ROOT) && \
	docker run -v $(PRECHECK_ROOT):$(PRECHECK_ROOT) -v $(INPUT_DIRECTORY):$(INPUT_DIRECTORY) -v $(PDK_ROOT):$(PDK_ROOT) -e INPUT_DIRECTORY=$(INPUT_DIRECTORY) -e PDK_ROOT=$(PDK_ROOT) \
	-u $(shell id -u $(USER)):$(shell id -g $(USER)) efabless/mpw_precheck:latest bash -c "cd $(PRECHECK_ROOT) ; python3 mpw_precheck.py --input_directory $(INPUT_DIRECTORY) --pdk_root $(PDK_ROOT)"



# Clean 
# .PHONY: clean
# clean:
# 	cd ./verilog/dv/ && \
# 		$(MAKE) -j$(THREADS) clean
# 
check-caravel:
	@if [ ! -d "$(CARAVEL_ROOT)" ]; then \
		echo "Caravel Root: "$(CARAVEL_ROOT)" doesn't exists, please export the correct path before running make. "; \
		exit 1; \
	fi

check-precheck:
	@if [ ! -d "$(PRECHECK_ROOT)" ]; then \
		echo "Pre-check Root: "$(PRECHECK_ROOT)" doesn't exists, please export the correct path before running make. "; \
		exit 1; \
	fi

check-pdk:
	@if [ ! -d "$(PDK_ROOT)" ]; then \
		echo "PDK Root: "$(PDK_ROOT)" doesn't exists, please export the correct path before running make. "; \
		exit 1; \
	fi

.PHONY: help
help:
	cd $(CARAVEL_ROOT) && $(MAKE) help 
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'



