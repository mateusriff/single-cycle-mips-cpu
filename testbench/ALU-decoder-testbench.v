module tb_ALU_decoder;

  reg [5:0] funct;
  reg [1:0] ALUop;
  wire [2:0] ALU_control;

  // Instância do módulo ALU_decoder
  ALU_decoder uut (
    .funct(funct),
    .ALUop(ALUop),
    .ALU_control(ALU_control)
  );

  // Procedimento para verificar os valores
  initial begin
    // Testa com ALUop = 00
    ALUop = 2'b00;
    funct = 6'b000000; // Funct não deve afetar com ALUop = 00
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);
    
    // Testa com ALUop = 01
    ALUop = 2'b01;
    funct = 6'b000000; // Funct não deve afetar com ALUop = 01
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);

    // Testa com ALUop = 00 e diferentes funct
    ALUop = 2'b00;
    funct = 6'b100000; // Funct para ADD
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);

    funct = 6'b100010; // Funct para SUB
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);

    funct = 6'b100100; // Funct para AND
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);

    funct = 6'b100101; // Funct para OR
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);

    funct = 6'b101010; // Funct para SLT
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);

    // Testa com ALUop = 01 e diferentes funct (não deve afetar)
    ALUop = 2'b01;
    funct = 6'b100000;
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);

    funct = 6'b100010;
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);

    funct = 6'b100100;
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);

    funct = 6'b100101;
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);

    funct = 6'b101010;
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);

    // Testa com ALUop e funct não especificados
    ALUop = 2'bxx;
    funct = 6'bxxxxxx;
    #10;
    $display("ALUop = %b, funct = %b, ALU_control = %b", ALUop, funct, ALU_control);

    // Finaliza a simulação
    $finish;
  end

endmodule
