module immediate_gen(
    input [31:0] input_instruction,
    output reg [31:0] output_instruction
);
    integer val;
    // Combinational logic to generate immediate values based on opcode
    always @* begin
    val = input_instruction[6:0];
        case(val)
            
            // R-Format (Opcode: 0110011)
            51: output_instruction = 0;

            // lw (Opcode: 0000011)
            3: output_instruction = input_instruction[31:20];

            // sw (Opcode: 0100011)
            35: output_instruction = {input_instruction[31:25], input_instruction[11:7]};

            // jalr (Opcode: 1100111)
            103: begin
                output_instruction[4:1] = input_instruction[11:8];
                output_instruction[10:5] = input_instruction[30:25];
                output_instruction[11] = input_instruction[7];
                output_instruction[12] = input_instruction[31];
            end
        endcase
    end
endmodule
