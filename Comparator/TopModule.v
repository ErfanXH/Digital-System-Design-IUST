`include "FourBitComparator.v"

module TopModule (
	input [3:0] A, B,
	input CLK, EN,
	input [1:0] C,
	output reg [3:0] Out_Bits, 
	output reg Out_C
);
	
	wire Greater, Equal, Smaller;

	FourBitComparator comparator(
		.A(A),
		.B(B),
		.Greater(Greater),
		.Equal(Equal),
		.Smaller(Smaller)
	);

	always @(posedge CLK) begin
		if (EN == 0) begin
			Out_Bits <= 4'b0000;
			Out_C <= 1'b0;
		end
		else if (C == 2'b00) begin
			Out_C <= Greater;
		end
		else if (C == 2'b01) begin
			Out_C <= Equal;
		end
		else if (C == 2'b10) begin
			Out_C <= Smaller;
		end
		else if (C == 2'b11) begin
			Out_C <= 1'bx;
		end
		if (EN == 1) begin
			if (Out_C == 1'b1) begin	// added if is zero then outbits also zero
				if (Greater == 1'b1) begin
					Out_Bits <= A;
				end
				else begin
					Out_Bits <= B;
				end
			end
			else begin
				Out_Bits <= 4'b0000;
			end
		end
	end

endmodule