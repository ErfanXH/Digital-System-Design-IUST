`include "Counter.v"

module Counter_tb;

    reg clock;
    wire [7:0] data_out;

    Counter dut (
        .clock(clock),
        .data_out(data_out)
    );

    initial begin
        $dumpfile("dump.vcd"); 
        $dumpvars(0, Counter_tb); 

        clock = 0;

        #40 $finish;
    end

    always #1 clock = ~clock;

endmodule
