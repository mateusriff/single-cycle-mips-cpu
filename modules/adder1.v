module adder1 (
  input [31:0] pc_out,
  output [31:0] adder1_out
);
  assign adder1_out = pc_out + 4;
endmodule