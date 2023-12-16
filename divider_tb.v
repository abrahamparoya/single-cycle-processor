module divider_tb;

  // Signals
  reg [63:0] dividend, divisor;
  reg [63:0] quotient_expected, remainder_expected;
  reg [63:0] quotient_actual, remainder_actual;

  // Instantiate the divider module
  divider uut (
    .Q(dividend),
    .M(divisor),
    .quotient(quotient_actual),
    .remainder(remainder_actual)
  );

  // Initial block
  initial begin
    // Initialize signals
    dividend = 100;   // Set your test values
    divisor = 7;      // Set your test values
    quotient_expected = dividend / divisor;
    remainder_expected = dividend % divisor;

    // Apply inputs
    dividend = 100;  // Set your test values
    divisor = 7;     // Set your test values

    // Wait for some time (combinational simulation)
    #100;

    // Display results
    $display("Input: dividend = %d, divisor = %d", dividend, divisor);
    $display("Expected Result: quotient = %d, remainder = %d", quotient_expected, remainder_expected);
    $display("Actual Result:   quotient = %d, remainder = %d", quotient_actual, remainder_actual);

    // Check for correctness
    if ((quotient_actual == quotient_expected) && (remainder_actual == remainder_expected))
      $display("Test Passed!");
    else
      $display("Test Failed!");

    // Finish simulation
    $finish;
  end

endmodule
