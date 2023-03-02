
Tests hierarchy
=====================

# counter_wb 
 
Test that overwrite the counter value using wishbone interface 
 
 # counter_la 
 
Test that overwrite the counter value using logic analyzer interface 
 
 # counter_la_clk 
 
Counter can work by 2 different clocks wishbone clock or clock provided through logic analyzers.
By default the wishbone clock is the used one. This test uses the logic analyzers clock


 # counter_la_reset
 
Counter reset also provided through wishbone or logic analyzers. this test uses the logic analyzers reset  
 
# counter_tests.yaml

Testlist contain all counter tests
 
