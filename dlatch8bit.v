module DLatch8Bit
(
  input   logic       clk,
  input   logic       rst,
  input   logic[7:0]  d,
  output  logic[7:0]  q
);

  logic[7:0] state;

  always_latch begin
    if (rst)
      state = 0;
    state <= clk ? d : state;
    q <= clk ? q : state;
  end
endmodule
