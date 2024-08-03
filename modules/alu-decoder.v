module ALU_decoder(
    input [5:0] funct,
    input[1:0] ALUop,
    output reg [2:0] ALU_control
);
  always@(*)
    case(ALUop)
        2'b00: ALU_control <= 3'b010;
        2'b01: ALU_control <= 3'b110;
        default: 
          case(funct)
            6'b100000: ALU_control <= 3'b010;
            6'b100010: ALU_control <= 3'b110;
            6'b100100: ALU_control <= 3'b000;
            6'b100101: ALU_control <= 3'b001;
            6'b101010: ALU_control <= 3'b111;
            default: ALU_control <= 3'bxxx;
          endcase
    endcase
endmodule
