module register_file_tb;

    // Inputs
    reg [4:0] ReadRegister1, ReadRegister2, WriteRegister;
    reg [31:0] WriteData;
    reg RegWrite, Clk;

    // Outputs
    wire [31:0] ReadData1, ReadData2;

    // Instantiate the register_file module
    register_file uut (
        .ReadRegister1(ReadRegister1),
        .ReadRegister2(ReadRegister2),
        .WriteRegister(WriteRegister),
        .WriteData(WriteData),
        .RegWrite(RegWrite),
        .Clk(Clk),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    // Testbench stimulus
    initial begin
        // Test case 1: Write to Register 5
        WriteRegister = 5;
        WriteData = 32'hABCDEFFF;
        RegWrite = 1;
        #10;

        // Test case 2: Read from Register 2 and 7
        ReadRegister1 = 2;
        ReadRegister2 = 7;
        RegWrite = 0;
        #10;

        // Add more test cases as needed

        // End simulation
        $stop;
    end

endmodule
