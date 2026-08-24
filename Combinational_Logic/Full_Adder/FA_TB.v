`timescale 1ns/1ps
module FA_TB();
    // Inputs declaration
    reg A;
    reg B;
    reg CIN;

    // Outputs for each DUT
    wire SUM_df, C_OUT_df;     // Dataflow
    wire SUM_beh, C_OUT_beh;   // Behavioral
    wire SUM_gate, C_OUT_gate; // Gate-level
    wire SUM_str, C_OUT_str;   // Structural

    // Error and Correct counters
    integer err_count = 0;
    integer correct_count = 0;

    // Expected (Golden) values based on exact math
    wire [1:0] expected_sum_cin = A + B + CIN;
    wire expected_sum = expected_sum_cin[0];
    wire expected_cout = expected_sum_cin[1];

    // Instantiate Design Under Test (DUT1: Dataflow)
    FA_dataflow DUT1 (
        .A(A), .B(B), .CIN(CIN),
        .C_OUT(C_OUT_df), .SUM(SUM_df)
    );

    // Instantiate DUT2 (Behavioral)
    fa_beh DUT2 (
        .A(A), .B(B), .CIN(CIN),
        .C_OUT(C_OUT_beh), .SUM(SUM_beh)
    );

    // Instantiate DUT3 (Gate-level)
    fa_gate_level DUT3 (
        .A(A), .B(B), .CIN(CIN),
        .C_OUT(C_OUT_gate), .SUM(SUM_gate)
    );

    // Instantiate DUT4 (Structural)
    fa_structure DUT4 (
        .A(A), .B(B), .CIN(CIN),
        .C_OUT(C_OUT_str), .SUM(SUM_str)
    );

    // Generate inputs & monitoring outputs with CHECK
    initial begin
        // Initialize inputs
        A = 0; B = 0; CIN = 0;
        #10;
        
        repeat(10) begin
            A = $random;
            B = $random;
            CIN = $random;
            #10; // Wait for propagation
            
            // Check all DUTs against expected results
            if (
                (SUM_df !== expected_sum || C_OUT_df !== expected_cout) ||
                (SUM_beh !== expected_sum || C_OUT_beh !== expected_cout) ||
                (SUM_gate !== expected_sum || C_OUT_gate !== expected_cout) ||
                (SUM_str !== expected_sum || C_OUT_str !== expected_cout)
            ) begin
                err_count = err_count + 1;
                $display("Time=%0t | ERROR: A=%b B=%b CIN=%b | Expected(Sum=%b, Cout=%b)", 
                         $time, A, B, CIN, expected_sum, expected_cout);
            end else begin
                correct_count = correct_count + 1;
                $display("Time=%0t | CORRECT: A=%b B=%b CIN=%b", 
                         $time, A, B, CIN);
            end
        end

        // Final Report
        #10;
        $display("----------------------------------------");
        $display("Simulation Finished.");
        $display("Total Correct Cases : %0d", correct_count);
        $display("Total Error Cases   : %0d", err_count);
        $display("----------------------------------------");
        $stop;
    end

endmodule