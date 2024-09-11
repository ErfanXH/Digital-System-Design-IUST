`include "FourBitComparator.v"

module Testbench;
    reg [3:0] A, B;
    wire Greater, Equal, Smaller;

    FourBitComparator fourbitcomparator(
        .A(A),
        .B(B),
        .Greater(Greater),
        .Equal(Equal),
        .Smaller(Smaller)
    );

    initial begin
        A = 4'b0000;
        B = 4'b0000;
		#10
		$display("Test case 0: A = %b B = %b -> Greater = %b Equal = %b Smaller = %b", A, B, Greater, Equal, Smaller);

		A = 4'b0101; B = 4'b0011; 
        #10;
        $display("Test case 1: A = %b B = %b -> Greater = %b Equal = %b Smaller = %b", A, B, Greater, Equal, Smaller);

		A = 4'b1111; B = 4'b0000;  
        #10;
        $display("Test case 2: A = %b B = %b -> Greater = %b Equal = %b Smaller = %b", A, B, Greater, Equal, Smaller);

		#10 A = 4'b0000; B = 4'b1111;
        #10;
        $display("Test case 3: A = %b B = %b -> Greater = %b Equal = %b Smaller = %b", A, B, Greater, Equal, Smaller);

		A = 4'b0011; B = 4'b0101; 
        #10;
        $display("Test case 4: A = %b B = %b -> Greater = %b Equal = %b Smaller = %b", A, B, Greater, Equal, Smaller);

		A = 4'b1011; B = 4'b1011; 
        #10;
        $display("Test case 5: A = %b B = %b -> Greater = %b Equal = %b Smaller = %b", A, B, Greater, Equal, Smaller);

		#10 $finish; 
    end

    // initial begin
    //     $monitor("At time %d: A = %b, B = %b, Greater = %b, Equal = %b, Smaller = %b",
    //              $time, A, B, Greater, Equal, Smaller);
    // end
endmodule