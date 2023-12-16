`timescale 1ns / 1ps

module tb_multiplier_64bit;

    // Inputs
    reg signed [63:0] a, b;

    // Outputs
    wire signed [127:0] product;

    // Instantiate the multiplier_64bit module
    multiplier_64bit uut (
        .a(a),
        .b(b),
        .product(product)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    // Testbench stimulus
    initial begin
        // Test case 1: Positive numbers
        a = 10;
        b = 5;
        #10;

        // Test case 2: Negative numbers
        a = -8;
        b = 6;
        #10;

        // Test case 3: Mixed signs
        a = -12;
        b = -4;
        #10;

        // Add more test cases as needed

        // End simulation
        $finish;
    end

endmodule
