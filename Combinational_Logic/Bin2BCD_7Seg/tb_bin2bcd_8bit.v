`timescale 1ns / 1ps

module tb_bin2bcd_8bit;

//inputs & outputs & parameter declaration
// INPUT DECLARATION     
    reg  [7:0] bin_in;
// OUTPUTS DECLARATION 
    wire [3:0] bcd_hundreds;
    wire [3:0] bcd_tens;
    wire [3:0] bcd_units;

//instantiate the Design Under Test (DUT)
    bin2bcd_8bit DUT (
        .bin_in      (bin_in),
        .bcd_hundreds(bcd_hundreds),
        .bcd_tens    (bcd_tens),
        .bcd_units   (bcd_units)
    );

//initial inputs and drive signals and display output & generate clock signal
    initial begin
        $display("--------------------------------------------------");
        $display(" Time | Binary In | BCD Hundreds | BCD Tens | BCD Units ");
        $display("--------------------------------------------------");

        // MIN VALUE 0 
        bin_in = 8'd0; #10;
        $display("%t | %d | %d | %d | %d", $time, bin_in, bcd_hundreds, bcd_tens, bcd_units);

        // 49 
        bin_in = 8'd49; #10;
        $display("%t | %d | %d | %d | %d", $time, bin_in, bcd_hundreds, bcd_tens, bcd_units);

        // 157
        bin_in = 8'd157; #10;
        $display("%t | %d | %d | %d | %d", $time, bin_in, bcd_hundreds, bcd_tens, bcd_units);

        // MAX VALUE 255
        bin_in = 8'd255; #10;
        $display("%t | %d | %d | %d | %d", $time, bin_in, bcd_hundreds, bcd_tens, bcd_units);

        // 99
        bin_in = 8'd99;  #10;
        $display("%t | %d | %d | %d | %d", $time, bin_in, bcd_hundreds, bcd_tens, bcd_units);
        
        // 200
        bin_in = 8'd200; #10;
        $display("%t | %d | %d | %d | %d", $time, bin_in, bcd_hundreds, bcd_tens, bcd_units);

        //OUT OF ZONE
        bin_in = 8'd256; #10;
        $display("%t | %d | %d | %d | %d", $time, bin_in, bcd_hundreds, bcd_tens, bcd_units);
        $display("--------------------------------------------------");
        $stop;
    end

endmodule