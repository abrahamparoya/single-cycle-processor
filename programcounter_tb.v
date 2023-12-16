module programcounter_tb;

    // Parameters
    parameter CLOCK_PERIOD = 10; // Clock period in time units

    // Signals
    reg [31:0] next_address; // Stimulus: Input for the next memory address to be loaded into the PC
    reg clk; // Stimulus: Clock signal input
    wire [31:0] address; // Observation: Output representing the current memory address stored in the PC

    // Instantiate the program counter module
    programcounter pc (
        .next_address(next_address),
        .address(address),
        .clk(clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #((CLOCK_PERIOD) / 2) clk = ~clk; // Generate a clock signal with a specified period
    end

    // Test scenario
    initial begin
        // Initialize next_address
        next_address = 32'h00000000;

        // Apply stimulus
        #5 next_address = 32'h1000; // Set a new address after 5 time units
        #5 next_address = 32'h2000; // Set another new address after 5 time units

        // Check the results
        #10 $stop; // Stop simulation after 10 time units
    end

    // Display simulation results
    initial begin
        $monitor("Time=%0t next_address=%h address=%h", $time, next_address, address); // Display simulation results
    end

endmodule
