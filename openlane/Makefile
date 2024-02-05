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

# set shell bash to the do while loop below
SHELL := /usr/bin/env bash
export OPENLANE2_RUN_TAG = $(shell date '+%y_%m_%d_%H_%M')
export CARAVEL_ROOT:=$(CARAVEL_ROOT)
export PDK:=$(PDK)
export PDK_ROOT:=$(PDK_ROOT)
OPENLANE2_TAG ?= 2023.07.19-1
OPENLANE2_IMAGE_NAME ?= efabless/openlane:$(OPENLANE2_TAG)
designs = $(shell cd $(PROJECT_ROOT)/openlane && find * -maxdepth 0 -type d)
current_design = null
OPENLANE2_USE_NIX ?= 0
ROOTLESS ?= 0
USER_ARGS = -u $$(id -u $$USER):$$(id -g $$USER)
ifeq ($(ROOTLESS), 1)
	USER_ARGS =
endif

openlane_args = \
	--run-tag $(OPENLANE2_RUN_TAG) \
	--manual-pdk \
	--pdk-root $(PDK_ROOT) \
	--pdk $(PDK) \
	--log-level WARN \
	$(PROJECT_ROOT)/openlane/$*/config.json

docker_mounts = \
	-m $(PROJECT_ROOT)\
	-m $(PDK_ROOT) \
	-m $(CARAVEL_ROOT)

docker_env = \
	-e PDK_ROOT=$(PDK_ROOT) \
	-e PDK=$(PDK) \
	-e CARAVEL_ROOT=$(CARAVEL_ROOT) \
	-e OPENLANE2_RUN_TAG=$(OPENLANE2_RUN_TAG)

ifneq ($(MCW_ROOT),)
docker_env += -e MCW_ROOT=$(MCW_ROOT)
export MCW_ROOT:=$(MCW_ROOT)
docker_mounts += -m $(MCW_ROOT)
endif

docker_startup_mode = $(shell test -t 0 && echo "-it" || echo "--rm" )
openlane_extra_args = $(shell test -t 0 || echo "--docker-no-tty")
docker_run = \
	docker run $(docker_startup_mode) \
	$(USER_ARGS) \
	$(docker_mounts) \
	$(docker_env) \

list:
	@echo $(designs)

.PHONY: $(designs)
$(designs) : export current_design=$@
$(designs) : % : $(PROJECT_ROOT)/openlane/%/config.json
	# $(current_design)
	@rm -rf $(PROJECT_ROOT)/openlane/$*/runs/$(OPENLANE2_RUN_TAG)
ifeq ($(OPENLANE2_USE_NIX),1)
	nix-shell --pure --command "openlane $(openlane_args) $(openlane_extra_args)"
else
	$(PROJECT_ROOT)/openlane2-venv/bin/python3 -m openlane $(docker_mounts) $(openlane_extra_args) --dockerized $(openlane_args) $(openlane_extra_args)
endif<<<<<<< HEADES
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/final/*.csv $(PROJECT_ROOT)/signoff/$*/
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/final/def/* $(PROJECT_ROOT)/def/$*.def
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/final/sdc/* $(PROJECT_ROOT)/sdc/$*.sdc
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/final/gds/* $(PROJECT_ROOT)/gds/$*.gds
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/final/lef/* $(PROJECT_ROOT)/lef/$*.lef
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/*magic-streamout/*.mag $(PROJECT_ROOT)/mag/$*.mag
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/final/pnl/* $(PROJECT_ROOT)/verilog/gl/$*.v
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/final/spice/* $(PROJECT_ROOT)/spi/lvs/$*.spice
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/final/spef/nom_/* $(PROJECT_ROOT)/spef/multicorner/$*.nom.spef
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/final/spef/nom_/* $(PROJECT_ROOT)/spef/$*.spef
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/final/spef/min_/* $(PROJECT_ROOT)/spef/multicorner/$*.min.spef
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/final/spef/max_/* $(PROJECT_ROOT)/spef/multicorner/$*.max.spef
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/final/lib/nom*tt*/* $(PROJECT_ROOT)/lib/$*.lib
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/resolved.json $(PROJECT_ROOT)/signoff/$*/
	@mkdir -p $(PROJECT_ROOT)/signoff/$*/openlane-signoff/timing-reports
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/*magic-drc/reports/* $(PROJECT_ROOT)/signoff/$*/openlane-signoff/
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/*netgen-lvs/lvs.rpt $(PROJECT_ROOT)/signoff/$*/openlane-signoff/
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/*netgen-lvs/lvs.rpt $(PROJECT_ROOT)/signoff/$*/openlane-signoff/
	@cp $(PROJECT_ROOT)/openlane/$*/runs/$*/*netgen-lvs/netgen-lvs.log $(PROJECT_ROOT)/signoff/$*/openlane-signoff/
	@cp -r $(PROJECT_ROOT)/openlane/$*/runs/$*/*openroad-stapostpnr/summary.rpt $(PROJECT_ROOT)/signoff/$*/openlane-signoff/timing-reports
# https://github.com/koalaman/shellcheck/wiki/SC2044
	@while IFS= read -r -d '' file ; \
	do \
		target_dir=$(PROJECT_ROOT)/signoff/$*/openlane-signoff/timing-reports/$$(basename $$(dirname $$file)); \
		mkdir -p $$target_dir; \
		cp $$file $$target_dir/; \
	done < <(find $(PROJECT_ROOT)/openlane/$*/runs/$*/*openroad-stapostpnr/*/*.rpt -type 'f' -print0)
	@while IFS= read -r -d '' file ; \
	do \
		target_dir=$(PROJECT_ROOT)/signoff/$*/sdf/$$(basename $$(dirname $$file)); \
		mkdir -p $$target_dir; \
		cp $$file $$target_dir/$*.sdf; \
	done < <(find $(PROJECT_ROOT)/openlane/$*/runs/$*/final/sdf -type 'f' -print0)
