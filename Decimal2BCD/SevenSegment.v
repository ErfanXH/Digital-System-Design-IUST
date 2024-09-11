module SevenSegment (
    input [9:0] Number,
    output wire [6:0] SevenSegment
);

	// SevenSegment = a b c d e f g

    assign SevenSegment = (Number == 10'b0000000000) ? 7'b1111110 :
                          (Number == 10'b0000000001) ? 7'b0110000 :
                          (Number == 10'b0000000010) ? 7'b1101101 :
                          (Number == 10'b0000000100) ? 7'b1111001 :
                          (Number == 10'b0000001000) ? 7'b0110011 :
                          (Number == 10'b0000010000) ? 7'b1011011 :
                          (Number == 10'b0000100000) ? 7'b1011111 :
                          (Number == 10'b0001000000) ? 7'b1110000 :
                          (Number == 10'b0010000000) ? 7'b1111111 :
                          (Number == 10'b0100000000) ? 7'b1111101 :
                          7'b0000000;

endmodule