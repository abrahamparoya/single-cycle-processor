module sixty_four_bit_adder(a, b, cout, ovrflow, sum);
    input [63:0] a, b;  
    output cout;
    output ovrflow;         
    output [63:0] sum;  

    wire c1;

    thirty_two_bit_adder tt_1(a[31:0],  b[31:0],  1'b0,   c1, sum[31:0]);
    thirty_two_bit_adder tt_2(a[63:32], b[63:32], c1, cout,   sum[63:32]);
    
    assign ovrflow = ((~sum[63]) & a[63] & b[63])|(sum[63] & (~a[63]) & (~b[63]));
endmodule