module thirty_two_bit_adder (
  input [31:0] a, b,
  input cin,
  output cout,
  output [31:0] sum
);

  wire c1;

  sixteen_bit_adder sb_1(a[15:0],  b[15:0],  cin,    c1, sum[15:0]);
  sixteen_bit_adder sb_2(a[31:16], b[31:16], c1, cout,   sum[31:16]);

endmodule
