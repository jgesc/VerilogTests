// Test for the parametrized D-Latch

`include "mult2to1.v"

module Mult2To1_Test;
  // Input and outputs
  logic[7:0] in_a, in_b, out;

  // CLK and RST pins
  logic ctrl;

  // Instantiate modules
  Mult2To1#(.WIDTH(8)) mult (.in_a(in_a), .in_b(in_b), .out(out), .ctrl(ctrl));

  initial begin
    $display("Multiplexer 2 to 1");
    $monitor($time," IN_A=%x, IN_B=%x, OUT=%x, CTRL=%x", in_a, in_b, out, ctrl);
    ctrl = 0; in_a=8'hAA; in_b=8'hBB;
    #5
    ctrl = 1; in_a=8'hAA; in_b=8'hBB;
    #5
    ctrl = 1; in_a=8'h95; in_b=8'hBB;
    #5
    ctrl = 1; in_a=8'h23; in_b=8'hAF;
    #5
    ctrl = 0; in_a=8'h80; in_b=8'h0E;
  end

endmodule
