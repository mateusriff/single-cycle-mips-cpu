module tb_adder1;

  reg [31:0] pc_out;  // registrador para o sinal de entrada
  wire [31:0] adder1_out;  // fio para o sinal de saída

  // Instanciação do módulo adder1
  adder1 uut (
    .pc_out(pc_out),
    .adder1_out(adder1_out)
  );

  initial begin
    // Teste 1: pc_out = 0b00000000000000000000000000000000 (0 em decimal)
    pc_out = 32'b00000000000000000000000000000000;
    #10;
    $display("pc_out = %b, adder1_out = %b", pc_out, adder1_out);

    // Teste 2: pc_out = 0b00000000000000000000000000000100 (4 em decimal)
    pc_out = 32'b00000000000000000000000000000100;
    #10;
    $display("pc_out = %b, adder1_out = %b", pc_out, adder1_out);

    // Teste 3: pc_out = 0b00000000000000000000000000001000 (8 em decimal)
    pc_out = 32'b00000000000000000000000000001000;
    #10;
    $display("pc_out = %b, adder1_out = %b", pc_out, adder1_out);

    // Teste 4: pc_out = 0b11111111111111111111111111111100 (-4 em decimal, considerando representação de complemento de 2)
    pc_out = 32'b11111111111111111111111111111100;
    #10;
    $display("pc_out = %b, adder1_out = %b", pc_out, adder1_out);

    $finish;
  end

endmodule
