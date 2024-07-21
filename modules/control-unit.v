module main_decoder(
  input [5:0] op,
  output memtoreg, memwrite,
  output branch, alusrc,
  output regdst, regwrite,
  output jump,
  output [1:0] aluop
);
  reg [8:0] controls;
  
  assign {
    regwrite, 
    regdst, 
    alusrc,
    branch, 
    memwrite,
    memtoreg, 
    jump, 
    aluop
  } = controls;
  
  always @ (*)
    case(op)
      6'b000000: controls <= 9'b110000010; //Rtyp
      6'b100011: controls <= 9'b101001000; //LW
      6'b101011: controls <= 9'b001010000; //SW
      6'b000100: controls <= 9'b000100001; //BEQ
      6'b001000: controls <= 9'b101000000; //ADDI
      6'b000010: controls <= 9'b000000100; //J
      default: controls <= 9'bxxxxxxxxx; //???
    endcase
endmodule

module ALU_decoder(
    input [5:0] funct,
    input[1:0] ALUop,
    output reg [2:0] ALU_control,
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

module control_unit (
  input [5:0] op, funct,
  input zero,
  output memtoreg, memwrite,
  output pcsrc, alusrc,
  output regdst, regwrite,
  output jump,
  output [2:0] alucontrol
);
  wire [1:0] aluop;
  wire branch;
  
  main_decoder md (
    op, memtoreg, memwrite, branch,
    alusrc, regdst, regwrite, jump,
    aluop
  );
  ALU_decoder ad (funct, aluop, alucontrol);
  
  assign pcsrc = branch & zero;
endmodule