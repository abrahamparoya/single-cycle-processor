`timescale 1ns / 1ps

module adder_tb;

  // Inputs
  reg [63:0] A, B;
  
  // Outputs
  wire cout, ovrflow;
  wire [63:0] sum;

  // Instantiate the 64-bit adder module
  sixty_four_bit_adder uut (
    .a(A),
    .b(B),
    .cout(cout),
    .ovrflow(ovrflow),
    .sum(sum)
  );

  // Initial block for testbench
  initial begin
    // Test case 1: 2 + 3
    A = 64'h0000000000000002;
    B = 64'h0000000000000003;

    #10; // Wait for 10 time units

    if (sum !== A + B)
      $display("Test case 1 failed! Expected: %h, Got: %h", A + B, sum);
    else
      $display("Test case 1 passed!");

    // Test case 2: 7 + 8
    A = 64'h0000000000000007;
    B = 64'h0000000000000008;

    #10; // Wait for 10 time units

    if (sum !== A + B)
      $display("Test case 2 failed! Expected: %h, Got: %h", A + B, sum);
    else
      $display("Test case 2 passed!");

    // Add more test cases as needed

    // Terminate simulation
    $finish;
  end

endmodule
