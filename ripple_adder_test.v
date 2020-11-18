`include "ripple_adder.v"

module RippleCarryAdder_Test;

  logic [7:0] a, b, s;
  logic cin, cout;

  RippleCarryAdder#(.WIDTH(8)) adder(.a(a), .b(b), .s(s), .cin(cin), .cout(cout));

  initial begin
    $monitor($time," A=%x, B=%x, S=%x, cin=%x, cout=%x", a, b, s, cin, cout);

    a = 8'h00; b = 8'h00; cin = 0;
    #5
    assert (s == 8'h00 && cout == 0);

    a = 8'h35; b = 8'h70; cin = 0;
    #5
    assert (s == 8'hA5 && cout == 0);

    a = 8'hD2; b = 8'h13; cin = 0;
    #5
    assert (s == 8'hE5 && cout == 0);

    a = 8'h33; b = 8'h11; cin = 1;
    #5
    assert (s == 8'h45 && cout == 0);

    a = 8'hE7; b = 8'h5A; cin = 0;
    #5
    assert (s == 8'h41 && cout == 1);

  end

endmodule
