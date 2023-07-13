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

export CARAVEL_ROOT?=$(PWD)/caravel
PRECHECK_ROOT?=${HOME}/mpw_precheck
export MCW_ROOT?=$(PWD)/mgmt_core_wrapper
SIM?=RTL

# Install lite version of caravel, (1): caravel-lite, (0): caravel
CARAVEL_LITE?=1

# PDK switch varient
export PDK?=sky130A
#export PDK?=gf180mcuC
export PDKPATH?=$(PDK_ROOT)/$(PDK)

export OPENLANE_ROOT?=$(PWD)/dependencies/openlane_src
export PDK_ROOT?=$(PWD)/dependencies/pdks

export DISABLE_LVS?=0



ifeq ($(PDK),sky130A)
	SKYWATER_COMMIT=f70d8ca46961ff92719d8870a18a076370b85f6c
	export OPEN_PDKS_COMMIT?=78b7bc32ddb4b6f14f76883c2e2dc5b5de9d1cbc
	export OPENLANE_TAG?=2023.07.13
	MPW_TAG ?= mpw-9d

ifeq ($(CARAVEL_LITE),1)
	CARAVEL_NAME := caravel-lite
	CARAVEL_REPO := https://github.com/efabless/caravel-lite
	CARAVEL_TAG := $(MPW_TAG)
else
	CARAVEL_NAME := caravel
	CARAVEL_REPO := https://github.com/efabless/caravel
	CARAVEL_TAG := $(MPW_TAG)
endif

endif

ifeq ($(PDK),sky130B)
	SKYWATER_COMMIT=f70d8ca46961ff92719d8870a18a076370b85f6c
	export OPEN_PDKS_COMMIT?=78b7bc32ddb4b6f14f76883c2e2dc5b5de9d1cbc
	export OPENLANE_TAG?=2023.07.13
	MPW_TAG ?= mpw-9d

ifeq ($(CARAVEL_LITE),1)
	CARAVEL_NAME := caravel-lite
	CARAVEL_REPO := https://github.com/efabless/caravel-lite
	CARAVEL_TAG := $(MPW_TAG)
else
	CARAVEL_NAME := caravel
	CARAVEL_REPO := https://github.com/efabless/caravel
	CARAVEL_TAG := $(MPW_TAG)
endif

endif

ifeq ($(PDK),gf180mcuC)

	MPW_TAG ?= gfmpw-0b
	CARAVEL_NAME := caravel
	CARAVEL_REPO := https://github.com/efabless/caravel-gf180mcu
	CARAVEL_TAG := $(MPW_TAG)
	#OPENLANE_TAG=ddfeab57e3e8769ea3d40dda12be0460e09bb6d9
	export OPEN_PDKS_COMMIT?=e6f9c8876da77220403014b116761b0b2d79aab4
	export OPENLANE_TAG?=2023.02.23

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
	docker pull efabless/dv:latest

.PHONY: setup
setup: check_dependencies install check-env install_mcw openlane pdk-with-volare setup-timing-scripts setup-cocotb

# Openlane
blocks=$(shell cd openlane && find * -maxdepth 0 -type d)
.PHONY: $(blocks)
$(blocks): % :
	$(MAKE) -C openlane $*

dv_patterns=$(shell cd verilog/dv && find * -maxdepth 0 -type d)
dv-targets-rtl=$(dv_patterns:%=verify-%-rtl)
dv-targets-gl=$(dv_patterns:%=verify-%-gl)
dv-targets-gl-sdf=$(dv_patterns:%=verify-%-gl-sdf)

