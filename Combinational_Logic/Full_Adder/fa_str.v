module ha (
    input a,
    input b,
    output cout,
    output sum
);
    assign cout = a & b;
    assign sum  = a ^ b;
endmodule

module fa_structure(
    input wire A,
    input wire B,
    input wire CIN,
    output wire C_OUT,
    output wire SUM
    );
wire ha1_sum, ha1_cout;
wire ha2_cout;
ha ha_inst1 (
        .a(A),
        .b(B),
        .cout(ha1_cout),
        .sum(ha1_sum)
    );

ha ha_inst2 (
        .a(ha1_sum),
        .b(CIN),
        .cout(ha2_cout),
        .sum(SUM)
    );
 assign C_OUT = ha1_cout | ha2_cout;
endmodule


