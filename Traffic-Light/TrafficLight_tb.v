`include "TrafficLight.v"

module TrafficLight_tb;

    reg Clock;
    reg Reset;
    wire Red;
    wire Yellow;
    wire Green;

    TrafficLight TrafficLight0(
        .Clock(Clock),
        .Reset(Reset),
        .Red(Red),
        .Yellow(Yellow),
        .Green(Green)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, TrafficLight_tb);
        Clock = 0;
        Reset = 0;
        #10 Reset = 1;
        #10 Reset = 0;
        #105 Reset = 1;
        #10 Reset = 0;
        #200 $finish;
    end

    always #5 Clock = ~Clock;

endmodule