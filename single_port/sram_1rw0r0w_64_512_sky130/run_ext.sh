#!/bin/sh
export OPENRAM_TECH="/home/odette/openram/technology"
echo "$(date): Starting GDS to MAG using Magic /usr/local/bin/magic"

/usr/local/bin/magic -dnull -noconsole << EOF
drc off
gds warning default
gds flatten true
gds ordering true
gds readonly true
gds read sram_1rw0r0w_64_512_sky130.gds
puts "Finished reading gds sram_1rw0r0w_64_512_sky130.gds"
load sram_1rw0r0w_64_512_sky130
puts "Finished loading cell sram_1rw0r0w_64_512_sky130"
cellname delete \(UNNAMED\)
writeall force
port makeall
extract unique all
extract style ngspice(si)
extract
puts "Finished extract"
ext2spice hierarchy on
ext2spice format ngspice
ext2spice cthresh infinite
ext2spice rthresh infinite
ext2spice renumber off
ext2spice scale off
ext2spice blackbox on
ext2spice subcircuit top on
ext2spice global off
ext2spice format ngspice
ext2spice sram_1rw0r0w_64_512_sky130
puts "Finished ext2spice"
quit -noprompt
EOF
magic_retcode=$?
echo "$(date): Finished ($magic_retcode) GDS to MAG using Magic /usr/local/bin/magic"
exit $magic_retcode
