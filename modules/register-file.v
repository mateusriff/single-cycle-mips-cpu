module register_file(
    input wire clk,
    input wire write_enable,
    input wire [4:0] read_address1, read_address2, write_address,
    input wire [31:0] write_data,
    output reg [31:0] read_data1, read_data2
);

    // Define the register file with 32 registers, each 32 bits wide
    reg [31:0] registers [31:0];

    // Initialize registers (optional, for simulation purposes)
    initial begin
        integer i;
        for (i = 0; i < 32; i = i + 1) begin
            registers[i] = 32'b0;
        end
    end

    // Write operation
    always @(posedge clk) begin
        if (write_enable) begin
            registers[write_address] <= write_data;
        end
    end

    // Read operation
    always @(*) begin
        read_data1 = registers[read_address1];
        read_data2 = registers[read_address2];
    end

endmodule
