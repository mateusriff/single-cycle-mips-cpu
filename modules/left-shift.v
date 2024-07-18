module shift_left_by_2 (
    input [31:0] a,
    output reg [31:0] y
);
    always @* begin
        y = {a[29:0], 2'b00}; 
    end
endmodule