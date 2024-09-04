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
OPENLANE_TAG ?= 2023.07.19-1
OPENLANE_IMAGE_NAME ?= efabless/openlane:$(OPENLANE_TAG)
designs = $(shell find * -maxdepth 0 -type d)
current_design = null

ROOTLESS ?= 0
USER_ARGS = -u $$(id -u $$USER):$$(id -g $$USER)
ifeq ($(ROOTLESS), 1)
	USER_ARGS =
endif

openlane_cmd = \
	"flow.tcl \
	-design $$(realpath ./$*) \
	-save_path $$(realpath ..) \
	-save \
	-tag $(OPENLANE_RUN_TAG) \
	-overwrite \
	-ignore_mismatches"
openlane_cmd_interactive = "flow.tcl -it -file $$(realpath ./$*/interactive.tcl)"

docker_mounts = \
	-v $$(realpath $(PWD)/..):$$(realpath $(PWD)/..) \
	-v $(PDK_ROOT):$(PDK_ROOT) \
	-v $(CARAVEL_ROOT):$(CARAVEL_ROOT) \
	-v $(HOME)/.ipm:$(HOME)/.ipm \
	-v $(OPENLANE_ROOT):/openlane

docker_env = \
	-e PDK_ROOT=$(PDK_ROOT) \
	-e PDK=$(PDK) \
	-e MISMATCHES_OK=1 \
	-e CARAVEL_ROOT=$(CARAVEL_ROOT) \
	-e OPENLANE_RUN_TAG=$(OPENLANE_RUN_TAG)

ifneq ($(MCW_ROOT),)
docker_env += -e MCW_ROOT=$(MCW_ROOT)
docker_mounts += -v $(MCW_ROOT):$(MCW_ROOT)
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
$(designs) : % :
ifneq (,$(wildcard ./$(current_design)/interactive.tcl))
	$(docker_run) \
		$(OPENLANE_IMAGE_NAME) sh -c $(openlane_cmd_interactive)
else
	# $(current_design)
	mkdir -p ./$*/runs/$(OPENLANE_RUN_TAG) 
	rm -rf ./$*/runs/$*
	ln -s $$(realpath ./$*/runs/$(OPENLANE_RUN_TAG)) ./$*/runs/$*
	$(docker_run) \
		$(OPENLANE_IMAGE_NAME) sh -c $(openlane_cmd)
endif
	@mkdir -p ../signoff/$*/
	@cp ./$*/runs/$*/OPENLANE_VERSION ../signoff/$*/
	@cp ./$*/runs/$*/PDK_SOURCES ../signoff/$*/
	@cp ./$*/runs/$*/reports/*.csv ../signoff/$*/

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
