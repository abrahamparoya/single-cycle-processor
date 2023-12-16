module ALU(a_in, b_in, select, result, zero, overflow);
    input [63:0] a_in, b_in;    // Input operands
    input [2:0] select;          // ALU operation select
    output reg [63:0] result;    // Result of the ALU operation
    output reg zero, overflow;   // Flags indicating zero result and overflow

    reg [63:0] a, b;             // Internal registers for operands

    // Wires for intermediate results of different ALU operations
    wire [63:0] add_result, sub_result, mult_result, div_quotient, div_remainder;
    wire add_cout, add_ovr;

    // Instantiating sub-modules (assuming you have them defined somewhere)
    sixty_four_bit_adder adder(a, b, add_cout, add_ovr, add_result);
    sixty_four_bit_adder aub(a, b, add_cout, add_ovr, sub_result); // Assuming aub means adder with subtract operation
    multiplier_64bit mult(a, b, mult_result);
    divider div(a, b, div_quotient, div_remainder);

    always @(*) begin
        // Addition
        if(select == 1) begin
            a <= $signed(a_in);
            b <= $signed(b_in);
            result <= add_result;
            zero <= ~|result;      // Set zero flag if result is zero
            overflow <= add_ovr;   // Set overflow flag based on the adder overflow
        end

        // Subtraction
        if(select == 2) begin
            a <= $signed(a_in);
            b <= $signed(-b_in);    // Two's complement to represent subtraction
            result <= sub_result;   // Use the result from the adder with subtract operation
            zero <= ~|result;
            overflow <= add_ovr;
        end

        // Multiplication
        if(select == 3) begin
            a <= $signed(a_in);
            b <= $signed(b_in);
            result <= mult_result;
            zero <= ~|result;
            overflow <= 1'b0;   // No overflow for multiplication
        end

        // Division
        if(select == 4) begin
            a <= $signed(a_in);
            b <= $signed(b_in);
            result <= div_quotient;
            zero <= ~|result;
            overflow <= 1'b0;   // No overflow for division
        end

        // Bitwise AND
        if(select == 5) begin
            result <= a_in & b_in;
            zero <= ~|result;
            overflow <= 1'b0;
        end

        // Bitwise OR
        if(select == 6) begin
            result <= a_in | b_in;
            zero <= ~|result;
            overflow <= 1'b0;
        end
    end
endmodule