TARGET_PATH=$(shell pwd)
verify_command="source ~/.bashrc && cd ${TARGET_PATH}/verilog/dv/$* && export SIM=${SIM} && make"
dv_base_dependencies=simenv
docker_run_verify=\
	docker run -v ${TARGET_PATH}:${TARGET_PATH} -v ${PDK_ROOT}:${PDK_ROOT} \
		-v ${CARAVEL_ROOT}:${CARAVEL_ROOT} \
		-v ${MCW_ROOT}:${MCW_ROOT} \
		-e TARGET_PATH=${TARGET_PATH} -e PDK_ROOT=${PDK_ROOT} \
		-e CARAVEL_ROOT=${CARAVEL_ROOT} \
		-e TOOLS=/foss/tools/riscv-gnu-toolchain-rv32i/217e7f3debe424d61374d31e33a091a630535937 \
		-e DESIGNS=$(TARGET_PATH) \
		-e USER_PROJECT_VERILOG=$(TARGET_PATH)/verilog \
		-e PDK=$(PDK) \
		-e CORE_VERILOG_PATH=$(TARGET_PATH)/mgmt_core_wrapper/verilog \
		-e CARAVEL_VERILOG_PATH=$(TARGET_PATH)/caravel/verilog \
		-e MCW_ROOT=$(MCW_ROOT) \
		-u $$(id -u $$USER):$$(id -g $$USER) efabless/dv:latest \
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
	@if [ "$$DISABLE_LVS" = "1" ]; then\
		$(eval INPUT_DIRECTORY := $(shell pwd)) \
		cd $(PRECHECK_ROOT) && \
		docker run -v $(PRECHECK_ROOT):$(PRECHECK_ROOT) \
		-v $(INPUT_DIRECTORY):$(INPUT_DIRECTORY) \
		-v $(PDK_ROOT):$(PDK_ROOT) \
		-e INPUT_DIRECTORY=$(INPUT_DIRECTORY) \
		-e PDK_PATH=$(PDK_ROOT)/$(PDK) \
		-e PDK_ROOT=$(PDK_ROOT) \
		-e PDKPATH=$(PDKPATH) \
		-u $(shell id -u $(USER)):$(shell id -g $(USER)) \
		efabless/mpw_precheck:latest bash -c "cd $(PRECHECK_ROOT) ; python3 mpw_precheck.py --input_directory $(INPUT_DIRECTORY) --pdk_path $(PDK_ROOT)/$(PDK) license makefile default documentation consistency gpio_defines xor magic_drc klayout_feol klayout_beol klayout_offgrid klayout_met_min_ca_density klayout_pin_label_purposes_overlapping_drawing klayout_zeroarea"; \
	else \
		$(eval INPUT_DIRECTORY := $(shell pwd)) \
		cd $(PRECHECK_ROOT) && \
		docker run -v $(PRECHECK_ROOT):$(PRECHECK_ROOT) \
		-v $(INPUT_DIRECTORY):$(INPUT_DIRECTORY) \
		-v $(PDK_ROOT):$(PDK_ROOT) \
		-e INPUT_DIRECTORY=$(INPUT_DIRECTORY) \
		-e PDK_PATH=$(PDK_ROOT)/$(PDK) \
		-e PDK_ROOT=$(PDK_ROOT) \
		-e PDKPATH=$(PDKPATH) \
		-u $(shell id -u $(USER)):$(shell id -g $(USER)) \
		efabless/mpw_precheck:latest bash -c "cd $(PRECHECK_ROOT) ; python3 mpw_precheck.py --input_directory $(INPUT_DIRECTORY) --pdk_path $(PDK_ROOT)/$(PDK)"; \
	fi


BLOCKS = $(shell cd lvs && find * -maxdepth 0 -type d)
LVS_BLOCKS = $(foreach block, $(BLOCKS), lvs-$(block))
$(LVS_BLOCKS): lvs-% : ./lvs/%/lvs_config.json check-pdk check-precheck
	@$(eval INPUT_DIRECTORY := $(shell pwd))
	@cd $(PRECHECK_ROOT) && \
	docker run -v $(PRECHECK_ROOT):$(PRECHECK_ROOT) \
	-v $(INPUT_DIRECTORY):$(INPUT_DIRECTORY) \
	-v $(PDK_ROOT):$(PDK_ROOT) \
	-u $(shell id -u $(USER)):$(shell id -g $(USER)) \
	efabless/mpw_precheck:latest bash -c "cd $(PRECHECK_ROOT) ; python3 checks/lvs_check/lvs.py --pdk_path $(PDK_ROOT)/$(PDK) --design_directory $(INPUT_DIRECTORY) --output_directory $(INPUT_DIRECTORY)/lvs --design_name $* --config_file $(INPUT_DIRECTORY)/lvs/$*/lvs_config.json"

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

.PHONY: check_dependencies
check_dependencies:
	@if [ ! -d "$(PWD)/dependencies" ]; then \
		mkdir $(PWD)/dependencies; \
	fi


export CUP_ROOT=$(shell pwd)
export TIMING_ROOT?=$(shell pwd)/dependencies/timing-scripts
export PROJECT_ROOT=$(CUP_ROOT)
timing-scripts-repo=https://github.com/efabless/timing-scripts.git

$(TIMING_ROOT):
	@mkdir -p $(CUP_ROOT)/dependencies
	@git clone $(timing-scripts-repo) $(TIMING_ROOT)

.PHONY: setup-timing-scripts
setup-timing-scripts: $(TIMING_ROOT)
	@( cd $(TIMING_ROOT) && git pull )
	@#( cd $(TIMING_ROOT) && git fetch && git checkout $(MPW_TAG); )

