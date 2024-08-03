module adder2 (
  input [31:0] adder1_out,
  input [31:0] ShiftOut,
  output [31:0] adder2_out
);
  assign adder2_out = adder1_out + ShiftOut;
endmodule