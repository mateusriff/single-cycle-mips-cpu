module program_counter (
    input wire clk,
    input wire [31:0] pc_in,
    output wire [31:0] pc_out
);
    reg [31:0] data; // reg = register, a datatype that is usually implemented in hardware as a flipflop 
    always @(posedge clk) //everytime the clock changes its value from 0 to 1 
        data <= pc_in;    //update the value in data to the value in pc_in  
    
    assign pc_out = data; //conects a wire to the output of the data register 
endmodule