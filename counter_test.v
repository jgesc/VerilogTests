`include "counter.v"

module CounterTest;
  integer i;

  logic set, rst, mode, clk;
  logic [7:0] a;
  logic [7:0] out;
  Counter#(.WIDTH(8)) ctr(.set(set), .rst(rst), .mode(mode), .clk(clk), .a(a),
    .out(out));

  initial begin
    $display("Counter");
    $monitor($time, " OUT=%x, MODE=%x, SET=%x, RST=%x, A=%x, CLK=%x",
      out, mode, set, rst, a, clk);
    set = '0; rst = '0; mode = '0; clk = '0; a = '0;

    // Reset circuit
    $display("Reset Test");
    rst = 1;
    #5
    rst = 0;
    assert(out == 8'h00);
    #5

    // Increment test
    $display("Increment Test");
    for(i = 1; i < 256; i++) begin
      clk = 1; #5 clk = 0; #5;
      assert(out == i);
    end

    // Increment test
    $display("Decrement Test");
    mode = 1;
    for(i = 254; i > -1; i--) begin
      clk = 1; #5 clk = 0; #5;
      assert(out == i);
    end

    // Set test
    $display("Set Test");
    mode = 0;
    a = 'h55; set = 1;
    clk = 1;
    #5 clk = 0;
    #5 assert(out == 'h55);
    set = 0;

    clk = 0;

    for(i = 0; i < 5; i++) begin
      clk = 1; #5 clk = 0; #5;
    end
    assert(out == 'h5A);
  end

endmodule