.PHONY: setup-cocotb
setup-cocotb: 
	@pip install caravel-cocotb==1.0.0 
	@(python3 $(PROJECT_ROOT)/verilog/dv/setup-cocotb.py $(CARAVEL_ROOT) $(MCW_ROOT) $(PDK_ROOT) $(PDK) $(PROJECT_ROOT))
	@docker pull efabless/dv:latest
	@docker pull efabless/dv:cocotb

.PHONY: cocotb-verify-rtl
cocotb-verify-rtl: 
	@(cd $(PROJECT_ROOT)/verilog/dv/cocotb && caravel_cocotb -tl counter_tests/counter_tests.yaml -v )
	
.PHONY: cocotb-verify-gl
cocotb-verify-gl: 
	@(cd $(PROJECT_ROOT)/verilog/dv/cocotb && caravel_cocotb -tl counter_tests/counter_tests_gl.yaml -v -verbosity quiet)

./verilog/gl/user_project_wrapper.v:
	$(error you don't have $@)

./env/spef-mapping.tcl: 
	@echo "run the following:"
	@echo "make extract-parasitics"
	@echo "make create-spef-mapping"
	exit 1

.PHONY: create-spef-mapping
create-spef-mapping: ./verilog/gl/user_project_wrapper.v
	docker run \
		--rm \
		-u $$(id -u $$USER):$$(id -g $$USER) \
		-v $(PDK_ROOT):$(PDK_ROOT) \
		-v $(CUP_ROOT):$(CUP_ROOT) \
		-v $(CARAVEL_ROOT):$(CARAVEL_ROOT) \
		-v $(MCW_ROOT):$(MCW_ROOT) \
		-v $(TIMING_ROOT):$(TIMING_ROOT) \
		-w $(shell pwd) \
		efabless/timing-scripts:latest \
		python3 $(TIMING_ROOT)/scripts/generate_spef_mapping.py \
			-i ./verilog/gl/user_project_wrapper.v \
			-o ./env/spef-mapping.tcl \
			--pdk-path $(PDK_ROOT)/$(PDK) \
			--macro-parent chip_core/mprj \
			--project-root "$(CUP_ROOT)"


.PHONY: extract-parasitics
extract-parasitics: ./verilog/gl/user_project_wrapper.v
	docker run \
		--rm \
		-u $$(id -u $$USER):$$(id -g $$USER) \
		-v $(PDK_ROOT):$(PDK_ROOT) \
		-v $(CUP_ROOT):$(CUP_ROOT) \
		-v $(CARAVEL_ROOT):$(CARAVEL_ROOT) \
		-v $(MCW_ROOT):$(MCW_ROOT) \
		-v $(TIMING_ROOT):$(TIMING_ROOT) \
		-w $(shell pwd) \
		efabless/timing-scripts:latest \
		python3 $(TIMING_ROOT)/scripts/get_macros.py \
			-i ./verilog/gl/user_project_wrapper.v \
			-o ./tmp-macros-list \
			--project-root "$(CUP_ROOT)" \
			--pdk-path $(PDK_ROOT)/$(PDK)
	@cat ./tmp-macros-list | cut -d " " -f2 \
		| xargs -I % bash -c "$(MAKE) -C $(TIMING_ROOT) \
			-f $(TIMING_ROOT)/timing.mk rcx-% || echo 'Cannot extract %. Probably no def for this macro'"
	@$(MAKE) -C $(TIMING_ROOT) -f $(TIMING_ROOT)/timing.mk rcx-user_project_wrapper
	@cat ./tmp-macros-list
	@rm ./tmp-macros-list
	
.PHONY: caravel-sta
caravel-sta: ./env/spef-mapping.tcl
	@$(MAKE) -C $(TIMING_ROOT) -f $(TIMING_ROOT)/timing.mk caravel-timing-typ -j3
	@$(MAKE) -C $(TIMING_ROOT) -f $(TIMING_ROOT)/timing.mk caravel-timing-fast -j3
	@$(MAKE) -C $(TIMING_ROOT) -f $(TIMING_ROOT)/timing.mk caravel-timing-slow -j3
	@echo =============================================Summary=============================================
	@find $(PROJECT_ROOT)/signoff/caravel/openlane-signoff/timing/*/ -name "summary.log" | head -n1 \
		| xargs head -n5 | tail -n1
	@find $(PROJECT_ROOT)/signoff/caravel/openlane-signoff/timing/*/ -name "summary.log" \
		| xargs -I {} bash -c "head -n7 {} | tail -n1"
	@echo =================================================================================================
	@echo "You can find results for all corners in $(CUP_ROOT)/signoff/caravel/openlane-signoff/timing/"
	@echo "Check summary.log of a specific corner to point to reports with reg2reg violations" 
	@echo "Cap and slew violations are inside summary.log file itself"
