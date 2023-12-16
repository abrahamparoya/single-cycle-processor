module half_adder(a, b, cout, sum);
    input a, b;             // bits to add
    output cout, sum;       // carry out and summation

    assign sum = a ^ b;     // calculate the sum
    assign cout = a & b;    // calculate carry out

endmodule