// Code for a parametrized D-Latch

module DLatch
#(
  parameter int WIDTH = 8
)
(
  input   logic             clk,
  input   logic             rst,
  input   logic[WIDTH-1:0]  d,
  output  logic[WIDTH-1:0]  q
);

  logic[WIDTH-1:0] state;

  always_latch begin
    if (rst) begin
      state = 0;
      q = 0;
    end
    state <= clk ? d : state;
    q <= clk ? q : state;
  end
endmodule
