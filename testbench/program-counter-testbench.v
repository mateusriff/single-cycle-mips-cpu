module tb_program_counter;

    // Declara sinais de teste
    reg clk;
    reg reset;
    reg [31:0] pc_in;
    wire [31:0] pc_out;

    // Instancia o módulo program_counter
    program_counter uut (
        .clk(clk),
        .reset(reset),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    // Gera o clock
    always begin
        #5 clk = ~clk; // Toggling a cada 5 unidades de tempo
    end

    // Procedimento de teste
    initial begin
        // Inicializa sinais
        clk = 0;
        reset = 0;
        pc_in = 32'b0;

        // Aplica o reset
        reset = 1;
        #10; // Aguarda 10 unidades de tempo
        reset = 0;

        // Define um valor para pc_in e observa a saída
        pc_in = 32'b00000000000000000000000000001010; // 10 em decimal
        #10; // Aguarda 10 unidades de tempo

        pc_in = 32'b00000000000000000000000000010010; // 18 em decimal
        #10; // Aguarda 10 unidades de tempo

        // Teste com o reset novamente
        reset = 1;
        #10; // Aguarda 10 unidades de tempo
        reset = 0;

        // Finaliza o teste
        #20;
        $stop; // Para a simulação
    end

    // Monitora as mudanças na saída
    initial begin
        $monitor("Time = %0d | pc_in = %b | pc_out = %b", $time, pc_in, pc_out);
    end

endmodule
