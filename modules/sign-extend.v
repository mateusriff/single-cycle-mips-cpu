module SignExtend (inst15_0, Extend32);

	input [15:0] inst15_0;
	output reg [31:0] Extend32;

	always @(inst15_0) begin
		Extend32 = {{16{inst15_0[15]}}, inst15_0}; // Extensão de sinal adequada
	end
endmodule
