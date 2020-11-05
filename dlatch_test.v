// Test for the parametrized D-Latch

`include "dlatch.v"

module DLatch_Test;
  // Input and outputs
  logic[7:0] d8, q8;
  logic[15:0] d16, q16;

  // CLK and RST pins
  logic clk, rst;

  // Instantiate modules
  DLatch#(.WIDTH(8)) latch8bit (.d(d8), .clk(clk), .q(q8), .rst(rst));
  DLatch#(.WIDTH(16)) latch16bit (.d(d16), .clk(clk), .q(q16), .rst(rst));

  initial begin
    // 8 bits
    $display("8-bits");
    $monitor($time," D=%x, CLK=%x, Q=%x, RST=%x", d8, clk, q8, rst);
    clk = 0; d8=8'h00; rst = 1;
    #5
    clk = 0; d8=8'hFF; rst = 0;
    #5
    clk = 1; d8=8'hAA;
    #5
    clk = 1; d8=8'h6D;
    #5
    clk = 0; d8=8'h25;
    #5
    clk = 0; d8=8'h52;
    #5
    clk = 1; d8=8'hBA;
    #5
    clk = 1; d8=8'hC5;
    #5
    clk = 0; d8=8'h80;
    #5
    clk = 0; d8=8'h99;
    #5
    rst = 1;
    #5
    rst = 0;
    #5
    clk = 0; d8=8'h25;
    #5
    clk = 0; d8=8'h52;
    #5
    clk = 1; d8=8'hBA; rst = 1;
    #5
    clk = 1; d8=8'hC5; rst = 0;
    #5
    clk = 0; d8=8'h80;
    #5
    clk = 0; d8=8'h99;
    #5
    rst = 1;
    #5
    rst = 0;

    // 16 bits
    $display("16-bits");
    $monitor($time," D=%x, CLK=%x, Q=%x, RST=%x", d16, clk, q16, rst);
    clk = 0; d16=16'h0000; rst = 1;
    #5
    clk = 0; d16=16'hFFFF; rst = 0;
    #5
    clk = 1; d16=16'hAABB;
    #5
    clk = 1; d16=16'h6D98;
    #5
    clk = 0; d16=16'h25EA;
    #5
    clk = 0; d16=16'h5252;
    #5
    clk = 1; d16=16'hBA0D;
    #5
    clk = 1; d16=16'hC5A0;
    #5
    clk = 0; d16=16'h160B;
    #5
    clk = 0; d16=16'h99C8;
    #5
    rst = 1;
    #5
    rst = 0;
    #5
    clk = 0; d16=16'h2573;
    #5
    clk = 0; d16=16'h524A;
    #5
    clk = 1; d16=16'hBA5E; rst = 1;
    #5
    clk = 1; d16=16'hC544; rst = 0;
    #5
    clk = 0; d16=16'h160A;
    #5
    clk = 0; d16=16'h9988;
    #5
    rst = 1;
    #5
    rst = 0;
  end

endmodule
