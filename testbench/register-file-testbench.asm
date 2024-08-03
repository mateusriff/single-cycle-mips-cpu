module register_file_tb;

    // Inputs
    reg clk;
    reg write_enable;
    reg [4:0] read_address1;
    reg [4:0] read_address2;
    reg [4:0] write_address;
    reg [31:0] write_data;

    // Outputs
    wire [31:0] read_data1;
    wire [31:0] read_data2;

    // Instantiate the Unit Under Test (UUT)
    register_file uut (
        .clk(clk),
        .write_enable(write_enable),
        .read_address1(read_address1),
        .read_address2(read_address2),
        .write_address(write_address),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        write_enable = 0;
        read_address1 = 0;
        read_address2 = 0;
        write_address = 0;
        write_data = 0;

        // Wait for the global reset
        #10;

        // Write 32'hAAAAAAAA to register 1
        write_address = 5'b00001;
        write_data = 32'b10101010101010101010101010101010;
        write_enable = 1;
        #10;

        // Write 32'h55555555 to register 2
        write_address = 5'b00010;
        write_data = 32'b01010101010101010101010101010101;
        write_enable = 1;
        #10;

        // Disable write enable
        write_enable = 0;
        #10;

        // Read from register 1
        read_address1 = 5'b00001;
        #10;

        // Read from register 2
        read_address2 = 5'b00010;
        #10;

        // Add more test cases as needed...

        // End simulation
        $stop;
    end
endmodule
