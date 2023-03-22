module BB(
    input I,
    output O,
    input T,
    inout B
);
    assign B = T ? I : 1'bz;
    assign O = T ? 1'bx: B;

endmodule

