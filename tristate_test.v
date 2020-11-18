// Test for the parametrized D-Latch

`include "tristate.v"

module TristateBuffer_Test;
  // Input and outputs
  logic[7:0] in, out;

  // Control
  logic c;

  // Instantiate modules
  TristateBuffer#(.WIDTH(8)) buffer (.in(in), .out(out), .c(c));

  initial begin
    $display("Tristate buffer");
    $monitor($time," IN=%x, OUT=%x, C=%x", in, out, c);

    c = 0; in=8'hC3;
    #5
    assert ($isunknown(out));

    c = 0; in=8'h5D;
    #5
    assert ($isunknown(out));

    c = 1; in=8'h81;
    #5
    assert (out == 8'h81);

    c = 1; in=8'h39;
    #5
    assert (out == 8'h39);

    c = 0; in=8'h39;
    #5
    assert ($isunknown(out));
  end

endmodule
