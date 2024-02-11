module Decoder(
    input wire [3:0] address,
    output wire [15:0] select_line
    );

    assign select_line =  (address == 4'b0000) ? 16'b0000000000000001 :
                          (address == 4'b0001) ? 16'b0000000000000010 :
                          (address == 4'b0010) ? 16'b0000000000000100 :
                          (address == 4'b0011) ? 16'b0000000000001000 :
                          (address == 4'b0100) ? 16'b0000000000010000 :
                          (address == 4'b0101) ? 16'b0000000000100000 :
                          (address == 4'b0110) ? 16'b0000000001000000 :
                          (address == 4'b0111) ? 16'b0000000010000000 :
                          (address == 4'b1000) ? 16'b0000000100000000 :
                          (address == 4'b1001) ? 16'b0000001000000000 :
                          (address == 4'b1010) ? 16'b0000010000000000 :
                          (address == 4'b1011) ? 16'b0000100000000000 :
                          (address == 4'b1100) ? 16'b0001000000000000 :
                          (address == 4'b1101) ? 16'b0010000000000000 :
                          (address == 4'b1110) ? 16'b0100000000000000 :
                          (address == 4'b1111) ? 16'b1000000000000000 : 16'b0000000000000000;

endmodule

module DFF(
    input wire D,
    input wire clk,
    output reg Q
    );

    always @(posedge clk)
        Q <= D;

endmodule

module MemoryUnit(
    input wire [3:0] address,
    input wire [3:0] data_in,
    input wire write_enable,
    output wire [3:0] data_out
    );

    wire [15:0] select_line;
    wire [3:0] memory [0:15];    // 16 4-bit registers   // 16 memory locations each with 4 bits
    Decoder myDecoder(address, select_line);    // to determine the memory location

    assign data_out =   (select_line[0] == 1'b1) ? memory[0]:
                        (select_line[1] == 1'b1) ? memory[1] :
                        (select_line[2] == 1'b1) ? memory[2] :
                        (select_line[3] == 1'b1) ? memory[3] :
                        (select_line[4] == 1'b1) ? memory[4] :
                        (select_line[5] == 1'b1) ? memory[5]:
                        (select_line[6] == 1'b1) ? memory[6] :
                        (select_line[7] == 1'b1) ? memory[7] :
                        (select_line[8] == 1'b1) ? memory[8] :
                        (select_line[9] == 1'b1) ? memory[9] :
                        (select_line[10] == 1'b1) ? memory[10] :
                        (select_line[11] == 1'b1) ? memory[11] :
                        (select_line[12] == 1'b1) ? memory[12] :
                        (select_line[13] == 1'b1) ? memory[13] :
                        (select_line[14] == 1'b1) ? memory[14] : memory[15];

    // Memory Location 0
    DFF DFF0_0(.D(data_in[0]), .clk(write_enable & select_line[0]), .Q(memory[0][0]));
    DFF DFF0_1(.D(data_in[1]), .clk(write_enable & select_line[0]), .Q(memory[0][1]));
    DFF DFF0_2(.D(data_in[2]), .clk(write_enable & select_line[0]), .Q(memory[0][2]));
    DFF DFF0_3(.D(data_in[3]), .clk(write_enable & select_line[0]), .Q(memory[0][3]));

    // Memory Location 1
    DFF DFF1_0(.D(data_in[0]), .clk(write_enable & select_line[1]), .Q(memory[1][0]));
    DFF DFF1_1(.D(data_in[1]), .clk(write_enable & select_line[1]), .Q(memory[1][1]));
    DFF DFF1_2(.D(data_in[2]), .clk(write_enable & select_line[1]), .Q(memory[1][2]));
    DFF DFF1_3(.D(data_in[3]), .clk(write_enable & select_line[1]), .Q(memory[1][3]));

    // Memory Location 2
    DFF DFF2_0(.D(data_in[0]), .clk(write_enable & select_line[2]), .Q(memory[2][0]));
    DFF DFF2_1(.D(data_in[1]), .clk(write_enable & select_line[2]), .Q(memory[2][1]));
    DFF DFF2_2(.D(data_in[2]), .clk(write_enable & select_line[2]), .Q(memory[2][2]));
    DFF DFF2_3(.D(data_in[3]), .clk(write_enable & select_line[2]), .Q(memory[2][3]));

    // Memory Location 3
    DFF DFF3_0(.D(data_in[0]), .clk(write_enable & select_line[3]), .Q(memory[3][0]));
    DFF DFF3_1(.D(data_in[1]), .clk(write_enable & select_line[3]), .Q(memory[3][1]));
    DFF DFF3_2(.D(data_in[2]), .clk(write_enable & select_line[3]), .Q(memory[3][2]));
    DFF DFF3_3(.D(data_in[3]), .clk(write_enable & select_line[3]), .Q(memory[3][3]));

    // Memory Location 4
    DFF DFF4_0(.D(data_in[0]), .clk(write_enable & select_line[4]), .Q(memory[4][0]));
    DFF DFF4_1(.D(data_in[1]), .clk(write_enable & select_line[4]), .Q(memory[4][1]));
    DFF DFF4_2(.D(data_in[2]), .clk(write_enable & select_line[4]), .Q(memory[4][2]));
    DFF DFF4_3(.D(data_in[3]), .clk(write_enable & select_line[4]), .Q(memory[4][3]));

    // Memory Location 5
    DFF DFF5_0(.D(data_in[0]), .clk(write_enable & select_line[5]), .Q(memory[5][0]));
    DFF DFF5_1(.D(data_in[1]), .clk(write_enable & select_line[5]), .Q(memory[5][1]));
    DFF DFF5_2(.D(data_in[2]), .clk(write_enable & select_line[5]), .Q(memory[5][2]));
    DFF DFF5_3(.D(data_in[3]), .clk(write_enable & select_line[5]), .Q(memory[5][3]));

    // Memory Location 6
    DFF DFF6_0(.D(data_in[0]), .clk(write_enable & select_line[6]), .Q(memory[6][0]));
    DFF DFF6_1(.D(data_in[1]), .clk(write_enable & select_line[6]), .Q(memory[6][1]));
    DFF DFF6_2(.D(data_in[2]), .clk(write_enable & select_line[6]), .Q(memory[6][2]));
    DFF DFF6_3(.D(data_in[3]), .clk(write_enable & select_line[6]), .Q(memory[6][3]));

    // Memory Location 7
    DFF DFF7_0(.D(data_in[0]), .clk(write_enable & select_line[7]), .Q(memory[7][0]));
    DFF DFF7_1(.D(data_in[1]), .clk(write_enable & select_line[7]), .Q(memory[7][1]));
    DFF DFF7_2(.D(data_in[2]), .clk(write_enable & select_line[7]), .Q(memory[7][2]));
    DFF DFF7_3(.D(data_in[3]), .clk(write_enable & select_line[7]), .Q(memory[7][3]));

    // Memory Location 8
    DFF DFF8_0(.D(data_in[0]), .clk(write_enable & select_line[8]), .Q(memory[8][0]));
    DFF DFF8_1(.D(data_in[1]), .clk(write_enable & select_line[8]), .Q(memory[8][1]));
    DFF DFF8_2(.D(data_in[2]), .clk(write_enable & select_line[8]), .Q(memory[8][2]));
    DFF DFF8_3(.D(data_in[3]), .clk(write_enable & select_line[8]), .Q(memory[8][3]));

    // Memory Location 9
    DFF DFF9_0(.D(data_in[0]), .clk(write_enable & select_line[9]), .Q(memory[9][0]));
    DFF DFF9_1(.D(data_in[1]), .clk(write_enable & select_line[9]), .Q(memory[9][1]));
    DFF DFF9_2(.D(data_in[2]), .clk(write_enable & select_line[9]), .Q(memory[9][2]));
    DFF DFF9_3(.D(data_in[3]), .clk(write_enable & select_line[9]), .Q(memory[9][3]));

    // Memory Location 10
    DFF DFF10_0(.D(data_in[0]), .clk(write_enable & select_line[10]), .Q(memory[10][0]));
    DFF DFF10_1(.D(data_in[1]), .clk(write_enable & select_line[10]), .Q(memory[10][1]));
    DFF DFF10_2(.D(data_in[2]), .clk(write_enable & select_line[10]), .Q(memory[10][2]));
    DFF DFF10_3(.D(data_in[3]), .clk(write_enable & select_line[10]), .Q(memory[10][3]));

    // Memory Location 11
    DFF DFF11_0(.D(data_in[0]), .clk(write_enable & select_line[11]), .Q(memory[11][0]));
    DFF DFF11_1(.D(data_in[1]), .clk(write_enable & select_line[11]), .Q(memory[11][1]));
    DFF DFF11_2(.D(data_in[2]), .clk(write_enable & select_line[11]), .Q(memory[11][2]));
    DFF DFF11_3(.D(data_in[3]), .clk(write_enable & select_line[11]), .Q(memory[11][3]));

    // Memory Location 12
    DFF DFF12_0(.D(data_in[0]), .clk(write_enable & select_line[12]), .Q(memory[12][0]));
    DFF DFF12_1(.D(data_in[1]), .clk(write_enable & select_line[12]), .Q(memory[12][1]));
    DFF DFF12_2(.D(data_in[2]), .clk(write_enable & select_line[12]), .Q(memory[12][2]));
    DFF DFF12_3(.D(data_in[3]), .clk(write_enable & select_line[12]), .Q(memory[12][3]));

    // Memory Location 13
    DFF DFF13_0(.D(data_in[0]), .clk(write_enable & select_line[13]), .Q(memory[13][0]));
    DFF DFF13_1(.D(data_in[1]), .clk(write_enable & select_line[13]), .Q(memory[13][1]));
    DFF DFF13_2(.D(data_in[2]), .clk(write_enable & select_line[13]), .Q(memory[13][2]));
    DFF DFF13_3(.D(data_in[3]), .clk(write_enable & select_line[13]), .Q(memory[13][3]));

    // Memory Location 14
    DFF DFF14_0(.D(data_in[0]), .clk(write_enable & select_line[14]), .Q(memory[14][0]));
    DFF DFF14_1(.D(data_in[1]), .clk(write_enable & select_line[14]), .Q(memory[14][1]));
    DFF DFF14_2(.D(data_in[2]), .clk(write_enable & select_line[14]), .Q(memory[14][2]));
    DFF DFF14_3(.D(data_in[3]), .clk(write_enable & select_line[14]), .Q(memory[14][3]));

    // Memory Location 15
    DFF DFF15_0(.D(data_in[0]), .clk(write_enable & select_line[15]), .Q(memory[15][0]));
    DFF DFF15_1(.D(data_in[1]), .clk(write_enable & select_line[15]), .Q(memory[15][1]));
    DFF DFF15_2(.D(data_in[2]), .clk(write_enable & select_line[15]), .Q(memory[15][2]));
    DFF DFF15_3(.D(data_in[3]), .clk(write_enable & select_line[15]), .Q(memory[15][3]));

endmodule