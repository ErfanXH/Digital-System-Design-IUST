module Buffer (
    input [7:0] data_in,
    input clk, rst, write, read,
    output reg full, empty,
    output reg [7:0] data_out
);
    
    reg [7:0] buffer [10:0];    // 11 memory storages, each 8 bits
    integer cnt;

    initial begin
        cnt = 0;
    end

    always @(posedge clk or rst) begin
        if (rst) begin
            empty <= 1'b1;
            full <= 1'b0;
            data_out <= 8'b00000000;
        end
        if (read == 1'b1) begin
            if (empty == 1'b0) begin
                data_out = buffer[cnt - 1];
                cnt = cnt - 1;
                full = 1'b0;
                if (cnt == 0) begin
                    empty = 1'b1;
                end
                else begin
                    empty = 1'b0;
                end
            end
        end
        if (write == 1'b1) begin
            if (full == 1'b0) begin
                buffer[cnt] = data_in;
                data_out = data_in;     // setting out = in when writing
                cnt = cnt + 1;
                empty = 1'b0;
                if (cnt == 11) begin
                    full = 1'b1;
                end
                else begin
                    full = 1'b0;
                end
            end
        end
    end

endmodule