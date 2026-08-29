module bin2bcd_8bit (
input wire [7:0] bin_in,         // Binary input (0 to 255)
output reg [3:0] bcd_hundreds,  // Hundreds digit
output reg [3:0] bcd_tens,      // Tens digit
output reg [3:0] bcd_units      // Units digit
);

integer i;

always @(*) begin
// 1. Clear the digits at the start of each calculation to avoid latches
bcd_hundreds = 4'd0;
bcd_tens = 4'd0;
bcd_units = 4'd0;

// 2. Repeat the process 8 times equal to the number of input bits (Double Dabble)
for (i = 0; i < 8; i = i + 1) begin

        // Add 3 to any BCD digit that is 5 or more
        if (bcd_hundreds >= 4'd5)
             bcd_hundreds = bcd_hundreds + 4'd3;

        if (bcd_tens >= 4'd5)
            bcd_tens = bcd_tens + 4'd3;

        if (bcd_units >= 4'd5)
            bcd_units = bcd_units + 4'd3;

        // 3. Shift left and input the next bit from bin_in
        bcd_hundreds = {bcd_hundreds[2:0], bcd_tens[3]};
        bcd_tens     = {bcd_tens[2:0], bcd_units[3]};
        bcd_units    = {bcd_units[2:0], bin_in[7 - i]};
        end

    end

endmodule