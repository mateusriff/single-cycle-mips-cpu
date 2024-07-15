// We chose to not to allocate much more RAM than 
// what was needed to run our instructions, which were few.
//
// For now, we're manually setting instructions in RAM,
// but ideally we should use readmemh() or readmemb().
//
// Also... Are we sure we want to divide the address by 4
// before accessing an instruction in RAM?

module instruction_memory (
    input [31:0] adress,
    output [31:0] instruction
);    
    reg [31:0] RAM[63:0];

    initial begin
        RAM[0] = 32'h8C22000C;
        RAM[1] = 32'h00000000;
    end

  assign instruction = RAM[address / 4];
endmodule