module instruction_memory_testbench();
    reg [31:0] address;
    wire [31:0] instruction;

    // Instantiate the instruction_memory module
    instruction_memory im (
        .address(address),
        .instruction(instruction)
    );

    // Stimulus
    initial begin
        // Test with different addresses
        address = 0;
        #10;

        address = 4;
        #10;

        address = 8;
        #10;

        // Stop simulation after testing
        $stop;
    end

    // Display simulation results
    initial begin
        $monitor("Time=%0t address=%h instruction=%h", $time, address, instruction);
    end
endmodule
