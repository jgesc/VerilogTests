module HalfAdder
(
  input logic a,
  input logic b,
  output logic c,
  output logic s
);

  assign s = a ^ b;
  assign c = a & b;

endmodule
