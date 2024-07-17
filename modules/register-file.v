module register_file (
    input clk,
    input write_enable,
    input [4:0] read_address1, read_address2, write_address,
    input [31:0] write_data,
    output reg [31:0] read_data1, read_data2
);
    
    reg [31:0] rf [31:0]; // Registrador de arquivos com 32 registradores de 32 bits
    
    always @(posedge clk) begin
        if (write_enable) begin
            rf[write_addr] <= write_data;
        end
    end
    
    assign read_data1 = (read_addr1 != 0) ? rf[read_addr1] : 0;
    assign read_data2 = (read_addr2 != 0) ? rf[read_addr2] : 0;
    
endmodule
