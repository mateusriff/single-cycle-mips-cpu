module tb_mux1;

    // Declaração das variáveis de teste
    reg [20:16] inst20_16;
    reg [15:11] inst15_11;
    reg RegDst;
    wire [4:0] WriteReg;

    // Instancia o módulo mux1
    mux1 uut (
        .inst20_16(inst20_16),
        .inst15_11(inst15_11),
        .RegDst(RegDst),
        .WriteReg(WriteReg)
    );

    // Bloco de inicialização e estímulo
    initial begin
        // Inicializa os sinais
        inst20_16 = 5'b00001; // Valor em binário: 00001
        inst15_11 = 5'b00010; // Valor em binário: 00010
        RegDst = 0; // Seleciona inst20_16

        // Espera um pouco e verifica o resultado
        #10;
        $display("RegDst = %b, WriteReg = %b", RegDst, WriteReg);

        // Muda o valor de RegDst e verifica novamente
        RegDst = 1; // Seleciona inst15_11
        #10;
        $display("RegDst = %b, WriteReg = %b", RegDst, WriteReg);

        // Testa outros valores
        inst20_16 = 5'b00111; // Valor em binário: 00111
        inst15_11 = 5'b01001; // Valor em binário: 01001
        RegDst = 0; // Seleciona inst20_16
        #10;
        $display("RegDst = %b, WriteReg = %b", RegDst, WriteReg);

        RegDst = 1; // Seleciona inst15_11
        #10;
        $display("RegDst = %b, WriteReg = %b", RegDst, WriteReg);

        // Finaliza a simulação
        $finish;
    end

endmodule
