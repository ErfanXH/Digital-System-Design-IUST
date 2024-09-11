`include "DecimalToBCD.v"

module testbench;
    reg [7:0] Decimal;
    wire [7:0] BCD;

    DecimalToBCD uut (
        .Decimal(Decimal),
        .BCD(BCD)
    );

    initial begin

        for (Decimal = 0; Decimal < 100; Decimal = Decimal + 1) begin
            #10;
			$display("Decimal = %d :: BCD = %b", Decimal, BCD);
        end

        $finish;
    end
endmodule