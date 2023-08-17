# SPDX-FileCopyrightText: 2020 Efabless Corporation
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

export OPENLANE_RUN_TAG = $(shell date '+%y_%m_%d_%H_%M')
export CARAVEL_ROOT:=$(CARAVEL_ROOT)
export PDK:=$(PDK)
export PDK_ROOT:=$(PDK_ROOT)
OPENLANE_TAG ?= 2023.07.19
OPENLANE_IMAGE_NAME ?= efabless/openlane:$(OPENLANE_TAG)
designs = $(shell find * -maxdepth 0 -type d)
current_design = null
OPENLANE_USE_NIX ?= 0
ROOTLESS ?= 0
USER_ARGS = -u $$(id -u $$USER):$$(id -g $$USER)
ifeq ($(ROOTLESS), 1)
	USER_ARGS =
endif

openlane_args = \
	--run-tag $(OPENLANE_RUN_TAG) \
	--manual-pdk \
	--pdk-root $(PDK_ROOT) \
	$$(realpath ./$*)/config.json

docker_mounts = \
	-m $$(realpath $(PWD)/..) \
	-m $(PDK_ROOT) \
	-m $(CARAVEL_ROOT)

docker_env = \
	-e PDK_ROOT=$(PDK_ROOT) \
	-e PDK=$(PDK) \
	-e CARAVEL_ROOT=$(CARAVEL_ROOT) \
	-e OPENLANE_RUN_TAG=$(OPENLANE_RUN_TAG)

ifneq ($(MCW_ROOT),)
docker_env += -e MCW_ROOT=$(MCW_ROOT)
export MCW_ROOT:=$(MCW_ROOT)
docker_mounts += -m $(MCW_ROOT)
endif

ifeq ($(OPENLANE_USE_NIX),0)
endif

docker_startup_mode = $(shell test -t 0 && echo "-it" || echo "--rm" )
docker_run = \
	docker run $(docker_startup_mode) \
	$(USER_ARGS) \
	$(docker_mounts) \
	$(docker_env) \

list:
	@echo $(designs)

.PHONY: $(designs)
$(designs) : export current_design=$@
$(designs) : % : ./%/config.json
	# $(current_design)
	rm -rf ./$*/runs/$(OPENLANE_RUN_TAG)
ifeq ($(OPENLANE_USE_NIX),1)
	nix-shell --pure --command "openlane $(openlane_args)"
else
	../openlane-venv/bin/python3 -m openlane $(docker_mounts) --dockerized $(openlane_args)
endif
	mkdir -p ./$*/runs/$(OPENLANE_RUN_TAG)
	rm -rf ./$*/runs/$*
	ln -s $$(realpath ./$*/runs/$(OPENLANE_RUN_TAG)) ./$*/runs/$*
	@mkdir -p ../signoff/$*/
	cat  $(OPENLANE_TAG) > ../signoff/$*/OPENLANE_VERSION
	@cp $(PDK_ROOT)/$(PDK)/SOURCES ../signoff/$*/PDK_SOURCES
	@cp ./$*/runs/$*/final/*.csv ../signoff/$*/

.PHONY: openlane
openlane: check-openlane-env
	if [ -d "$(OPENLANE_ROOT)" ]; then\
		echo "Deleting exisiting $(OPENLANE_ROOT)" && \
		rm -rf $(OPENLANE_ROOT) && sleep 2; \
		fi
	git clone https://github.com/The-OpenROAD-Project/OpenLane -b $(OPENLANE_TAG) --depth=1 $(OPENLANE_ROOT) && \
		cd $(OPENLANE_ROOT) && \
		export OPENLANE_IMAGE_NAME=efabless/openlane:$(OPENLANE_TAG) && \
		export IMAGE_NAME=efabless/openlane:$(OPENLANE_TAG) && \
		$(MAKE) pull-openlane

.PHONY: check-openlane-env
check-openlane-env:
ifeq ($(OPENLANE_ROOT),)
	@echo "Please export OPENLANE_ROOT"
	@exit 1
endif
