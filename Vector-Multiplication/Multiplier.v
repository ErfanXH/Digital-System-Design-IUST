module Multiplier #(
    parameter N = 3,    // Vectors Size
    parameter W = 3     // Numbers Width
) (
    input clock,
    input [W - 1:0] number_vector1, number_vector2,
    output reg [2 * W - 1:0] out
);

    reg [W - 1:0] vector1 [N - 1:0];    // vector1 = N numbers, each W bits wide
    reg [W - 1:0] vector2 [N - 1:0];    // vector2 = N numbers, each W bits wide
    reg [2 * W - 1:0] partial_product [N - 1:0];   
    reg [2 * W - 1:0] partial_sum;
    integer i;
    integer counter;
    reg is_complete;

    initial begin
        i = 0;
        counter = 0;
        is_complete = 1'b0;
        partial_sum = 0;
        out = 0;
        for (i = 0; i < N; i = i + 1) begin        
            vector1[i] = 0;
            vector2[i] = 0;
            partial_product[i] = 0;
        end
        i = 0;
    end

    // Data Path and Control Unit
    always @(posedge clock) begin
        if (is_complete == 1'b0) begin
            for (i = 0; i < N; i = i + 1) begin
                if (i == 0) begin
                    vector1[i + 1] <= number_vector1;
                    vector2[i + 1] <= number_vector2;
                    partial_product[i] <= number_vector1 * number_vector2;
                end
                else begin
                    vector1[i + 1] <= vector1[i];
                    vector2[i + 1] <= vector2[i];
                    partial_product[i] <= vector1[i] * vector2[i];
                end
            end
            counter = counter + 1;
            if (counter == N) begin
                is_complete <= 1'b1;
            end
        end
        else begin
            for (i = 0; i < N; i = i + 1) begin
                partial_sum = partial_sum + partial_product[i];
                out = out + partial_product[i];
            end
        end
    end
endmodule
