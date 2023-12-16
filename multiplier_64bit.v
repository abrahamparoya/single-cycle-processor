module multiplier_64bit(
    input wire signed [63:0] a,  // Input operand A (64-bit signed)
    input wire signed [63:0] b,  // Input operand B (64-bit signed)
    output reg signed [127:0] product  // Output product (128-bit signed)
);

    reg signed [63:0] multiplicand;  // Multiplicand (64-bit signed)
    reg signed [63:0] multiplier;    // Multiplier (64-bit signed)
    reg neg;                         // Flag for negation
    integer i;                       // Loop counter

    initial begin
        product = 128'b0;  // Initialize product to zero
    end

    always @* begin
        // Initialization based on the signs of operands
        neg = (a[63] == 1) ^ (b[63] == 1);
        multiplicand = (a[63] == 1) ? -a : a;  // Take the two's complement if negative
        multiplier = (b[63] == 1) ? -b : b;  // Take the two's complement if negative

        // Shift-and-add algorithm
        product = {64'b0, multiplicand};  // Initialize with multiplicand

        for (i = 0; i < 64; i = i + 1) begin
            if (product[0] == 1) begin
                // Add multiplier to the upper 64 bits of product if the least significant bit is 1
                product[127:64] = product[127:64] + multiplier;
            end
            product = product >> 1;  // Right shift product by 1 bit
        end

        // Negation for negative results
        if (neg) begin
            product = -product;  // Take the two's complement if the result is negative
        end
    end

endmodule
