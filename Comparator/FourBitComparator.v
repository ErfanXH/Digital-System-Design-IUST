`include "OneBitComparator.v"

module FourBitComparator (
	input [3:0] A, B,
	output Greater, Equal, Smaller
);
	
	wire Greater_3, Equal_3, Smaller_3,
		Greater_2, Equal_2, Smaller_2,
		Greater_1, Equal_1, Smaller_1,
		Greater_0, Equal_0, Smaller_0;

	OneBitComparator bit3(
		.A(A[3]),
		.B(B[3]),
		.Greater(Greater_3),
		.Equal(Equal_3),
		.Smaller(Smaller_3)
	);

	OneBitComparator bit2(
		.A(A[2]),
		.B(B[2]),
		.Greater(Greater_2),
		.Equal(Equal_2),
		.Smaller(Smaller_2)
	);

	OneBitComparator bit1(
		.A(A[1]),
		.B(B[1]),
		.Greater(Greater_1),
		.Equal(Equal_1),
		.Smaller(Smaller_1)
	);

	OneBitComparator bit0(
		.A(A[0]),
		.B(B[0]),
		.Greater(Greater_0),
		.Equal(Equal_0),
		.Smaller(Smaller_0)
	);

	assign Greater = (Greater_3) | (Equal_3 & Greater_2) | (Equal_3 & Equal_2 & Greater_1) | (Equal_3 & Equal_2 & Equal_1 & Greater_0);
	assign Equal = Equal_3 & Equal_2 & Equal_1 & Equal_0;
	assign Smaller = (Smaller_3) | (Equal_3 & Smaller_2) | (Equal_3 & Equal_2 & Smaller_1) | (Equal_3 & Equal_2 & Equal_1 & Smaller_0);


endmodule