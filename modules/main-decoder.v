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
      6b000000: controls <= 9b110000010; //Rtyp
      6b100011: controls <= 9b101001000; //LW
      6b101011: controls <= 9b001010000; //SW
      6b000100: controls <= 9b000100001; //BEQ
      6b001000: controls <= 9b101000000; //ADDI
      6b000010: controls <= 9b000000100; //J
      default: controls <= 9bxxxxxxxxx; //???
    endcase
endmodule