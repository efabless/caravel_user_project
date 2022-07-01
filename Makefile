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

PWD?=$(shell pwd)
CARAVEL_ROOT?=$(PWD)/caravel
PRECHECK_ROOT?=${HOME}/mpw_precheck
MCW_ROOT?=$(PWD)/mgmt_core_wrapper
SIM?=RTL

export SKYWATER_COMMIT=c094b6e83a4f9298e47f696ec5a7fd53535ec5eb
export OPEN_PDKS_COMMIT?=7519dfb04400f224f140749cda44ee7de6f5e095
export PDK_MAGIC_COMMIT=7d601628e4e05fd17fcb80c3552dacb64e9f6e7b
export OPENLANE_TAG=2022.02.23_02.50.41
export MISMATCHES_OK=1

# Install lite version of caravel, (1): caravel-lite, (0): caravel
CARAVEL_LITE?=1

# PDK switch varient
export PDK?=sky130B
export PDKPATH?=$(PDK_ROOT)/$(PDK)

MPW_TAG ?= mpw-6c

ifeq ($(CARAVEL_LITE),1)
	CARAVEL_NAME := caravel-lite
	CARAVEL_REPO := https://github.com/efabless/caravel-lite
	CARAVEL_TAG := $(MPW_TAG)
else
	CARAVEL_NAME := caravel
	CARAVEL_REPO := https://github.com/efabless/caravel
	CARAVEL_TAG := $(MPW_TAG)
endif

# Include Caravel Makefile Targets
.PHONY: % : check-caravel
%:
	export CARAVEL_ROOT=$(CARAVEL_ROOT) && $(MAKE) -f $(CARAVEL_ROOT)/Makefile $@

.PHONY: install
install:
	if [ -d "$(CARAVEL_ROOT)" ]; then\
		echo "Deleting exisiting $(CARAVEL_ROOT)" && \
		rm -rf $(CARAVEL_ROOT) && sleep 2;\
	fi
	echo "Installing $(CARAVEL_NAME).."
	git clone -b $(CARAVEL_TAG) $(CARAVEL_REPO) $(CARAVEL_ROOT) --depth=1

# Install DV setup
.PHONY: simenv
simenv:
	docker pull efabless/dv_setup:latest

.PHONY: setup
setup: install check-env install_mcw openlane pdk-with-volare

# Openlane
blocks=$(shell cd openlane && find * -maxdepth 0 -type d)
.PHONY: $(blocks)
$(blocks): % :
	export CARAVEL_ROOT=$(CARAVEL_ROOT) && cd openlane && $(MAKE) $*

dv_patterns=$(shell cd verilog/dv && find * -maxdepth 0 -type d)
dv-targets-rtl=$(dv_patterns:%=verify-%-rtl)
dv-targets-gl=$(dv_patterns:%=verify-%-gl)
dv-targets-gl-sdf=$(dv_patterns:%=verify-%-gl-sdf)

TARGET_PATH=$(shell pwd)
verify_command="cd ${TARGET_PATH}/verilog/dv/$* && export SIM=${SIM} && make"
dv_base_dependencies=simenv
docker_run_verify=\
	docker run -v ${TARGET_PATH}:${TARGET_PATH} -v ${PDK_ROOT}:${PDK_ROOT} \
		-v ${CARAVEL_ROOT}:${CARAVEL_ROOT} \
		-e TARGET_PATH=${TARGET_PATH} -e PDK_ROOT=${PDK_ROOT} \
		-e CARAVEL_ROOT=${CARAVEL_ROOT} \
		-e TOOLS=/opt/riscv32i \
		-e DESIGNS=$(TARGET_PATH) \
		-e PDK=$(PDK) \
		-e CORE_VERILOG_PATH=$(TARGET_PATH)/mgmt_core_wrapper/verilog \
		-e GCC_PREFIX=riscv32-unknown-elf \
		-e MCW_ROOT=$(MCW_ROOT) \
		-u $$(id -u $$USER):$$(id -g $$USER) efabless/dv_setup:latest \
		sh -c $(verify_command)

.PHONY: harden
harden: $(blocks)

.PHONY: verify
verify: $(dv-targets-rtl)

.PHONY: verify-all-rtl
verify-all-rtl: $(dv-targets-rtl)

.PHONY: verify-all-gl
verify-all-gl: $(dv-targets-gl)

.PHONY: verify-all-gl-sdf
verify-all-gl-sdf: $(dv-targets-gl-sdf)

$(dv-targets-rtl): SIM=RTL
$(dv-targets-rtl): verify-%-rtl: $(dv_base_dependencies)
	$(docker_run_verify)

$(dv-targets-gl): SIM=GL
$(dv-targets-gl): verify-%-gl: $(dv_base_dependencies)
	$(docker_run_verify)

$(dv-targets-gl-sdf): SIM=GL_SDF
$(dv-targets-gl-sdf): verify-%-gl-sdf: $(dv_base_dependencies)
	$(docker_run_verify)

clean-targets=$(blocks:%=clean-%)
.PHONY: $(clean-targets)
$(clean-targets): clean-% :
	rm -f ./verilog/gl/$*.v
	rm -f ./spef/$*.spef
	rm -f ./sdc/$*.sdc
	rm -f ./sdf/$*.sdf
	rm -f ./gds/$*.gds
	rm -f ./mag/$*.mag
	rm -f ./lef/$*.lef
	rm -f ./maglef/*.maglef

make_what=setup $(blocks) $(dv-targets-rtl) $(dv-targets-gl) $(dv-targets-gl-sdf) $(clean-targets)
.PHONY: what
what:
	# $(make_what)

# Install Openlane
.PHONY: openlane
openlane:
	@if [ "$$(realpath $${OPENLANE_ROOT})" = "$$(realpath $$(pwd)/openlane)" ]; then\
		echo "OPENLANE_ROOT is set to '$$(pwd)/openlane' which contains openlane config files"; \
		echo "Please set it to a different directory"; \
		exit 1; \
	fi
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
	@git clone --depth=1 --branch $(MPW_TAG) https://github.com/efabless/mpw_precheck.git $(PRECHECK_ROOT)
	@docker pull efabless/mpw_precheck:latest

.PHONY: run-precheck
run-precheck: check-pdk check-precheck
	$(eval INPUT_DIRECTORY := $(shell pwd))
	cd $(PRECHECK_ROOT) && \
	docker run -v $(PRECHECK_ROOT):$(PRECHECK_ROOT) \
	-v $(INPUT_DIRECTORY):$(INPUT_DIRECTORY) \
	-v $(PDK_ROOT):$(PDK_ROOT) \
	-e INPUT_DIRECTORY=$(INPUT_DIRECTORY) \
	-e PDK_ROOT=$(PDK_ROOT) \
	-e PDKPATH=$(PDKPATH) \
	-u $(shell id -u $(USER)):$(shell id -g $(USER)) \
	efabless/mpw_precheck:latest bash -c "cd $(PRECHECK_ROOT) ; python3 mpw_precheck.py --input_directory $(INPUT_DIRECTORY) --pdk_root $(PDK_ROOT)"



.PHONY: clean
clean:
	cd ./verilog/dv/ && \
		$(MAKE) -j$(THREADS) clean

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


