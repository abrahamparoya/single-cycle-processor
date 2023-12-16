module control(
    input [6:0] Opcode,
    output reg ALUSrc, MemtoReg, RegWrite,
    output reg MemRead, MemWrite, Branch,
    output reg [1:0] ALUOp);

    // Combinational logic block that generates control signals based on the input opcode
    always @(*) begin
        case(Opcode)
            // R- Format: 0110011
            51: begin
                ALUSrc      <= 0;  // ALU source from registers
                MemtoReg    <= 0;  // Data from ALU result
                RegWrite    <= 1;  // Enable register write
                MemRead     <= 0;  // Disable memory read
                MemWrite    <= 0;  // Disable memory write
                Branch      <= 0;  // No branching
                ALUOp       <= 2'b10; // ALU operation code for R-Format
            end
            // lw: 0000011
            3: begin
                ALUSrc      <= 1;  // ALU source from immediate value
                MemtoReg    <= 1;  // Data from memory read
                RegWrite    <= 1;  // Enable register write
                MemRead     <= 1;  // Enable memory read
                MemWrite    <= 0;  // Disable memory write
                Branch      <= 0;  // No branching
                ALUOp       <= 2'b00; // ALU operation code for lw
            end
            // sw: 0100011
            35: begin
                ALUSrc      <= 1;  // ALU source from immediate value
                MemtoReg    <= 0;  // Data not used for register write
                RegWrite    <= 0;  // Disable register write
                MemRead     <= 0;  // Disable memory read
                MemWrite    <= 1;  // Enable memory write
                Branch      <= 0;  // No branching
                ALUOp       <= 2'b00; // ALU operation code for sw
            end
            // beq: 1100011
            4: begin
                ALUSrc      <= 0;  // ALU source from registers
                MemtoReg    <= 0;  // Data not used for register write
                RegWrite    <= 0;  // Disable register write
                MemRead     <= 0;  // Disable memory read
                MemWrite    <= 0;  // Disable memory write
                Branch      <= 1;  // Enable branching
                ALUOp       <= 2'b01; // ALU operation code for beq
            end
        endcase
    end
endmodule
