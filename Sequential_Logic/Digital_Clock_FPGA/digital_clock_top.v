module digital_clock_top #(
    parameter CLK_DIV_N = 50_000_000 // 50MHz to 1Hz
)(
    input  wire       clk_ref, // Reference Clock
    input  wire       rst_n,    // Active-Low Reset
    
    output wire [6:0] HEX0, HEX1, // Seconds Displays
    output wire [6:0] HEX2, HEX3, // Minutes Displays
    output wire [6:0] HEX4, HEX5  // Hours Displays
);

    // Wires between blocks
    wire       clk_1hz;
    wire [5:0] ss, mm, hh;
    // Unconnected hundreds display outputs (since max time values are 59/23)
    wire [6:0] nc_sec_hundreds;
    wire [6:0] nc_min_hundreds;
    wire [6:0] nc_hrs_hundreds;
    // Block 1: clock_divider
    clock_divider #(
        .N(CLK_DIV_N)
    ) u_clock_divider (
        .Clk         (clk_ref),
        .Rst         (rst_n),
        .Clk_div_out (clk_1hz)
    );

    // Block 2: digital_clock
    DIGITAL_CLOCK u_digital_clock (
        .clk   (clk_1hz),
        .rst_n (rst_n),
        .ss    (ss),
        .mm    (mm),
        .hh    (hh)
    );

    // 3. Seconds Display Controller
    top_bin2bcd_7seg u_sec_display (
        .bin_in       ({2'b00, ss}),
        .seg_units    (HEX0),
        .seg_tens     (HEX1),
        .seg_hundreds (nc_sec_hundreds)
    );

    // 4. Minutes Display Controller
    top_bin2bcd_7seg u_min_display (
        .bin_in       ({2'b00, mm}),
        .seg_units    (HEX2),
        .seg_tens     (HEX3),
        .seg_hundreds (nc_min_hundreds)
    );

    // 5. Hours Display Controller
    top_bin2bcd_7seg u_hrs_display (
        .bin_in       ({2'b00, hh}),
        .seg_units    (HEX4),
        .seg_tens     (HEX5),
        .seg_hundreds (nc_hrs_hundreds)
    );
endmodule