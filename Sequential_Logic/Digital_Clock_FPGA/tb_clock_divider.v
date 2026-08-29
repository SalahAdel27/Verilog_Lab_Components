`timescale 1ns/1ps
module tb_clock_divider();
//inputs & outputs & parameter declaration
// Parameters 
integer errors = 0;
reg Clk;
reg Rst;
    
wire clk_div_2;
wire clk_div_4;
wire clk_div_6;
wire clk_div_8;
    
time last_edge_2, last_edge_4, last_edge_6, last_edge_8;
time period_2, period_4, period_6, period_8;


    clock_divider #(.N(2)) div2_inst (
        .Clk(Clk), .Rst(Rst), .Clk_div_out(clk_div_2)
    );

    clock_divider #(.N(4)) div4_inst (
        .Clk(Clk), .Rst(Rst), .Clk_div_out(clk_div_4)
    );

    clock_divider #(.N(6)) div6_inst (
        .Clk(Clk), .Rst(Rst), .Clk_div_out(clk_div_6)
    );

    clock_divider #(.N(8)) div8_inst (
        .Clk(Clk), .Rst(Rst), .Clk_div_out(clk_div_8)
    );

    
    task check_period(
        input time last_edge,
        input time expected_period,
        input integer div_factor,
        output time calculated_period
    );
        begin
            calculated_period = $time - last_edge;
            if (last_edge != 0 && $time > 100) begin 
                if (calculated_period !== expected_period) begin
                    $display("ERROR at %0t ns: Clk_div_%0d period is %0d ns (Expected: %0d ns)", 
                             $time, div_factor, calculated_period, expected_period);
                    errors = errors + 1;
                end else begin
                    $display("SUCCESS: Clk_div_%0d period verified = %0d ns", div_factor, calculated_period);
                end
            end
        end
    endtask

    always @(posedge clk_div_2) begin
        check_period(last_edge_2, 20, 2, period_2); 
        last_edge_2 = $time;
    end

    always @(posedge clk_div_4) begin
        check_period(last_edge_4, 40, 4, period_4); 
        last_edge_4 = $time;
    end

    always @(posedge clk_div_6) begin
        check_period(last_edge_6, 60, 6, period_6); 
        last_edge_6 = $time;
    end

    always @(posedge clk_div_8) begin
        check_period(last_edge_8, 80, 8, period_8); 
        last_edge_8 = $time;
    end
always #5 Clk = ~Clk;

    initial begin
        Clk = 0;
        Rst = 0;
        last_edge_2 = 0;
        last_edge_4 = 0;
        last_edge_6 = 0;
        last_edge_8 = 0;
        
        $display("--- Starting Parameterized Clock Divider Verification ---");

        Rst = 1; 
        #15; 
        Rst = 0; 

        #1000;

        $display("\n---------------------------------------------------------");
        if (errors == 0) begin
            $display("SUCCESS: All 4 Parameterized Clock Dividers Verified Successfully!");
            $display("Outputs generate strictly: Clk/2, Clk/4, Clk/6, and Clk/8.");
        end else begin
            $display("FAILURE: Verification Failed with %0d errors.", errors);
        end
        $display("---------------------------------------------------------");

        $stop;
    end

endmodule