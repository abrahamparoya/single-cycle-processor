module full_adder(a, b, cin, cout, sum);
    input a, b, cin;        // bits to add, A, B and carry in
    output cout, sum;       // carry out and summation

    wire c1;            // carry out for A, used to calculate final carry out
    wire c2;            // carry out for B, used to calculate final carry out
    wire sum_1;             // summation for A, goes to A bit for 2nd half adder
    wire sum_2;             // summation for B, used to calculte final sum

    half_adder ha_1(a,     b,   c1, sum_1);        // set up first half adder
    half_adder ha_2(sum_1, cin, c2, sum_2);  // set up second half adder

    assign cout = c1 | c2;  // calculate carry out
    assign sum = sum_2;             // calculate sum

endmodule