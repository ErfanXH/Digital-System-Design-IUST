`include "Multiplier.v"

module Multiplier_tb;

  parameter N = 3;
  parameter W = 3;
  parameter clock_period = 10;

  reg clock;
  reg [W-1:0] number_vector1, number_vector2;
  wire [2*W-1:0] out;

  // Instantiate Multiplier module
  Multiplier #(
    .N(N),
    .W(W)
  ) uut (
    .clock(clock),
    .number_vector1(number_vector1),
    .number_vector2(number_vector2),
    .out(out)
  );

  initial begin
    clock = 0;
    forever #((clock_period)/2) clock = ~clock;
  end

  initial begin
    // Initial values and wait for a few clock cycles
    number_vector1 = 3'b000; 
    number_vector2 = 3'b000;
    #5;

    // MSB must be 0!
    // 1st number
    number_vector1 = 3'b011;
    number_vector2 = 3'b011;
    #10
    // 2nd number
    number_vector1 = 3'b010;
    number_vector2 = 3'b011;
    #10
    // 3rd number
    number_vector1 = 3'b011;
    number_vector2 = 3'b010;
    #10

    #0 $finish;
  end

  always @(posedge clock) begin
    $display("Time=%0t | Output=%d", $time, out);
  end

endmodule