module Decoder (
    input [3:0] BCD,
    output wire [9:0] Number
);

	// Number = 0 1 2 3 4 5 6 7 8 9

    assign Number = (BCD == 4'b0000) ? 10'b0000000001 :
                    (BCD == 4'b0001) ? 10'b0000000010 :
                    (BCD == 4'b0010) ? 10'b0000000100 :
                    (BCD == 4'b0011) ? 10'b0000001000 :
                    (BCD == 4'b0100) ? 10'b0000010000 :
                    (BCD == 4'b0101) ? 10'b0000100000 :
                    (BCD == 4'b0110) ? 10'b0001000000 :
                    (BCD == 4'b0111) ? 10'b0010000000 :
                    (BCD == 4'b1000) ? 10'b0100000000 :
                    (BCD == 4'b1001) ? 10'b1000000000 :
                    10'b0000000000;

endmodule