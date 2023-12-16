`timescale 1ns/1ps  // Adjust the timescale as needed

module data_memory_tb;

    reg clock;
    reg [6:0] address;
    reg MemWrite, MemRead;
    reg [31:0] WriteData;
    wire [31:0] ReadData;

    // Instantiate the data_memory module
    data_memory uut (
        .clock(clock),
        .address(address),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .WriteData(WriteData),
        .ReadData(ReadData)
    );

    // Clock generation
    always #5 clock = ~clock;

    // Initial values
    initial begin
        clock = 0;
        address = 0;
        MemWrite = 0;
        MemRead = 0;
        WriteData = 0;

        // Test scenario 1: Write to memory
        #10;
        address = 1;
        WriteData = 42;
        MemWrite = 1;

        #10;
        MemWrite = 0;

        // Test scenario 2: Read from memory
        #10;
        address = 0;
        MemRead = 1;

        #10;
        MemRead = 0;

        // Test scenario 3: Another write
        #10;
        address = 2;
        WriteData = 99;
        MemWrite = 1;

        #10;
        MemWrite = 0;

        // Add more test scenarios as needed

        #10;
        $finish; // Finish the simulation after a certain time
    end

endmodule
