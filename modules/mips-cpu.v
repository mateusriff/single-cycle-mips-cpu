module mips_cpu (
    input clock,
    input reset
);

    // Internal signals
    wire [31:0] pc_in, pc_out, instruction;
    wire regdst, regwrite, alusrc, memtoreg, memwrite, branch;
    wire [1:0] ALUop;
    wire [4:0] WriteReg;
    wire [31:0] read_data1, read_data2, Extend32, ALU_B, ShiftOut;
    wire [2:0] ALU_control;
    wire zero;
    wire [31:0] ALU_result, adder1_out, adder2_out, read_data, WriteData_reg;
    wire AndGateOut;

    // PC connection
    program_counter pc_inst (
        .clk(clock),
        .reset(reset),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );

    // adder1 connection
    adder1 adder1_inst (
        .pc_out(pc_out),
        .adder1_out(adder1_out)
    );

    // instruction memory connection
    instruction_memory inst_mem (
        .address(pc_out),
        .instruction(instruction)
    );

    // MainDecoder connection
    main_decoder main_dec (
        .op(instruction[31:26]),
        .regdst(regdst),
        .regwrite(regwrite),
        .alusrc(alusrc),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .branch(branch),
        .ALUop(ALUop)
    );

    // Mux1 connection
    mux1 mux1_inst (
        .inst20_16(instruction[20:16]),
        .inst15_11(instruction[15:11]),
        .RegDst(regdst),
        .WriteReg(WriteReg)
    );

    // Register file connection
    register_file reg_file (
        .clk(clock),
        .write_enable(regwrite),
        .read_address1(instruction[25:21]),
        .read_address2(instruction[20:16]),
        .write_address(WriteReg),
        .write_data(WriteData_reg),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    // Sign Extend Connection
    SignExtend sign_ext (
        .inst15_0(instruction[15:0]),
        .Extend32(Extend32)
    );

    // mux2 Connection
    mux2 mux2_inst (
        .ALUSrc(alusrc),
        .read_data2(read_data2),
        .Extend32(Extend32),
        .ALU_B(ALU_B)
    );

    // ShiftLeft2 connection
    ShiftLeft2 shift_left (
        .ShiftIn(Extend32),
        .ShiftOut(ShiftOut)
    );

    // ALU Decoder connection
    ALU_decoder alu_dec (
        .funct(instruction[5:0]),
        .ALUop(ALUop),
        .ALU_control(ALU_control)
    );

    // ALU connection
    ALU alu (
        .ALU_Control(ALU_control),
        .A(read_data1),
        .B(ALU_B),
        .ALU_result(ALU_result),
        .zero(zero)
    );

    // adder2 connections
    adder2 adder2_inst (
        .adder1_out(adder1_out),
        .ShiftOut(ShiftOut),
        .adder2_out(adder2_out)
    );

    // And Gate connection
    And_Gate and_gate (
        .branch(branch),
        .zero(zero),
        .AndGateOut(AndGateOut)
    );

    // mux4 connection
    mux4 mux4_inst (
        .adder1_out(adder1_out),
        .adder2_out(adder2_out),
        .AndGateOut(AndGateOut),
        .pc_in(pc_in)
    );

    // data memory connection
    data_memory data_mem (
        .clk(clock),
        .write_enable(memwrite),
        .address(ALU_result),
        .write_data(read_data2),
        .read_data(read_data)
    );

    // mux3 connection
    mux3 mux3_inst (
        .read_data(read_data),
        .ALU_result(ALU_result),
        .memtoreg(memtoreg),
        .WriteData_reg(WriteData_reg)
    );
  
endmodule