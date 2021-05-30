#!/bin/sh
export OPENRAM_TECH="/home/odette/openram/technology"
echo "$(date): Starting LVS using Netgen /usr/local/bin/netgen"
/usr/local/bin/netgen -noconsole << EOF
lvs {sram_1rw0r0w_64_512_sky130.spice sram_1rw0r0w_64_512_sky130} {sram_1rw0r0w_64_512_sky130.lvs.sp sram_1rw0r0w_64_512_sky130} setup.tcl sram_1rw0r0w_64_512_sky130.lvs.report -full -json
quit
EOF
magic_retcode=$?
echo "$(date): Finished ($magic_retcode) LVS using Netgen /usr/local/bin/netgen"
exit $magic_retcode
