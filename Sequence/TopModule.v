`include "UpCounter.v"

module Sequence (
	input CLK,
	input Reset,
	output reg [3:0] Number
);

	wire [3:0] Counter;

	initial begin
		Number = 4'b0101;
	end

	UpCounter uc1 (
		CLK, 
		Reset, 
		Counter
	);

	always @(posedge CLK)
	begin
		if (Reset)
			Number <= 4'b0101;
		else begin
			case (Counter)
				4'b0000: Number <= 4'b0101;
				4'b0001: Number <= 4'b0100;
				4'b0010: Number <= 4'b0111;
				4'b0011: Number <= 4'b0110;
				4'b0100: Number <= 4'b0001;
				4'b0101: Number <= 4'b0000;
				4'b0110: Number <= 4'b0011;
				4'b0111: Number <= 4'b0010;
			endcase
		end
	end
	
endmodule