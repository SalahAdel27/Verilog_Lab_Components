module priority_encoder_generic #(parameter n=4)(
input [n-1:0] w,
output z,
output reg [$clog2(n)-1:0] y
    );
    localparam out_width =$clog2(n) ;
    assign z=|w;
     integer k;
     always@(*)
    begin
    y={out_width{1'bx}};
    for(k=0 ; k < n ; k = k + 1)
    begin
    if(w[k])
    y=k;
    end
    end
endmodule
