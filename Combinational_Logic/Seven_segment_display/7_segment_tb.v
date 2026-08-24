`timescale 1ns / 1ns
module seven_seg_tb;
//inputs
reg  [3 : 0] in;
//outputs
wire a;
wire b;
wire c;
wire d;
wire e;
wire f;
wire g;
//wire dp;
//wire [3:0] an;
integer i;
// Instantiate the Unit Under Test (UUT)
seven_seg uut(
.in(in),
.a(a),
.b(b),
.c(c),
.d(d),
.e(e),
.f(f),
.g(g)
    );

initial begin
 for (i = 0 ; i < 16 ; i = i + 1) begin
    in = i;
    #10; 
 $display("Time = %0t ns | Input = %0d | Segments Value (Dec) = %0h", 
         $time, in, {a, b, c, d, e, f, g});
    
 end  
$stop;
end  
endmodule
