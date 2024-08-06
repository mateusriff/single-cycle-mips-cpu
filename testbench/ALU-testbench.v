`timescale 1ns / 1ps

module ALU_tb;

    // Inputs
    reg [2:0] ALU_Control;
    reg [31:0] A, B;

    // Outputs
    wire [31:0] ALU_result;
    wire zero;

    // Instantiate the ALU
    ALU uut (
        .ALU_Control(ALU_Control),
        .A(A),
        .B(B),
        .ALU_result(ALU_result),
        .zero(zero)
    );

    // Test sequence
    initial begin
        // Initialize inputs
        A = 32'd1;
        B = 32'd0;

        // Test AND
        ALU_Control = 3'b000; #10;
        $display("Operation: AND, A = %d, B = %d, Result = %d", A, B, ALU_result);

        // Test ADD
        ALU_Control = 3'b010; #10;
        $display("Operation: ADD, A = %d, B = %d, Result = %d", A, B, ALU_result);

        // Test OR
        ALU_Control = 3'b001; #10;
        $display("Operation: OR, A = %d, B = %d, Result = %d", A, B, ALU_result);

        // Test SLT
        ALU_Control = 3'b111; #10;
        $display("Operation: SLT, A = %d, B = %d, Result = %d", A, B, ALU_result);

        // Test SUB
        ALU_Control = 3'b110; A = 32'd10; B = 32'd5; #10;
        $display("Operation: SUB, A = %d, B = %d, Result = %d", A, B, ALU_result);

        // Finish simulation
        $finish;
    end

endmodule
