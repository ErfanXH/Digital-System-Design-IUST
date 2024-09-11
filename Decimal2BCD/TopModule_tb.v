`include "400522319_Q2.v"

module Testbench;

    reg [7:0] Decimal;
    wire [6:0] SevenSegment_R, SevenSegment_L;

    DecimalToSevenSegment DUT (
        .Decimal(Decimal),
        .SevenSegment_R(SevenSegment_R),
        .SevenSegment_L(SevenSegment_L)
    );

    initial begin
        Decimal = 8'b00001111; // Test 1	(15)
        #10;
		$display("Decimal: %b -> SevenSegments: %b %b", Decimal, SevenSegment_L, SevenSegment_R);
        Decimal = 8'b01100000; // Test 2	(96)
        #10;
		$display("Decimal: %b -> SevenSegments: %b %b", Decimal, SevenSegment_L, SevenSegment_R);
        Decimal = 8'b00101010; // Test 3	(42)
        #10;
		$display("Decimal: %b -> SevenSegments: %b %b", Decimal, SevenSegment_L, SevenSegment_R);
        Decimal = 8'b01010101; // Test 4	(85)
        #10;
		$display("Decimal: %b -> SevenSegments: %b %b", Decimal, SevenSegment_L, SevenSegment_R);
		Decimal = 8'b00000010; // Test 5	(2)
        #10;
		$display("Decimal: %b -> SevenSegments: %b %b", Decimal, SevenSegment_L, SevenSegment_R);
        
        $finish;
    end

endmodule