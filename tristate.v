module TristateBuffer
#(
  parameter integer WIDTH = 8
)
(
  input   logic             c,
  input   logic [WIDTH-1:0] in,
  output  logic [WIDTH-1:0] out
);

assign out = c ? in : 'z;

endmodule
