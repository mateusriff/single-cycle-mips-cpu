module tb_adder2;

// Declaração de variáveis para o módulo a ser testado
reg [31:0] adder1_out;
reg [31:0] ShiftOut;
wire [31:0] adder2_out;

// Instancia o módulo adder2
adder2 uut (
    .adder1_out(adder1_out),
    .ShiftOut(ShiftOut),
    .adder2_out(adder2_out)
);

// Inicializa e aplica os estímulos
initial begin
    // Monitorar os sinais
    $monitor("Time = %0t: adder1_out = %b, ShiftOut = %b, adder2_out = %b", $time, adder1_out, ShiftOut, adder2_out);
    
    // Aplicar os estímulos iniciais
    adder1_out = 32'b00000000000000000000000000000001; // 1 em binário
    ShiftOut = 32'b00000000000000000000000000000010; // 2 em binário
    #10; // Esperar 10 unidades de tempo
    
    adder1_out = 32'b00000000000000000000000000001010; // 10 em binário
    ShiftOut = 32'b00000000000000000000000000000101; // 5 em binário
    #10; // Esperar 10 unidades de tempo
    
    adder1_out = 32'b00000000000000000000000000011111; // 31 em binário
    ShiftOut = 32'b00000000000000000000000000000001; // 1 em binário
    #10; // Esperar 10 unidades de tempo
    
    adder1_out = 32'b00000000000000000000000000000000; // 0 em binário
    ShiftOut = 32'b00000000000000000000000000000000; // 0 em binário
    #10; // Esperar 10 unidades de tempo

    // Encerrar a simulação
    $finish;
end

endmodule
