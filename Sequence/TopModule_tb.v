`include "400522319_Q3.v"

module Sequence_tb;

  reg CLK;
  reg Reset;
  reg [3:0] Counter;
  wire [3:0] Number;

  Sequence u1 (
    .CLK(CLK),
    .Reset(Reset),
    .Number(Number)
  );

  always begin
    #1 CLK = ~CLK;
  end

  initial begin
    CLK = 0;
    Reset = 0;

	#2
	$display("Number = %b", Number);
	#2
	$display("Number = %b", Number);
	#2
	$display("Number = %b", Number);
	#2
	$display("Number = %b", Number);
	#2
	$display("Number = %b", Number);
	#2
	$display("Number = %b", Number);
	#2
	$display("Number = %b", Number);
	#2
	$display("Number = %b", Number);
	#2
	$display("Number = %b", Number);
	#2
	$display("Number = %b", Number);
	#2
	$display("Number = %b", Number);

    #4 Reset = 1;
	#2
	$display("Number = %b Reset = %b", Number, Reset);

    #10 $finish;
  end

endmodule