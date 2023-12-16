module four_bit_adder(a, b, cin, cout, sum);
    input [3:0] a, b;
    input cin;
    output cout;
    output [3:0] sum;

    wire c1;
    wire c2;
    wire c3;

    full_adder fa_1(a[0], b[0], cin,    c1, sum[0]);
    full_adder fa_2(a[1], b[1], c1, c2, sum[1]);
    full_adder fa_3(a[2], b[2], c2, c3, sum[2]);
    full_adder fa_4(a[3], b[3], c3, cout,   sum[3]);

endmodule
