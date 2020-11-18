// Ripple carry built at gate-level

`include "full_adder.v"

module RippleCarryAdder
#(
  parameter integer WIDTH = 8
)
(
  input   logic             cin,
  input   logic [WIDTH-1:0] a,
  input   logic [WIDTH-1:0] b,
  output  logic [WIDTH-1:0] s,
  output  logic             cout
);

  // Carry wires
  logic c[WIDTH];

  genvar i;
  generate
    for(i = 0; i < WIDTH; i++) begin
      FullAdder adder(
        .a(a[i]),
        .b(b[i]),
        .s(s[i]),
        .cin(i > 0 ? c[i - 1] : cin),
        .cout(c[i])
      );
    end
  endgenerate

  assign cout = c[WIDTH-1];

endmodule
