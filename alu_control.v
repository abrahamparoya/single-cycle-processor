module alu_control (
    input [31:0] instruction,
    input [2:0] aluop_in,
    output reg [2:0] aluop
);

    // Extracting bits from the instruction
    wire [6:0] funct67 = instruction[31:25];
    wire [2:0] funct3 = instruction[14:12];

    always @* begin
        // ALU control logic based on instruction type and operation
        case (aluop_in)
            
            // R-type
            3'b000: begin
                case ({funct67, funct3})
                    default: aluop = 3'b000; // Default case, set ALU operation to 000
                    // Addition
                    10'b0000000000: aluop = 3'b001;
                    // Subtraction
                    10'b0100000000: aluop = 3'b010;
                    // Multiplication
                    10'b0000001000: aluop = 3'b011;
                    // Division
                    10'b0000001100: aluop = 3'b100;
                    // AND
                    10'b0000000111: aluop = 3'b101;
                    // OR
                    10'b0000000110: aluop = 3'b110;
                endcase
            end

            // lw, sw
            3'b010: begin
                case (funct3)
                    // Load and Store operations
                    3'b010: aluop = 3'b001; // Set ALU operation to 001 for lw and sw
                endcase
            end

            // branch
            3'b011: begin
                case (funct3)
                    // BEQ
                    3'b000: aluop = 3'b010; // Set ALU operation to 010 for branch equal (BEQ)
                endcase
            end

            // Default case for unknown aluop_in values
            default: aluop = 3'b000;

        endcase
    end

endmodule
