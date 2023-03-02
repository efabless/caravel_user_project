Overview
======== 
This directory contain tests to verify the example user project 16 bit counter and 2 other simple tests as examples. 

directory hierarchy
=====================

# counter_tests 
 
contain tests for 16 bit counter for more info refer to [counter_tests](counter_tests/README.md)
 
 # hello_world 
 
 Example test with empty firmware that only power and reset caravel the print "Hello World" 
 
 # hello_world_uart 
 
 Example test That uses the firmware to send "Hello World" using UART TX 
 
 # cocotb_includes.py
 
 Read only file that imports cocotb based APIs. needed to be imported on the test to use the cocotb based APIs. 
 
 
# cocotb_tests.py 

Module that should import all the tests used to be seen for cocotb as a test

 

