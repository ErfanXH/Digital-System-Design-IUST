`include "FourBitComparator.v"

module DecimalToBCD (
	input [7:0] Decimal,
	output [7:0] BCD
);

	reg [3:0] Three, Five;
	wire Greater_R = 0, Equal_R = 0, Smaller_R = 0;
	wire Greater_L = 0, Equal_L = 0, Smaller_L = 0;
	reg [7:0] result, tmp;
	integer i;

	FourBitComparator RightBits(
		tmp[3:0], Five, Greater_R, Equal_R, Smaller_R
		);

	FourBitComparator LeftBits(
		tmp[7:4], Five, Greater_L, Equal_L, Smaller_L
		);
	
	initial begin
		result = 8'b00000000;
		tmp = 8'b00000000;
		Three = 4'b0011;
		Five = 4'b0101;
	end

	always @(*) begin
	result = 8'b00000000;
    for (i= 0; i < 8; i = i + 1) begin
        if (result[3] == 1'b1 | (result[3:2] == 2'b01 & result[1:0] != 2'b00)) begin
            result[3:0] = result[3:0] + Three;
		end
		if(result[7] == 1'b1 | (result[7:6] == 2'b01 & result[5:4] != 2'b00))begin
            result[7:4] = result[7:4] + Three;
		end
        result = result << 1;
        result[0] = Decimal[7 - i];
    end
	end

	assign BCD = result;

endmodule