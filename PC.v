// This module represents a simple program counter (PC) in Verilog.
// The PC is used to store the memory address of the next instruction to be fetched.
// It has inputs for the next address to be loaded and the clock signal, 
// and an output that holds the current address.

module programcounter(
    input [31:0] next_address, // Input for the next memory address to be loaded into the PC
    output reg [31:0] address,  // Output representing the current memory address stored in the PC
    input wire clk             // Clock signal input
);

    // Initialization block to set the initial value of the address to 0
    initial begin
        address = 32'h00000000;
    end

    // Always block triggered on the positive edge of the clock signal
    always @(posedge clk) begin
        // Update the PC address with the next address on a clock edge
        address <= next_address;
    end
endmodule
