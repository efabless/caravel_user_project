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

CARAVEL_ROOT?=$(PWD)/caravel
PRECHECK_ROOT?=${HOME}/mpw_precheck
SIM ?= RTL

# Install lite version of caravel, (1): caravel-lite, (0): caravel
CARAVEL_LITE?=1

ifeq ($(CARAVEL_LITE),1) 
	CARAVEL_NAME := caravel-lite
	CARAVEL_REPO := https://github.com/efabless/caravel_openframe-lite 
	CARAVEL_BRANCH := main
else
	CARAVEL_NAME := caravel
	CARAVEL_REPO := https://github.com/efabless/caravel_openframe 
	CARAVEL_BRANCH := master
endif

# Install caravel as submodule, (1): submodule, (0): clone
SUBMODULE?=1

# Include Caravel Makefile Targets
.PHONY: % : check-caravel
%: 
	export CARAVEL_ROOT=$(CARAVEL_ROOT) && $(MAKE) -f $(CARAVEL_ROOT)/Makefile $@

# Verify Target for running simulations
.PHONY: verify
verify:
	cd ./verilog/dv/ && \
	export SIM=${SIM} && \
		$(MAKE) -j$(THREADS)

# Install DV setup
.PHONY: simenv
simenv:
	docker pull efabless/dv_setup:latest

PATTERNS=$(shell cd verilog/dv && find * -maxdepth 0 -type d)
DV_PATTERNS = $(foreach dv, $(PATTERNS), verify-$(dv))
TARGET_PATH=$(shell pwd)
VERIFY_COMMAND="cd ${TARGET_PATH}/verilog/dv/$* && export SIM=${SIM} && make"
$(DV_PATTERNS): verify-% : ./verilog/dv/% 
	docker run -v ${TARGET_PATH}:${TARGET_PATH} -v ${PDK_ROOT}:${PDK_ROOT} \
                -v ${CARAVEL_ROOT}:${CARAVEL_ROOT} \
                -e TARGET_PATH=${TARGET_PATH} -e PDK_ROOT=${PDK_ROOT} \
                -e CARAVEL_ROOT=${CARAVEL_ROOT} \
                -u $(id -u $$USER):$(id -g $$USER) efabless/dv_setup:latest \
                sh -c $(VERIFY_COMMAND)
				
# Openlane Makefile Targets
BLOCKS = $(shell cd openlane && find * -maxdepth 0 -type d)
.PHONY: $(BLOCKS)
$(BLOCKS): %:
	export CARAVEL_ROOT=$(CARAVEL_ROOT) && cd openlane && $(MAKE) $*

# Install caravel
.PHONY: install
install:
ifeq ($(SUBMODULE),1)
	@echo "Installing $(CARAVEL_NAME) as a submodule.."
# Convert CARAVEL_ROOT to relative path because .gitmodules doesn't accept '/'
	$(eval CARAVEL_PATH := $(shell realpath --relative-to=$(shell pwd) $(CARAVEL_ROOT)))
	@if [ ! -d $(CARAVEL_ROOT) ]; then git submodule add --name $(CARAVEL_NAME) $(CARAVEL_REPO) $(CARAVEL_PATH); fi
	@git submodule update --init
	@cd $(CARAVEL_ROOT); git checkout $(CARAVEL_BRANCH)
	$(MAKE) simlink
else
	@echo "Installing $(CARAVEL_NAME).."
	@git clone $(CARAVEL_REPO) $(CARAVEL_ROOT)
	@cd $(CARAVEL_ROOT); git checkout $(CARAVEL_BRANCH)
endif

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
ifeq ($(SUBMODULE),1)
	@git submodule update --init --recursive
	cd $(CARAVEL_ROOT) && \
	git checkout $(CARAVEL_BRANCH) && \
	git pull
else
	cd $(CARAVEL_ROOT)/ && \
		git checkout $(CARAVEL_BRANCH) && \
		git pull
endif

# Uninstall Caravel
.PHONY: uninstall
uninstall: 
ifeq ($(SUBMODULE),1)
	git config -f .gitmodules --remove-section "submodule.$(CARAVEL_NAME)"
	git add .gitmodules
	git submodule deinit -f $(CARAVEL_ROOT)
	git rm --cached $(CARAVEL_ROOT)
	rm -rf .git/modules/$(CARAVEL_NAME)
	rm -rf $(CARAVEL_ROOT)
else
	rm -rf $(CARAVEL_ROOT)
endif

# Install Openlane
.PHONY: openlane
openlane: 
	cd openlane && $(MAKE) openlane

# Install Pre-check
# Default installs to the user home directory, override by "export PRECHECK_ROOT=<precheck-installation-path>"
.PHONY: precheck
precheck:
	@git clone https://github.com/efabless/mpw_precheck.git --depth=1 $(PRECHECK_ROOT)
	@docker pull efabless/mpw_precheck:latest

.PHONY: run-precheck
run-precheck: check-precheck check-pdk check-caravel
	$(eval INPUT_DIRECTORY := $(shell pwd))
	cd $(PRECHECK_ROOT) && \
	docker run -e INPUT_DIRECTORY=$(INPUT_DIRECTORY) -e PDK_ROOT=$(PDK_ROOT) -e CARAVEL_ROOT=$(CARAVEL_ROOT) -v $(PRECHECK_ROOT):$(PRECHECK_ROOT) -v $(INPUT_DIRECTORY):$(INPUT_DIRECTORY) -v $(PDK_ROOT):$(PDK_ROOT) -v $(CARAVEL_ROOT):$(CARAVEL_ROOT) \
	-u $(shell id -u $(USER)):$(shell id -g $(USER)) efabless/mpw_precheck:latest bash -c "cd $(PRECHECK_ROOT) ; python3 mpw_precheck.py --pdk_root $(PDK_ROOT) --input_directory $(INPUT_DIRECTORY) --caravel_root $(CARAVEL_ROOT)"

# Install PDK using OL's Docker Image
.PHONY: pdk-nonnative
pdk-nonnative: skywater-pdk skywater-library skywater-timing open_pdks
	docker run --rm -v $(PDK_ROOT):$(PDK_ROOT) -v $(CARAVEL_ROOT):$(CARAVEL_ROOT) -e CARAVEL_ROOT=$(CARAVEL_ROOT) -e PDK_ROOT=$(PDK_ROOT) -u $(shell id -u $(USER)):$(shell id -g $(USER)) efabless/openlane:current sh -c "cd $(CARAVEL_ROOT); make build-pdk; make gen-sources"

# Clean 
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
