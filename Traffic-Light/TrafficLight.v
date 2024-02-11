module TrafficLight(
    input wire Clock,
    input wire Reset,
    output reg Red,
    output reg Yellow,
    output reg Green
);

    parameter RedTime = 20;
    parameter RedYellowTime = 5;
    parameter GreenTime = 25;
    parameter YellowTime = 5;

    reg [1:0] State;    // 4 states: 00: RED, 01: RED-YELLOW, 10: GREEN, 11: YELLOW 

    integer Counter;    // Based on clock and to determine the time and state
    
    initial begin
        Red = 1'b0;
        Yellow = 1'b0;
        Green = 1'b0;
        State = 2'b00;
        Counter = 0;
    end

    always @(posedge Clock, negedge Clock, posedge Reset) begin    //posedge reset
        if (Reset) begin
            State = 2'b00;
            Red = 1'b0;
            Yellow = 1'b0;
            Green = 1'b0;
            Counter = 0;
        end 
        else begin
            case (State)
                2'b00: begin
                    Red = 1'b1;
                    Yellow = 1'b0;
                    Green = 1'b0;
                    Counter = Counter + 5;

                    if (Counter == RedTime) begin
                        State = 2'b01;
                    end
                end
                2'b01: begin
                    Red = 1'b1;
                    Yellow = 1'b1;
                    Green = 1'b0;
                    Counter = Counter + 5;

                    if (Counter == RedTime + RedYellowTime) begin
                        State = 2'b10;
                    end
                end
                2'b10: begin
                    Red = 1'b0;
                    Yellow = 1'b0;
                    Green = 1'b1;
                    Counter = Counter + 5;

                    if (Counter == RedTime + RedYellowTime + GreenTime) begin
                        State = 2'b11;
                    end
                end
                2'b11: begin
                    Red = 1'b0;
                    Yellow = 1'b1;
                    Green = 1'b0;
                    Counter = Counter + 5;

                    if (Counter == RedTime + RedYellowTime + GreenTime + YellowTime) begin
                        State = 2'b00;
                        Counter = 0;
                    end
                end
            endcase
        end
    end

endmodule