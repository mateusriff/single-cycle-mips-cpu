module tb_mux4;
    // Declaração de variáveis de teste
    reg [31:0] adder1_out;
    reg [31:0] adder2_out;
    reg AndGateOut;
    wire [31:0] pc_in;

    // Instancia o módulo mux4
    mux4 uut (
        .adder1_out(adder1_out),
        .adder2_out(adder2_out),
        .AndGateOut(AndGateOut),
        .pc_in(pc_in)
    );

    // Bloco de inicialização e geração de estímulos
    initial begin
        // Inicializa os sinais
        adder1_out = 32'b00000000000000000000000000000000; // Valor 0
        adder2_out = 32'b00000000000000000000000000000001; // Valor 1
        AndGateOut = 0; // Seleciona adder1_out

        // Teste com AndGateOut = 0
        #10;
        if (pc_in !== adder1_out) $display("Erro: Esperado %b, Objeto %b", adder1_out, pc_in);

        // Alterando entradas
        AndGateOut = 1; // Seleciona adder2_out

        // Teste com AndGateOut = 1
        #10;
        if (pc_in !== adder2_out) $display("Erro: Esperado %b, Objeto %b", adder2_out, pc_in);

        // Alterando entradas para mais testes
        adder1_out = 32'b11111111111111111111111111111111; // Valor máximo
        adder2_out = 32'b10101010101010101010101010101010; // Valor alternado
        AndGateOut = 0; // Seleciona adder1_out

        // Teste com novo valor e AndGateOut = 0
        #10;
        if (pc_in !== adder1_out) $display("Erro: Esperado %b, Objeto %b", adder1_out, pc_in);

        // Alterando a seleção
        AndGateOut = 1; // Seleciona adder2_out

        // Teste com novo valor e AndGateOut = 1
        #10;
        if (pc_in !== adder2_out) $display("Erro: Esperado %b, Objeto %b", adder2_out, pc_in);

        // Encerramento do teste
        $finish;
    end
endmodule
