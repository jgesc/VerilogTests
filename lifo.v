// LIFO (stack) memory module made with D-Latches
`include "dlatch.v"
`include "mult2to1.v"

module LIFO
#(
  parameter int WIDTH = 8,
  parameter int DEPTH = 8
)
(
  input   logic             clkin,
  input   logic             rst,
  input   logic             psh,
  input   logic             pll,
  input   logic [WIDTH-1:0] in,
  output  logic [WIDTH-1:0] out,
  output  logic             full
);

  // Clock
  logic clk;
  assign clk = clkin && (psh || pll);

  // Internal wiring
  logic [WIDTH-1:0] dlatchout[DEPTH-1:0];
  logic [WIDTH-1:0] dlatchin[DEPTH-1:0];

  // Generate memory
  genvar i;
  generate
    for(i = 0; i < DEPTH; i = i + 1) begin
      // Generate multiplexer
      Mult2To1#(.WIDTH(WIDTH)) mult(
        .in_a(i < DEPTH-1 ? dlatchout[i+1] : '0),
        .in_b(i > 0 ? dlatchout[i-1] : in),
        .ctrl(psh),
        .out(dlatchin[i])
      );
      // Generate DLatch
      DLatch#(.WIDTH(WIDTH)) dlatch(
        .clk(clk),
        .rst(rst),
        .d(dlatchin[i]),
        .q(dlatchout[i])
      );
    end
  endgenerate

  // Out tristate buffer
  assign out = pll ? dlatchout[0] : 'z;
  // Check full
  assign full = |dlatchout[DEPTH-1];

endmodule
