module And_Gate(
    input branch,
    input zero,
    output reg AndGateOut
);
    always @(*) begin
        AndGateOut <= branch && zero;
    end

endmodule