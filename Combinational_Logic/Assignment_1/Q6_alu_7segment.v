module S_segment_display #(parameter N=4 )(
        input [N-1 : 0] A , B ,
        input [1 : 0]   opcode ,
        input enable ,
        output reg a,b,c,d,e,f,g

);
wire  [N-1 : 0] Result;
ALU_N_BIT #(.N(N)) ALU ( .in0(A),.in1(B),.opcode(opcode),.out(Result) );

always @(*)begin
  if(!enable)
   {a,b,c,d,e,f,g} = 7'bx ;
   else begin
     case(Result) 
     4'h0:  {a,b,c,d,e,f,g} = 7'b1111110;
     4'h1:  {a,b,c,d,e,f,g} = 7'b0110000;
     4'h2:  {a,b,c,d,e,f,g} = 7'b1101101;
     4'h3:  {a,b,c,d,e,f,g} = 7'b1111001;
     4'h4:  {a,b,c,d,e,f,g} = 7'b0110011;
     4'h5:  {a,b,c,d,e,f,g} = 7'b1011011;
     4'h6:  {a,b,c,d,e,f,g} = 7'b1011111;
     4'h7:  {a,b,c,d,e,f,g} = 7'b1110000;
     4'h8:  {a,b,c,d,e,f,g} = 7'b1111111;
     4'h9:  {a,b,c,d,e,f,g} = 7'b1111011;
     4'hA:  {a,b,c,d,e,f,g} = 7'b1110111;
     4'hB:  {a,b,c,d,e,f,g} = 7'b0011111;
     4'hC:  {a,b,c,d,e,f,g} = 7'b1001110;
     4'hD:  {a,b,c,d,e,f,g} = 7'b0111101;
     4'hE:  {a,b,c,d,e,f,g} = 7'b1001111;
     4'hF:  {a,b,c,d,e,f,g} = 7'b1000111;
     default:{a,b,c,d,e,f,g} = 7'b0;
     endcase
   end

end
endmodule