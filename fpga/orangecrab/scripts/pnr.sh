#!/bin/sh
eval $BOARD_CONF
set -x
nextpnr-ecp5 --textcfg $1 --$luts --package CSFBGA285 --lpf $BOARD_FOLDER/$revision.pcf --json $2