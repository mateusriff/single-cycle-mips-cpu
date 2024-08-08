module mux4(
    input [31:0] adder1_out, adder2_out,
    input AndGateOut,
    output reg [31:0] pc_in
);
    initial begin
        pc_in <= 0;
    end
    always @(*) begin
        case (AndGateOut)
            0: pc_in <= adder1_out;
            1: pc_in <= adder2_out;
        endcase
    end
endmodule