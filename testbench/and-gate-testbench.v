module tb_And_Gate;

    // Declaração dos sinais de teste
    reg branch;
    reg zero;
    wire AndGateOut;

    // Instância do módulo And_Gate
    And_Gate uut (
        .branch(branch),
        .zero(zero),
        .AndGateOut(AndGateOut)
    );

    // Bloco de inicialização e estímulos
    initial begin
        // Inicialização dos sinais
        branch = 0;
        zero = 0;

        // Aplicar estímulos
        #10 branch = 0; zero = 1; // Espera-se que AndGateOut seja 0
        #10 branch = 1; zero = 0; // Espera-se que AndGateOut seja 0
        #10 branch = 1; zero = 1; // Espera-se que AndGateOut seja 1
        #10 branch = 0; zero = 0; // Espera-se que AndGateOut seja 0
        
        // Finaliza a simulação
        #10 $finish;
    end

    // Bloco para monitorar sinais
    initial begin
        $monitor("At time %t: branch = %b, zero = %b, AndGateOut = %b",
                 $time, branch, zero, AndGateOut);
    end

endmodule
