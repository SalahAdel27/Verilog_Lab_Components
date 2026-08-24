module decoder_generic#(parameter n=4)(
input [n-1:0] w,
input en,
output reg [2**n-1:0] y
    );
    localparam out_width = 2**n ;
     //integer k;
     always@(*)
    begin
   //y=0;
    y = {out_width {1'b0}};
    if(en==1)
    y[w]=1'b1;
    end
endmodule
