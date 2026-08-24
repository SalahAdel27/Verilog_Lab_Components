module priority_encoder_generic_tb;
//inputs
parameter n=4;	
reg [3:0] w;
integer k;
//outputs
wire z;
wire [1:0] y;
//instantiate unit under test 
priority_encoder_generic #(.n(n)) uut(
.w(w),
.z(z),
.y(y)
);

initial #(10 * 2**n +10) $finish;

// 4) Generate stimuli, using initial and always
    initial
    begin
w = 0;
        for (k = 0; k < 2**n * 2; k = k + 1)
        begin
            #5 w = w + 1;
        end        
    end
    // 5) Display the output response (text or graphics (or both))
     
endmodule
