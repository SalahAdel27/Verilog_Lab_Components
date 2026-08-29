module DIGITAL_CLOCK (
    input  wire       clk,    // 1 Hz Clock input
    input  wire       rst_n,  // Active-low asynchronous reset
    output reg  [5:0] ss,     // Seconds binary counter (0 to 59)
    output reg  [5:0] mm,     // Minutes binary counter (0 to 59)
    output reg  [5:0] hh      // Hours binary counter (0 to 23)
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        ss <= 6'b0;
        mm <= 6'b0;
        hh <= 6'b0;
    end else begin
        // Seconds Counter (0 to 59)
        if (ss == 6'd59) begin
            ss <= 6'b0;

            // Minutes Counter (0 to 59)
            if (mm == 6'd59) begin
                mm <= 6'd0;

                // Hours Counter (0 to 23 - 24hr format)
                if (hh == 6'd23) begin
                    hh <= 6'd0;
                end else begin
                    hh <= hh + 6'd1;
                end

            end else begin
                mm <= mm + 6'd1;
            end

        end else begin
            ss <= ss + 6'd1;
        end
    end
end

endmodule