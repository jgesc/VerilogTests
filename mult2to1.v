module Mult2To1
#(
  parameter int WIDTH = 8
)
(
  input   logic             ctrl,
  input   logic [WIDTH-1:0] in_a,
  input   logic [WIDTH-1:0] in_b,
  output  logic [WIDTH-1:0] out
);

assign out = ctrl ? in_b : in_a;

endmodule
