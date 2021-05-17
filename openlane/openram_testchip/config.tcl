set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) openram_testchip

set ::env(DESIGN_IS_CORE) 0
set ::env(FP_PDN_CORE_RING) 0
set ::env(GLB_RT_MAXLAYER) 5

set ::env(VERILOG_FILES) "\
	$script_dir/../../verilog/rtl/testchip/control_logic.v \
	$script_dir/../../verilog/rtl/testchip/openram_testchip.v \ 
	$script_dir/../../verilog/rtl/testchip/sky130_sram_1kbyte_1rw1r_32x256_8.v"

set ::env(CLOCK_PORT) "clk_in"
set ::env(CLOCK_NET) "clk_in"
set ::env(CLOCK_PERIOD) "10"

# Fill this
set ::env(DESIGN_IS_CORE) 0
set ::env(FP_PDN_CORE_RING) 0
set ::env(GLB_RT_MAXLAYER) 5

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 1200 1200"

set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0
set ::env(PL_RANDOM_GLB_PLACEMENT) 1
set ::env(PL_BASIC_PLACEMENT) 1
set ::env(PL_TARGET_DENSITY) 0.99

# Power config
set ::env(PDN_CFG) $script_dir/pdn.tcl

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}


