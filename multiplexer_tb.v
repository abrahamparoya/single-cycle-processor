`timescale 1ns / 1ps

module multiplexer_tb;

  // Parameters
  parameter WIDTH = 64;

  // Signals
  reg [WIDTH-1:0] data_0;
  reg [WIDTH-1:0] data_1;
  reg select;
  wire [WIDTH-1:0] output_data;

  // Instantiate the multiplexer module
  multiplexer uut (
    .data_0(data_0),
    .data_1(data_1),
    .select(select),
    .output_data(output_data)
  );

  // Initial block for testbench
  initial begin
    // Test case 1
    data_0 = 64'hA5A5A5A5A5A5A5A5;
    data_1 = 64'h5A5A5A5A5A5A5A5A;
    select = 0;
    
    #10; // Wait for 10 time units
    
    if (output_data !== data_0)
      $display("Test case 1 failed! Expected: %h, Got: %h", data_0, output_data);
    else
      $display("Test case 1 passed!");

    // Test case 2
    data_0 = 64'h123456789ABCDEF0;
    data_1 = 64'hFEDCBA9876543210;
    select = 1;
    
    #10; // Wait for 10 time units
    
    if (output_data !== data_1)
      $display("Test case 2 failed! Expected: %h, Got: %h", data_1, output_data);
    else
      $display("Test case 2 passed!");

    // Add more test cases as needed

    // Terminate simulation
    $finish;
  end

endmodule
