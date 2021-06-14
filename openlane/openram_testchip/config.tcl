set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) openram_testchip

set ::env(DESIGN_IS_CORE) 0
set ::env(FP_PDN_CORE_RING) 0
set ::env(GLB_RT_MAXLAYER) 5

set ::env(VERILOG_FILES) "$script_dir/../../verilog/rtl/openram_defines.v \
			 $script_dir/../../verilog/rtl/openram_testchip.v"
set ::env(BASE_SDC_FILE) "$script_dir/openram_testchip.sdc"

set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET) "clk sram_clk"
#set ::env(CLOCK_NET) ""
set ::env(CLOCK_PERIOD) "20"
set ::env(IO_PCT) 0.1

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 400 2600"
set ::env(DESIGN_IS_CORE) 0

set ::env(VDD_NETS) [list {vccd1} {vccd2} {vdda1} {vdda2}]
set ::env(GND_NETS) [list {vssd1} {vssd2} {vssa1} {vssa2}]

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

#set ::env(SYNTH_NO_FLAT) 1
set ::env(GLB_RT_ADJUSTMENT) 0.20
set ::env(RUN_KLAYOUT_DRC) 0
set ::env(PL_TARGET_DENSITY) 0.40

# This doesn't check for supply connectivity:
set ::env(FP_PDN_CHECK_NODES) 0

# If you're going to use multiple power domains, then keep this disabled.
set ::env(RUN_CVC) 0
