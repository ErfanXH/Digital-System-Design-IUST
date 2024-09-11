`include "UpCounter.v"

module UpCounter_tb;

  reg CLK;
  reg Reset;
  wire [3:0] Number;

  // Instantiate the UpCounter
  UpCounter u1 (
    .CLK(CLK),
	.Reset(Reset),
    .Number(Number)
  );

  always begin
    #1 CLK = ~CLK;
  end

  always begin
	#1 Reset = 0;
  end

  // Monitor the output
  initial begin
    #1
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

  end

  // Initialize and run the test
  initial begin
    CLK = 0;
    #100 $finish;
  end

endmodule