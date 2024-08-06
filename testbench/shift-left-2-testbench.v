module tb_ShiftLeft2;

    // Declaração de sinais para conectar ao módulo
    reg [31:0] ShiftIn;
    wire [31:0] ShiftOut;

    // Instancia o módulo a ser testado
    ShiftLeft2 uut (
        .ShiftIn(ShiftIn),
        .ShiftOut(ShiftOut)
    );

    // Procedimento inicial para gerar os vetores de teste
    initial begin
        // Inicializa o sinal de entrada
        ShiftIn = 32'b00000000000000000000000000000000; // 0 em binário
        #10; // Espera 10 unidades de tempo
        $display("ShiftIn = %b, ShiftOut = %b", ShiftIn, ShiftOut);

        ShiftIn = 32'b00000000000000000000000000000001; // 1 em binário
        #10;
        $display("ShiftIn = %b, ShiftOut = %b", ShiftIn, ShiftOut);

        ShiftIn = 32'b00000000000000000000000000001010; // 10 em binário
        #10;
        $display("ShiftIn = %b, ShiftOut = %b", ShiftIn, ShiftOut);

        ShiftIn = 32'b00000000000000000000000000111100; // 60 em binário
        #10;
        $display("ShiftIn = %b, ShiftOut = %b", ShiftIn, ShiftOut);

        ShiftIn = 32'b11111111111111111111111111111111; // -1 em binário
        #10;
        $display("ShiftIn = %b, ShiftOut = %b", ShiftIn, ShiftOut);

        // Finaliza a simulação
        $finish;
    end

endmodule
