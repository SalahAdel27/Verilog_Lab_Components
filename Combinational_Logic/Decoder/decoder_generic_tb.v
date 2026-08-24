`timescale 1ns/1ps
module decoder_generic_tb;
//inputs
parameter n=5;
reg [n-1:0] w;
reg en;
integer k;
//outputs
wire [2**n-1:0] y;

//instantiate unit under test
decoder_generic#(.n(n)) uut(
.w(w),
.en(en),
.y(y)
);

initial #155 $stop;

// 4) Generate stimuli, using initial and always
    initial
    begin
        en = 1'b0;
    end    
    
    always 
    begin
        #5 en = ~en;
        w = 0;
        for (k = 0; k < 2 ** n; k = k + 1)
        begin
            #5 w = w + 1;
        end     
           
    end
    // 5) Display the output response (text or graphics (or both))
     
endmodule
