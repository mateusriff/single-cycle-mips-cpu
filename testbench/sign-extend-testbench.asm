module SignExtend_tb;
    reg [15:0] inst15_0;
    wire [31:0] Extend32;

    // Instancia o módulo SignExtend
    SignExtend uut (
        .inst15_0(inst15_0),
        .Extend32(Extend32)
    );

    initial begin
        // Testa com valor positivo (binário: 0000 0000 0000 0001)
        inst15_0 = 16'b0000_0000_0000_0001;
        #10;
        $display("Input: %b, Output: %b", inst15_0, Extend32);

        // Testa com valor negativo (binário: 1000 0000 0000 0001)
        inst15_0 = 16'b1000_0000_0000_0001;
        #10;
        $display("Input: %b, Output: %b", inst15_0, Extend32);

        // Testa com valor zero (binário: 0000 0000 0000 0000)
        inst15_0 = 16'b0000_0000_0000_0000;
        #10;
        $display("Input: %b, Output: %b", inst15_0, Extend32);

        // Testa com todos os bits altos (binário: 1111 1111 1111 1111)
        inst15_0 = 16'b1111_1111_1111_1111;
        #10;
        $display("Input: %b, Output: %b", inst15_0, Extend32);

        // Termina a simulação
        $finish;
    end
endmodule
