module instruction_memory(
    input [31:0] address,       // Input for the memory address to read
    output reg [31:0] instruction // Output representing the instruction read from memory
);

    // 1 kilobyte memory initialized with 0s
    reg [31:0] mem [0:255];

    // Hard-coded program instructions
    initial begin


        // Replace these values with your actual instructions
        mem[0]   = 32'b00000000000000000010000010000011;    // $1 = a
        mem[1]   = 32'b00000000100000000010000100000011;    // $2 = b
        mem[2]   = 32'b00000001000000000010000110000011;    // $3 = c
        mem[3]   = 32'b00000001100000000010001000000011;    // $4 = d
        mem[4]   = 32'b00000010000000000010001010000011;    // $5 = e
        mem[5]   = 32'b00000010100000000010001100000011;    // $6 = f
        mem[6]   = 32'b00000010010100001000000010110011;   // $1 = a*e
        mem[7]   = 32'b00000010010000011000000110110011;    // $3 = c*d
        mem[8]   = 32'b01000000001100001000000010110011;    // $1 = (a*e - c*d)
        mem[9]   = 32'b00000000001000001000000010110011;    // $1 = (a*b - c*d) + b
        mem[10]  = 32'b00000010011000001100000010110011;    // $1 = ((a*b - c*d) + b)/f
        mem[11]  = 32'b00000000000001010010010000100011;    // data_mem[8] = $1
    end
always @(address) begin
        instruction <= mem[address>>2];
    end
    // Output the instruction based on the address

endmodule
