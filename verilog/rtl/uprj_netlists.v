
// Include caravel global defines for the number of the user project IO pads 
`include "defines.v"

`ifdef GL
    `include "gl/user_project_wrapper.v"
    `include "gl/user_proj_example.v"
`else
    `include "user_project_wrapper.v"
    `include "user_proj_example.v"
`endif