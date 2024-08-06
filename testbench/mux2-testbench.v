module tb_mux2;
    reg ALUSrc;
    reg [31:0] read_data2;
    reg [31:0] Extend32;
    wire [31:0] ALU_B;

    // Instância do módulo mux2
    mux2 uut (
        .ALUSrc(ALUSrc),
        .read_data2(read_data2),
        .Extend32(Extend32),
        .ALU_B(ALU_B)
    );

    // Procedimento inicial para testar o mux2
    initial begin
        // Teste 1: ALUSrc = 0
        ALUSrc = 0;
        read_data2 = 32'b00000000000000000000000000000101; // Valor binário: 5
        Extend32 = 32'b00000000000000000000000000001010; // Valor binário: 10
        #10; // Espera 10 unidades de tempo
        $display("Teste 1 - ALUSrc = %b, read_data2 = %b, Extend32 = %b, ALU_B = %b", ALUSrc, read_data2, Extend32, ALU_B);

        // Teste 2: ALUSrc = 1
        ALUSrc = 1;
        read_data2 = 32'b00000000000000000000000000000101; // Valor binário: 5
        Extend32 = 32'b00000000000000000000000000001010; // Valor binário: 10
        #10; // Espera 10 unidades de tempo
        $display("Teste 2 - ALUSrc = %b, read_data2 = %b, Extend32 = %b, ALU_B = %b", ALUSrc, read_data2, Extend32, ALU_B);

        // Teste 3: Valores diferentes para os inputs
        ALUSrc = 0;
        read_data2 = 32'b11111111111111111111111111111111; // Valor binário: -1
        Extend32 = 32'b00000000000000000000000000001111; // Valor binário: 15
        #10; // Espera 10 unidades de tempo
        $display("Teste 3 - ALUSrc = %b, read_data2 = %b, Extend32 = %b, ALU_B = %b", ALUSrc, read_data2, Extend32, ALU_B);

        ALUSrc = 1;
        read_data2 = 32'b11111111111111111111111111111111; // Valor binário: -1
        Extend32 = 32'b00000000000000000000000000001111; // Valor binário: 15
        #10; // Espera 10 unidades de tempo
        $display("Teste 4 - ALUSrc = %b, read_data2 = %b, Extend32 = %b, ALU_B = %b", ALUSrc, read_data2, Extend32, ALU_B);

        // Finaliza a simulação
        $finish;
    end
endmodule
