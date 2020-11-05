`include "dlatch8bit.v"

module DLatch8Bit_Test;

  logic[0:7] d, q;
  logic clk, rst;
  DLatch8Bit UUT (.d(d), .clk(clk), .q(q), .rst(rst));

  initial begin
    $monitor($time," D=%x, CLK=%x, Q=%x, RST=%x", d, clk, q, rst);
    clk = 0; d=8'h00; rst = 1;
    #5
    clk = 0; d=8'hFF; rst = 0;
    #5
    clk = 1; d=8'hAA;
    #5
    clk = 1; d=8'h6D;
    #5
    clk = 0; d=8'h25;
    #5
    clk = 0; d=8'h52;
    #5
    clk = 1; d=8'hBA;
    #5
    clk = 1; d=8'hC5;
    #5
    clk = 0; d=8'h80;
    #5
    clk = 0; d=8'h99;
    #5
    rst = 1;
    #5
    rst = 0;
    #5
    clk = 0; d=8'h25;
    #5
    clk = 0; d=8'h52;
    #5
    clk = 1; d=8'hBA; rst = 1;
    #5
    clk = 1; d=8'hC5; rst = 0;
    #5
    clk = 0; d=8'h80;
    #5
    clk = 0; d=8'h99;
    #5
    rst = 1;
    #5
    rst = 0;
  end

endmodule
