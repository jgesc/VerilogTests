`include "lifo.v"

module LIFO_Test;

logic clk, rst, full, psh, pll;
logic [7:0] in, out;

LIFO#(.WIDTH(8), .DEPTH(4)) lifo
(
  .clkin(clk),
  .rst(rst),
  .psh(psh),
  .pll(pll),
  .in(in),
  .out(out),
  .full(full)
);

  initial begin
    $display("FIFO Memory");
    $monitor($time," CLK=%x, RST=%x, FULL=%x, PSH=%x, PLL=%x, IN=%x, OUT=%x",
      clk, rst, full, psh, pll, in, out);

    // Reset memory
    $display("Reset");
    rst = 1; clk = 0; psh = 0; pll = 0; in = 0;
    #5
    rst = 0;
    #5

    // Push memory
    $display("Push test");
    assert (!full);
    psh = 1;
    clk = 1; in = 8'hA1;
    #5
    clk = 0; in = 8'hB2;
    #5
    clk = 1;
    #5
    clk = 0; in = 8'hC3;
    #5
    clk = 1;
    #5
    clk = 0; in = 8'hD4;
    assert (!full);
    #5
    clk = 1;
    #5
    clk = 0; in = 'z; psh = 0;
    #5
    assert (full);

    // Pull
    $display("Pull test");
    pll = 1;
    clk = 1;
    #5
    assert(out == 8'hD4);
    clk = 0;
    #5
    assert(!full);
    clk = 1;
    assert(!full);
    assert(out == 8'hC3);
    #5
    clk = 0;
    #5
    clk = 1;
    assert(!full);
    assert(out == 8'hB2);
    #5
    clk = 0;
    #5
    clk = 1;
    assert(!full);
    assert(out == 8'hA1);
    #5
    clk = 0;
    #5
    clk = 1;
    assert(!full);
    assert(out == 8'h00);
    #5
    clk = 0;
    #5
    clk = 1;
    assert(!full);
    assert(out == 8'h00);
    #5
    clk = 0;

  end

endmodule
