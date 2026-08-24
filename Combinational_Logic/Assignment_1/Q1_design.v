module Q1_design(
    input A,B,C,D,E,F,sel,
    output out,out_bar
);
wire o_and,o_xnor;
assign o_and = A & B & C;
assign o_xnor = ~(D ^ E ^ F);
assign out = (sel==1)? o_xnor:  o_and ;
assign out_bar = ~ out;

endmodule