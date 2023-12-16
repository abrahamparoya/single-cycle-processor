module multiplexer (
  input wire [63:0] data_0,
  input wire [63:0] data_1,
  input select,
  output reg [63:0] output_data
);

always @ (*)
begin
  if (select)
    output_data <= data_1;
  else
    output_data <= data_0;
end

endmodule
