`include "MemoryUnit.v"

module MemoryUnit_tb;
    reg [3:0] address;
    reg [3:0] data_in;
    reg write_enable;
    wire [3:0] data_out;

    MemoryUnit u1(
        .address(address),
        .data_in(data_in), 
        .write_enable(write_enable), 
        .data_out(data_out));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, MemoryUnit_tb);
        // Test vector 1
        address <= 4'b0000;
        data_in <= 4'b1010;
        write_enable <= 1'b1;
        #10;

        // Test vector 2
        address <= 4'b0001;
        data_in <= 4'b0101;
        write_enable <= 1'b1;
        #10;

        // Test vector 3
        address <= 4'b0000;
        write_enable <= 1'b0;
        #10;
        $display("Data out: %b", data_out);

        // Test vector 4
        address <= 4'b0001;
        write_enable <= 1'b0;
        #10;
        $display("Data out: %b", data_out);

        $finish;
    end
endmodule