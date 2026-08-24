module Q2_design (
    input [2:0] D,
    input A,B,C,sel,
    output reg out,
    output reg out_bar
);
reg o_and , o_or , o_xnor;

always @(*) begin
    o_and  = D[0] & D[1];
    o_or   = o_and | D[2];
    o_xnor = ~(A ^ B ^ C);

    out = (sel) ? o_xnor : o_or;

    out_bar = ~out;
end

endmodule