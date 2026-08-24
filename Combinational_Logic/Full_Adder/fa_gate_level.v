module fa_gate_level(
    input wire A,
    input wire B,
    input wire CIN,
    output wire C_OUT,
    output wire SUM
);
wire w1, w2, w3, w4;
xor x1 (w1, A, B);
xor x2 (SUM, w1, CIN);
and a1 (w2, A, B);
and a2 (w3, w1, CIN);
or  o1 (C_OUT, w2, w3);
endmodule