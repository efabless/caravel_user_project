module BB(
    input I,
    input T,
    output O,
    inout B
);

    assign O = B;
    assign B = T ? 1'bz: I;

endmodule

