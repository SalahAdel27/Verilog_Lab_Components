module clock_divider #(
    parameter N = 2
)(
    input Clk , Rst ,
    output reg Clk_div_out
);

    localparam HALF = N/2;
    localparam CNT_WIDTH = (HALF > 1) ? $clog2(HALF) : 1;
    
    reg [CNT_WIDTH-1:0] count;

    always @(posedge Clk or negedge Rst) begin
        if (!Rst) begin
            count       <= 0;
            Clk_div_out <= 1'b0; 
        end else begin
            if (count == (HALF - 1)) begin
                count       <= 0;             
                Clk_div_out <= ~Clk_div_out;  
            end else begin
                count <= count + 1'b1;       
            end
        end
    end

endmodule