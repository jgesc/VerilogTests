`include "half_adder.v"

module FullAdder
(
  input   logic             cin,
  input   logic             a,
  input   logic             b,
  output  logic             s,
  output  logic             cout
);

  logic s_to_b, ha1_c, ha2_c;

  HalfAdder ha1(.a(a), .b(b), .c(ha1_c), .s(s_to_b));
  HalfAdder ha2(.a(cin), .b(s_to_b), .c(ha2_c), .s(s));

  assign cout = ha1_c ^ ha2_c;

endmodule
