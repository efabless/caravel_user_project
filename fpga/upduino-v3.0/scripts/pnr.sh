#!/bin/sh
eval $BOARD_CONF
set -x
nextpnr-ice40 --hx4k --json $2 --pcf $BOARD_FOLDER/io.pcf --asc $1