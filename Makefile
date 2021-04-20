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

CARAVEL_ROOT?=$(shell pwd)/caravel
UPRJ_ROOT?=$(shell pwd)

# Install lite version of caravel, (1): caravel-lite, (0): caravel
CARAVEL_LITE?=1

ifeq ($(CARAVEL_LITE),1) 
	CARAVEL_NAME := caravel-lite
	CARAVEL_REPO := https://github.com/Manarabdelaty/caravel-lite 
else
	CARAVEL_NAME := caravel
	CARAVEL_REPO := https://github.com/efabless/caravel 
endif

# Install caravel as submodule, (1): submodule, (0): clone
SUBMODULE?=1

# Include Caravel Makefile Targets
.PHONY: %
%: 
	$(MAKE) -f $(CARAVEL_ROOT)/Makefile $@

# Verify Target for running simulations
.PHONY: verify
verify:
	cd ./verilog/dv/ && \
		$(MAKE) -j$(THREADS) all
	cd ./verilog/dv/ && \
		SIM=GL $(MAKE) -j$(THREADS) all

# Openlane Makefile Targets
BLOCKS = $(shell cd openlane && find * -maxdepth 0 -type d)
.PHONY: $(BLOCKS)
$(BLOCKS):
	cd openlane && $(MAKE) $*

# Install caravel
.PHONY: install
install:
ifeq ($(SUBMODULE),1)
	@echo "Installing $(CARAVEL_NAME) as a submodule.."
	#git submodule add $(CARAVEL_REPO) $(CARAVEL_ROOT)
	@git submodule update --init
	$(MAKE) simlink
else
	@echo "Installing $(CARAVEL_NAME).."
	@git clone $(CARAVEL_REPO) $(CARAVEL_ROOT)
endif

# Create symbolic links to caravel's main files
.PHONY: simlink
simlink: check-caravel
	@ln -sf $(CARAVEL_ROOT)/openlane/Makefile openlane/Makefile
	@ln -sf $(CARAVEL_ROOT)/openlane/user_project_wrapper_empty/pin_order.cfg openlane/user_project_wrapper/pin_order.cfg

# Update Caravel
.PHONY: update_caravel
update_caravel: check-caravel
ifeq ($(SUBMODULE),1)
	@git submodule update --init
else
	cd $(CARAVEL_ROOT)/ && \
		git checkout master && \
		git pull
endif

# Uninstall Caravel
.PHONY: uninstall
uninstall: 
ifeq ($(SUBMODULE),1)
	git submodule deinit -f $(CARAVEL_ROOT)
	rm -rf .git/modules/$(CARAVEL_NAME)
	git rm -f $(CARAVEL_ROOT)
else
	rm -rf $(CARAVEL_ROOT)
endif

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
