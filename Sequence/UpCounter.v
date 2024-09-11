module UpCounter (
	input CLK,
	input Reset,
	output reg [3:0] Number
);

	initial begin
		Number = 4'b0000;
	end

	always @(posedge CLK)
	begin
		if (Reset)
			Number <= 4'b0000;
		else if (Number == 4'b0111)
			Number <= 4'b0000;
		else
			Number <= Number + 1;
	end
	
endmodule