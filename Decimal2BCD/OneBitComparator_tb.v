`include "OneBitComparator.v"

module Testbench;
    reg A, B;
    wire Greater, Equal, Smaller;

    OneBitComparator onebitcomparator(
        .A(A),
        .B(B),
        .Greater(Greater),
        .Equal(Equal),
        .Smaller(Smaller)
    );

    initial begin
        // Initialize inputs
        A = 1'b0;
        B = 1'b0;

        // Apply test vectors
        #10 A = 1'b0; B = 1'b1; // Change inputs
        #10 A = 1'b1; B = 1'b0; // Change inputs
        #10 A = 1'b1; B = 1'b1; // Change inputs
        #10 $finish; // End simulation
    end

    initial begin
        $monitor("At time %d: A = %b, B = %b, Greater = %b, Equal = %b, Smaller = %b",
                 $time, A, B, Greater, Equal, Smaller);
    end
endmodule