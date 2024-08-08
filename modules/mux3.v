module mux3 (
    input [31:0] read_data,
    input [31:0] ALU_result,
    input memtoreg,
    output reg [31:0] WriteData_reg
);

    always @(*) begin
        case (memtoreg)
            0: WriteData_reg = ALU_result;
            1: WriteData_reg = read_data;
            default: WriteData_reg = 32'd0; 
        endcase
    end
endmodule