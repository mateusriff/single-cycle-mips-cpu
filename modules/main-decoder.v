module main_decoder(
  input [5:0] op,
  output memtoreg, memwrite,
  output branch, alusrc,
  output regdst, regwrite,
  output jump,
  output [1:0] ALUop
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
    ALUop
  } = controls;
  
  always @ (*)
    case(op)
      6'b000000: controls <= 9'b110000010;
      6'b100011: controls <= 9'b101001000; 
      6'b101011: controls <= 9'b001010000; 
      6'b000100: controls <= 9'b000100001; 
      6'b001000: controls <= 9'b101000000; 
      6'b000010: controls <= 9'b000000100; 
      default: controls <= 9'bxxxxxxxxx; 
    endcase
endmodule
