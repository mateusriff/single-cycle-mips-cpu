/// utilizei o input do ALU control com 3 bits como ta no livro mas to na duvida
/// também deixei os inputs como A e B mesmo diferente da referência scrA e scrB pra ficar mais fácil
module ALU (
    input[2:0] ALU_Control;
    input[31:0] A,B;
    output reg[31:0] ALU_result;
    output zero
);

parameter AND = 3'b000;
parameter ADD = 3'b010;
parameter SUB = 3'b110;
parameter OR = 3'b001;
parameter SLT = 3'b111;

always @(*) begin
    case(ALU_Control)
        AND: ALU_result = A & B;
        ADD: ALU_result = A + B;
        SUB: ALU_result = A - B;
        OR: ALU_result = A | B;
        SLT: ALU_result = A < B ? 1:0;
        default: ALU_result = 32'd0;
    endcase
end
    
assign zero = (ALU_result == 32'd0) ? 1'b1 : 1'b0;

endmodule
