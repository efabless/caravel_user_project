yosys -import

foreach file $::env(VERILOG_FILES) {
    read_verilog $file
}

prep -top top
synth_ecp5 -top top
write_json $::env(_output)