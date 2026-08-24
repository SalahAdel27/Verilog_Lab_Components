module seven_seg(
input wire [3 : 0] in,
output reg a, b, c, d, e, f, g
);



always @(*)begin
     case(in) 
     	4'h0: {g, f, e, d, c, b, a} = 7'b1000000; // 0 
        4'h1: {g, f, e, d, c, b, a} = 7'b1111001; // 1
        4'h2: {g, f, e, d, c, b, a} = 7'b0100100; // 2
        4'h3: {g, f, e, d, c, b, a} = 7'b0110000; // 3
        4'h4: {g, f, e, d, c, b, a} = 7'b0011001; // 4
        4'h5: {g, f, e, d, c, b, a} = 7'b0010010; // 5
        4'h6: {g, f, e, d, c, b, a} = 7'b0000010; // 6
        4'h7: {g, f, e, d, c, b, a} = 7'b1111000; // 7
        4'h8: {g, f, e, d, c, b, a} = 7'b0000000; // 8 
        4'h9: {g, f, e, d, c, b, a} = 7'b0010000; // 9
        4'hA: {g, f, e, d, c, b, a} = 7'b0001000; // A
        4'hB: {g, f, e, d, c, b, a} = 7'b0000011; // b
        4'hC: {g, f, e, d, c, b, a} = 7'b1000110; // C
        4'hD: {g, f, e, d, c, b, a} = 7'b0100001; // d
        4'hE: {g, f, e, d, c, b, a} = 7'b0000110; // E
        4'hF: {g, f, e, d, c, b, a} = 7'b0001110; // F
        default: {g, f, e, d, c, b, a} = 7'b1111111; // 
     endcase
   

end

// I could have done in the case statement: 4'd0 : {g, f, e, d, c, b, a} = 7'b1000000;
// its the same thing.. write however you like it
//assign dp = 1'b1; //since the decimal point is not needed, all 4 of them are turned off
endmodule

