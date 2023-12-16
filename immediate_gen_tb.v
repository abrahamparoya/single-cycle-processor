module immediate_gen_tb;

    // Inputs
    reg [31:0] input_instruction;

    // Outputs
    wire [31:0] output_instruction;

    // Instantiate the immediate_gen module
    immediate_gen uut (
        .input_instruction(input_instruction),
        .output_instruction(output_instruction)
    );

    // Testbench stimulus
    initial begin
        // Test case 1: R-Format (Opcode 51)
        input_instruction = 51;
        #10;
        input_instruction = 3;
        #10;
        input_instruction = 35;
        #10;
        input_instruction = 103;
        #10;

//        // Test case 2: lw (Opcode 3)
//        input_instruction = 32'h0000013;
//        #10;

//        // Test case 3: sw (Opcode 35)
//        input_instruction = 32'h0100013;
//        #10;

//        // Test case 4: jalr (Opcode 103)
//        input_instruction = 32'h1100113;
//        #10;

        // Add more test cases as needed

        // End simulation
        $stop;
    end

endmodule
