module divider(
    input [63:0] Q,      // Dividend
    input [63:0] M,      // Divisor
    output reg [63:0] quotient,   // Quotient output
    output reg [63:0] remainder  // Remainder output
);

    reg [63:0] MReg, QReg;   // Registers to hold temporary values
    reg negativeM, negativeQ;   // Flags for negative values

    always @* begin
        quotient = 0;   // Initialize quotient to 0
        MReg = M;   // Assign divisor to a register
        negativeM = 0;   // Initialize negative divisor flag

        // Check if the divisor is negative
        case (MReg[63])
            1'b1: begin
                MReg = ~(MReg) + 1;   // Convert negative divisor to positive
                negativeM = 1;   // Set negative divisor flag
            end
        endcase

        QReg = Q;   // Assign dividend to a register
        negativeQ = 0;   // Initialize negative dividend flag

        // Check if the dividend is negative
        case (QReg[63])
            1'b1: begin
                QReg = ~(QReg) + 1;   // Convert negative dividend to positive
                negativeQ = 1;   // Set negative dividend flag
            end
        endcase

        // Perform division using restoring division algorithm
        while (QReg > MReg) begin
            quotient = quotient + 1;
            QReg = QReg - MReg;
        end

        remainder = QReg;   // The remaining value is the remainder

        // Adjust the sign of the quotient based on the signs of the divisor and dividend
        case ({negativeM, negativeQ})
            2'b10: begin
                quotient = ~(quotient) + 1;
            end
            2'b01: begin
                quotient = ~(quotient) + 1;
            end
        endcase
    end
endmodule
