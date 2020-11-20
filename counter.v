// Increment / Decrement counter with Set / Reset
`include "dlatch.v"

module CounterCell
(
  input   logic             a,
  input   logic             b,
  input   logic             d,
  output  logic             s,
  output  logic             c
);

  logic a_;

  assign s = a ^ b;
  assign a_ = a ^ d;
  assign c = a_ & b;

endmodule

module Counter
#(
  parameter integer WIDTH = 8
)
(
  input   logic [WIDTH-1:0] a,
  input   logic             set,
  input   logic             rst,
  input   logic             mode,
  input   logic             clk,
  output  logic [WIDTH-1:0] out
);

  // Wiring
  logic [WIDTH-1:0] latch_ctr;
  logic [WIDTH-1:0] ctrout;
  logic [WIDTH-1:0] latchin;

  logic [WIDTH:0] ctr_c;

  // DLatch memory
  DLatch#(.WIDTH(WIDTH)) state(.clk(clk), .rst(rst), .d(latchin), .q(latch_ctr));

  // Generate counter circuitry
  genvar i;
  generate
    for(i = 0; i < WIDTH; i++) begin
      CounterCell ctr(
        .a(latch_ctr[i]),
        .b(ctr_c[i]),
        .c(ctr_c[i+1]),
        .s(ctrout[i]),
        .d(mode)
      );
    end
  endgenerate
  assign ctr_c[0] = '1;

  // Control Counter / Set modes
  assign latchin = set ? a : ctrout;

  // Assign output
  assign out = latch_ctr;

endmodule
