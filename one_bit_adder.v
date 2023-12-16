// 1-Bit Adder module
module one_bit_adder(input [0:0] a, b, cin, output [0:0] sum, cout);
    full_adder FA1(a[0], b[0], cin, sum[0], cout);
endmodule