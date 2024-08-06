module tb_mux3;

    reg [31:0] read_data;
    reg [31:0] ALU_result;
    reg memtoreg;
    wire [31:0] WriteData_reg;

    // Instancia o módulo mux3
    mux3 uut (
        .read_data(read_data),
        .ALU_result(ALU_result),
        .memtoreg(memtoreg),
        .WriteData_reg(WriteData_reg)
    );

    // Bloco inicial para gerar estímulos e verificar o comportamento
    initial begin
        // Teste 1: memtoreg = 0
        read_data = 32'b00000000000000000000000000000001; // Valor em binário
        ALU_result = 32'b00000000000000000000000000000010; // Valor em binário
        memtoreg = 0; // Seleciona ALU_result
        #10; // Espera 10 unidades de tempo
        if (WriteData_reg !== ALU_result) $display("Erro no Teste 1: WriteData_reg = %b, esperado = %b", WriteData_reg, ALU_result);
        
        // Teste 2: memtoreg = 1
        read_data = 32'b00000000000000000000000000000100; // Valor em binário
        ALU_result = 32'b00000000000000000000000000001000; // Valor em binário
        memtoreg = 1; // Seleciona read_data
        #10; // Espera 10 unidades de tempo
        if (WriteData_reg !== read_data) $display("Erro no Teste 2: WriteData_reg = %b, esperado = %b", WriteData_reg, read_data);
        
        // Teste 3: memtoreg = 0 com outros valores
        read_data = 32'b11111111111111111111111111111111; // Valor em binário
        ALU_result = 32'b00000000000000000000000000000101; // Valor em binário
        memtoreg = 0; // Seleciona ALU_result
        #10; // Espera 10 unidades de tempo
        if (WriteData_reg !== ALU_result) $display("Erro no Teste 3: WriteData_reg = %b, esperado = %b", WriteData_reg, ALU_result);
        
        // Teste 4: memtoreg = 1 com outros valores
        read_data = 32'b00000000000000000000000011111111; // Valor em binário
        ALU_result = 32'b00000000000000000000000000000011; // Valor em binário
        memtoreg = 1; // Seleciona read_data
        #10; // Espera 10 unidades de tempo
        if (WriteData_reg !== read_data) $display("Erro no Teste 4: WriteData_reg = %b, esperado = %b", WriteData_reg, read_data);
        
        // Finaliza a simulação
        $finish;
    end

endmodule
