`include "400522319_Q1.v"

module Testbench;
    reg [3:0] A, B;
    reg CLK, EN;
    reg [1:0] C;
    wire [3:0] Out_Bits;
    wire Out_C;

    TopModule topmodule(
        .A(A),
        .B(B),
        .CLK(CLK),
        .EN(EN),
        .C(C),
        .Out_Bits(Out_Bits),
        .Out_C(Out_C)
    );

    initial begin
        A = 4'b0000;
        B = 4'b0000;
        CLK = 0;
        EN = 0;
        C = 2'b00;

		// A > B

		A = 4'b0011; // 3
        B = 4'b0010; // 2
		C = 2'b00;	// 0
		EN = 1;
        #10;
        $display("Test case 1: A = %b B = %b C = %b -> Out_Bits = %b Out_C = %b", A, B, C, Out_Bits, Out_C);

		A = 4'b0011; // 3
        B = 4'b0010; // 2
		C = 2'b01;	// 1
		EN = 1;
        #10;
        $display("Test case 2: A = %b B = %b C = %b -> Out_Bits = %b Out_C = %b", A, B, C, Out_Bits, Out_C);

		A = 4'b0011; // 3
        B = 4'b0010; // 2
		C = 2'b10;	// 2
		EN = 1;
        #10;
        $display("Test case 3: A = %b B = %b C = %b -> Out_Bits = %b Out_C = %b", A, B, C, Out_Bits, Out_C);

		A = 4'b0011; // 3
        B = 4'b0010; // 2
		C = 2'b10;	// 2
		EN = 0;
        #10;
        $display("Test case 4: A = %b B = %b C = %b EN = %b -> Out_Bits = %b Out_C = %b", A, B, C, EN, Out_Bits, Out_C);

		// A = B

		A = 4'b0111; // 7
        B = 4'b0111; // 7
		C = 2'b00;	// 0
		EN = 1;
        #10;
        $display("Test case 5: A = %b B = %b C = %b -> Out_Bits = %b Out_C = %b", A, B, C, Out_Bits, Out_C);

		A = 4'b0111; // 7
        B = 4'b0111; // 7
		C = 2'b01;	// 1
		EN = 1;
        #10;
        $display("Test case 6: A = %b B = %b C = %b -> Out_Bits = %b Out_C = %b", A, B, C, Out_Bits, Out_C);

		A = 4'b0111; // 7
        B = 4'b0111; // 7
		C = 2'b10;	// 2
		EN = 1;
        #10;
        $display("Test case 7: A = %b B = %b C = %b -> Out_Bits = %b Out_C = %b", A, B, C, Out_Bits, Out_C);

		A = 4'b0111; // 7
        B = 4'b0111; // 7
		C = 2'b10;	// 2
		EN = 0;
        #10;
        $display("Test case 8: A = %b B = %b C = %b EN = %b -> Out_Bits = %b Out_C = %b", A, B, C, EN, Out_Bits, Out_C);

        $finish;
    end

    always #1 CLK = ~CLK; 

endmodule