set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) openram_testchip

set ::env(DESIGN_IS_CORE) 0
set ::env(FP_PDN_CORE_RING) 0
set ::env(GLB_RT_MAXLAYER) 5

set ::env(VERILOG_FILES) "\
	$script_dir/src/control_logic.v \
	$script_dir/src/openram_testchip.v \ 
	$script_dir/src/sky130_sram_1kbyte_1rw1r_32x256_8.v"

set ::env(CLOCK_PORT) "clk_in"
set ::env(CLOCK_PERIOD) "10"

# Fill this
set ::env(DESIGN_IS_CORE) 0
set ::env(FP_PDN_CORE_RING) 0
set ::env(GLB_RT_MAXLAYER) 5

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 900 900"

set ::env(PL_BASIC_PLACEMENT) 0

set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}


