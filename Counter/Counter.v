module Counter (    // counter from 0 to 10
    input wire clock,
    output reg[7:0] data_out
    );

    integer counter;

    initial begin
        counter = 0;
    end

    // Define an always block sensitive to the positive edge of the clock
    always @(posedge clock) begin
        if (counter == 10) begin
            counter = 0;
        end
        else begin
            counter = counter + 1;
        end
        data_out = counter;
    end

endmodule