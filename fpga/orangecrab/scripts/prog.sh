#!/bin/sh
rm -f $1.dfu
cp $1 $1.dfu
dfu-suffix -v 1209 -p 5af0 -a $1.dfu
dfu-util -a0 -D $1.dfu