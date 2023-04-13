BOARD?=orangecrab
export BOARD_CONF?=luts=85k;revision=r2;

export BOARD_FOLDER=fpga/$(BOARD)

export VERILOG_FILES = verilog/rtl/defines.v\
	$(BOARD_FOLDER)/defines.v\
	verilog/rtl/user_proj_example.v\
	verilog/rtl/user_project_wrapper.v\
	fpga/caravel_fpga.v\
	$(BOARD_FOLDER)/top.v

BUILD_FOLDER=$(BOARD_FOLDER)/build

all: $(BUILD_FOLDER)/top.bit

$(BUILD_FOLDER)/top.json: $(VERILOG_FILES)
	mkdir -p $(@D)
	_output=$@ yosys -c $(BOARD_FOLDER)/scripts/synth.tcl

$(BUILD_FOLDER)/top.config: $(BUILD_FOLDER)/top.json
	sh $(BOARD_FOLDER)/scripts/pnr.sh $@ $<

$(BUILD_FOLDER)/top.bit: $(BUILD_FOLDER)/top.config
	sh $(BOARD_FOLDER)/scripts/bitstream.sh $@ $<


.PHONY: lint
lint: $(VERILOG_FILES) $(BOARD_FOLDER)/sim/models.v
	iverilog -Wall $^ -o /dev/null

.PHONY: sim
sim: $(BOARD_FOLDER)/sim/tb.v $(VERILOG_FILES) $(BOARD_FOLDER)/sim/models.v
	iverilog -Wall $^ -o /tmp/sim.out
	vvp /tmp/sim.out
	rm -f /tmp/sim.out

.PHONY: prog
prog: $(BUILD_FOLDER)/top.bit
	sh $(BOARD_FOLDER)/scripts/prog.sh $<