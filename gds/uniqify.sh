#!/bin/bash

for f in *.gds
do 
~/openram/compiler/prefixGDS.py $(basename $f .gds) $f new_$(basename $f .gds)
done
