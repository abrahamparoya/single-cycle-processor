module control_tb;

    // Inputs
    reg [6:0] Opcode;
    
    // Outputs
    wire ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    wire [1:0] ALUOp;

    // Instantiate the control module
    control uut (
        .Opcode(Opcode),
        .ALUSrc(ALUSrc),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    // Testbench stimulus
    initial begin
        // Test case 1: R-format (51)
        Opcode = 7'b0110011;
        #10;
        
        // Test case 2: lw (3)
        Opcode = 7'b0000011;
        #10;

        // Test case 3: sw (35)
        Opcode = 7'b0100011;
        #10;

        // Test case 4: beq (4)
        Opcode = 7'b1100011;
        #10;

        // Add more test cases as needed
        
        // End simulation
        $stop;
    end

endmodule
