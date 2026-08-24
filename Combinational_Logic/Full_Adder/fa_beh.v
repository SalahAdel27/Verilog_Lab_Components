module fa_beh(
    input wire A,
    input wire B,
    input wire CIN,
    output reg  C_OUT,
    output reg SUM    
);
always @(*) begin
{C_OUT , SUM} = A + B + CIN;
    
end
endmodule