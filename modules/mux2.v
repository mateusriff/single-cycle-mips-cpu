module mux2 (
    input ALUSrc,
    input [31:0] read_data2,
    input [31:0] Extend32,
    output reg [31:0] ALU_B
);

    always @(*) begin
        case (ALUSrc)
            0: ALU_B = read_data2;
            1: ALU_B = Extend32;
            default: ALU_B = 32'd0;
        endcase
    end
endmodule