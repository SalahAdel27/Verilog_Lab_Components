module top_bin2bcd_7seg (
    input  wire [7:0] bin_in,          // 8-bit binary input (0 to 255)

    
    // 7-segment segment outputs for each digit (g, f, e, d, c, b, a)
    output wire [6:0] seg_hundreds,    // Hundreds digit 7-segment pins
    output wire [6:0] seg_tens,        // Tens digit 7-segment pins
    output wire [6:0] seg_units      // Units digit 7-segment pins
    
 
);

    // 1. Internal interconnect wires to carry BCD digits
    wire [3:0] bcd_hundreds;
    wire [3:0] bcd_tens;
    wire [3:0] bcd_units;

    // 2. Instantiate 8-bit Binary to BCD converter
    bin2bcd_8bit u_bin2bcd (
        .bin_in       (bin_in),
        .bcd_hundreds (bcd_hundreds),
        .bcd_tens     (bcd_tens),
        .bcd_units    (bcd_units)
    );

    // 3. Instantiate 7-segment decoder for Units digit
    seven_seg u_seg_units (
        .in (bcd_units),
        .g  (seg_units[6]),
        .f  (seg_units[5]),
        .e  (seg_units[4]),
        .d  (seg_units[3]),
        .c  (seg_units[2]),
        .b  (seg_units[1]),
        .a  (seg_units[0])
    );

    // 4. Instantiate 7-segment decoder for Tens digit
    seven_seg u_seg_tens (
        .in (bcd_tens),
        .g  (seg_tens[6]),
        .f  (seg_tens[5]),
        .e  (seg_tens[4]),
        .d  (seg_tens[3]),
        .c  (seg_tens[2]),
        .b  (seg_tens[1]),
        .a  (seg_tens[0])
    );

    // 5. Instantiate 7-segment decoder for Hundreds digit
    seven_seg u_seg_hundreds (
        .in (bcd_hundreds),
        .g  (seg_hundreds[6]),
        .f  (seg_hundreds[5]),
        .e  (seg_hundreds[4]),
        .d  (seg_hundreds[3]),
        .c  (seg_hundreds[2]),
        .b  (seg_hundreds[1]),
        .a  (seg_hundreds[0])
    );

 

endmodule