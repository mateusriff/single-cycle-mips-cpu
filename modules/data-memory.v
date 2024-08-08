module data_memory (
    input clk,
    input write_enable,
    input [31:0] address,
    input [31:0] write_data,
    output reg [31:0] read_data
);

    // Define the data memory with 64 locations, each 32 bits wide
    reg [31:0] memory [63:0];

    // Initialize memory (optional, for simulation purposes)
    initial begin
        integer i;
        for (i = 0; i < 64; i = i + 1) begin
            memory[i] = 32'b0;
        end
    end

    // Write operation (synchronous)
    always @(posedge clk) begin
        if (write_enable) begin
          $display("ADDRESS: %h, VALUE: %d", address[5:0], write_data);
            memory[address[5:0]] <= write_data; // Use lower 6 bits of address for 64 locations
        end
    end

    // Read operation (asynchronous)
    always @(*) begin
        read_data = memory[address[5:0]]; // Use lower 6 bits of address for 64 locations
    end

endmodule