`timescale 1ns/1ps

module alu_control_tb;

  // Signals
  reg [31:0] instruction;
  reg [2:0] aluop_in;
  wire [2:0] aluop;

  // Instantiate the alu_control module
  alu_control uut (
    .instruction(instruction),
    .aluop_in(aluop_in),
    .aluop(aluop)
  );

  // Initial block
  initial begin
    // Test case 1: R-type - Addition
    instruction = 32'b0000000_00000_00000_00000_00000_0111111;  // R-type opcode with ADD funct3
    aluop_in = 3'b000;
    #10;

    // Test case 2: R-type - Subtraction
    instruction = 32'b0100000_00000_00000_00000_00000_0111111;  // R-type opcode with SUB funct3
    aluop_in = 3'b000;
    #10;

    // Test case 3: R-type - Multiplication
    instruction = 32'b0000000_00000_00000_01000_00000_0111111;  // R-type opcode with MUL funct3
    aluop_in = 3'b000;
    #10;

    // Test case 4: R-type - Division
    instruction = 32'b0000000_00000_00000_01100_00000_0111111;  // R-type opcode with DIV funct3
    aluop_in = 3'b000;
    #10;

    // Test case 5: lw (Load Word)
    instruction = 32'b0000100_00001_00000_0000000000000;  // lw opcode
    aluop_in = 3'b010;
    #10;

    // Test case 6: sw (Store Word)
    instruction = 32'b0000100_00001_00000_0000000000000;  // sw opcode
    aluop_in = 3'b010;
    #10;

    // Test case 7: branch (BEQ - Branch if Equal)
    instruction = 32'b0001100_00000_00001_000000000000;  // branch opcode with BEQ funct3
    aluop_in = 3'b011;
    #10;

    // Test case 8: Unsupported aluop_in
    instruction = 32'b0000000_00000_00000_00000_00000_0111111;  // R-type opcode
    aluop_in = 3'b111;
    #10;

    // Finish simulation
    $finish;
  end

endmodule
