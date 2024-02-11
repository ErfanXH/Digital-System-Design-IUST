`include "MUX2X1.v"

module MUX2X1_tb;

    reg D0;
    reg D1;
    reg S;
    wire Y;

    MUX2X1 MUX2X1_inst (
        .D0(D0),
        .D1(D1),
        .S(S),
        .Y(Y)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, MUX2X1_tb);
        #10 D0 = 0; D1 = 0; S = 0;
        #10 D0 = 0; D1 = 0; S = 1;
        #10 D0 = 0; D1 = 1; S = 0;
        #10 D0 = 0; D1 = 1; S = 1;
        #10 D0 = 1; D1 = 0; S = 0;
        #10 D0 = 1; D1 = 0; S = 1;
        #10 D0 = 1; D1 = 1; S = 0;
        #10 D0 = 1; D1 = 1; S = 1;
        #10 $finish;
    end

endmodule