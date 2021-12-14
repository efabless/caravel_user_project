#!/bin/bash

for f in *.gds
do 
mv $f old_$f
~/openram/compiler/uniquifyGDS.py sky130_fd_bd_sram old_$f $f
done
