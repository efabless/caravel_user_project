`timescale 1ns/1ns

`include "control_logic.v"

module control_logic_tb;

//Instantitate port connections

control_logic uut();

initial begin
    $dumpfile("control_logic_tb.vcd")
    $dumpvars(0, control_logic_tb)

    //Pass in inputs

    //Figure out how to "expect" values
    
    $display("Test Complete")
end
endmodule