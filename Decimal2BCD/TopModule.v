`include "DecimalToBCD.v"
`include "Decoder.v"
`include "SevenSegment.v"

module DecimalToSevenSegment (
	input [7:0] Decimal,
	output [6:0] SevenSegment_R, SevenSegment_L
);

	wire [7:0] BCD;
	wire [9:0] Number_L, Number_R;

	DecimalToBCD DecimalToBCD(
		.Decimal(Decimal),
		.BCD(BCD)
		);

	Decoder Decoder_Right(
		.BCD(BCD[3:0]),
		.Number(Number_R)
		);

	Decoder Decoder_Left(
		.BCD(BCD[7:4]),
		.Number(Number_L)
		);

	SevenSegment SevenSegment_Right(
		.Number(Number_R),
		.SevenSegment(SevenSegment_R)
		);

	SevenSegment SevenSegment_Left(
		.Number(Number_L),
		.SevenSegment(SevenSegment_L)
		);

endmodule