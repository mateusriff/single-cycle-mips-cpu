module tb_main_decoder;

  reg [5:0] op;
  wire memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump;
  wire [1:0] ALUop;

  // Instância do módulo main_decoder
  main_decoder uut (
    .op(op),
    .memtoreg(memtoreg),
    .memwrite(memwrite),
    .branch(branch),
    .alusrc(alusrc),
    .regdst(regdst),
    .regwrite(regwrite),
    .jump(jump),
    .ALUop(ALUop)
  );

  // Procedimento para verificar os valores
  initial begin
    // Inicializa o valor de op
    op = 6'b000000; // Testa com código binário para operação R-Type
    #10; // Espera 10 unidades de tempo

    // Verifica a saída esperada
    $display("op = %b, regwrite = %b, regdst = %b, alusrc = %b, branch = %b, memwrite = %b, memtoreg = %b, jump = %b, ALUop = %b",
             op, regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, ALUop);
    
    // Testa com código binário para LW (Load Word)
    op = 6'b100011;
    #10;
    $display("op = %b, regwrite = %b, regdst = %b, alusrc = %b, branch = %b, memwrite = %b, memtoreg = %b, jump = %b, ALUop = %b",
             op, regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, ALUop);
    
    // Testa com código binário para SW (Store Word)
    op = 6'b101011;
    #10;
    $display("op = %b, regwrite = %b, regdst = %b, alusrc = %b, branch = %b, memwrite = %b, memtoreg = %b, jump = %b, ALUop = %b",
             op, regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, ALUop);
    
    // Testa com código binário para BEQ (Branch if Equal)
    op = 6'b000100;
    #10;
    $display("op = %b, regwrite = %b, regdst = %b, alusrc = %b, branch = %b, memwrite = %b, memtoreg = %b, jump = %b, ALUop = %b",
             op, regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, ALUop);
    
    // Testa com código binário para ADDI (Add Immediate)
    op = 6'b001000;
    #10;
    $display("op = %b, regwrite = %b, regdst = %b, alusrc = %b, branch = %b, memwrite = %b, memtoreg = %b, jump = %b, ALUop = %b",
             op, regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, ALUop);
    
    // Testa com código binário para J (Jump)
    op = 6'b000010;
    #10;
    $display("op = %b, regwrite = %b, regdst = %b, alusrc = %b, branch = %b, memwrite = %b, memtoreg = %b, jump = %b, ALUop = %b",
             op, regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, ALUop);
    
    // Testa com um código binário não especificado (para o default)
    op = 6'b111111;
    #10;
    $display("op = %b, regwrite = %b, regdst = %b, alusrc = %b, branch = %b, memwrite = %b, memtoreg = %b, jump = %b, ALUop = %b",
             op, regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, ALUop);

    // Finaliza a simulação
    $finish;
  end

endmodule
