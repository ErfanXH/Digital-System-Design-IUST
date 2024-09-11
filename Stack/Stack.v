module Stack #(
    parameter data_count = 3,
    parameter data_width = 16
) (
    input clock,
    input pop, push,
    input [data_width - 1:0] data_in,
    output reg empty, full,
    output reg [data_width - 1:0] data_out
);
    
    reg [data_width - 1:0] registers [data_count - 1:0]; 
    integer current;
    integer i;

    initial begin
        empty = 1'b1;
        full = 1'b0;
        data_out = 0;
        current = 0;
        i = 0;

        for (i = 0; i < data_count; i = i + 1) begin
            registers[i] = 0;
        end

        i = 0;
    end

    always @(posedge clock) begin
        if (push == 1'b1) begin
            if (current == data_count) begin
                full = 1'b1;
                empty = 1'b0;
            end
            else begin
                data_out <= data_in;    // setting out = in when pushing
                for (i = data_count - 1; i >= 0; i = i - 1) begin
                    if (i == 0) begin
                        registers[i] <= data_in;
                    end
                    else begin
                        registers[i] <= registers[i - 1];
                    end
                end
                current = current + 1;
                full = 1'b0;
                empty = 1'b0;
            end
        end
        if (pop == 1'b1) begin
            if (current == 0) begin
                empty = 1'b1;
                full = 1'b0;
                data_out <= 0;
            end
            else begin
                data_out <= registers[0];
                for (i = 0; i < data_count - 1; i = i + 1) begin
                    registers[i] <= registers[i + 1];
                end
                current = current - 1;
                full = 1'b0;
                empty = 1'b0;
            end
        end
    end

endmodule