module FA_dataflow(
    input wire A,
    input wire B,
    input wire CIN,
    output wire C_OUT,
    output wire SUM
);
assign {C_OUT , SUM} = A + B + CIN;

endmodule
