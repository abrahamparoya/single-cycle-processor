`timescale 1ns/1ps

module ALU_tb;

  // Parameters
  parameter DELAY = 10; // Time delay for simulation steps

  // Signals
  reg [63:0] a, b;
  reg [2:0] select;
  wire [63:0] result;
  wire zero, overflow;

  // Instantiate the ALU module
  ALU uut (
    .a_in(a),
    .b_in(b),
    .select(select),
    .result(result),
    .zero(zero),
    .overflow(overflow)
  );

  // Initial block
  initial begin
    // Test case 1: Addition
    a = 5;
    b = 10;
    select = 1; // Addition
    #DELAY;

    // Test case 2: Subtraction
    a = 15;
    b = 7;
    select = 2; // Subtraction
    #DELAY;

    // Test case 3: Multiplication
    a = 8;
    b = 3;
    select = 3; // Multiplication
    #DELAY;

    // Test case 4: Division
    a = 25;
    b = 5;
    select = 4; // Division
    #DELAY;

    // Test case 5: Bitwise AND
    a = 15;
    b = 7;
    select = 5; // Bitwise AND
    #DELAY;

    // Test case 6: Bitwise OR
    a = 12;
    b = 5;
    select = 6; // Bitwise OR
    #DELAY;

    // Finish simulation
    $finish;
  end

endmodule
