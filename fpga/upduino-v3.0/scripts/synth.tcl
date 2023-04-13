yosys -import

foreach file $::env(VERILOG_FILES) {
    read_verilog $file
}

synth_ice40 -top top
write_json $::env(_output)