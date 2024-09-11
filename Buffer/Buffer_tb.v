`include "Buffer.v"

module Buffer_tb;

  parameter clock_period = 10; 

  reg [7:0] data_in;
  reg clk, rst, write, read;

  wire full, empty;
  wire [7:0] data_out;

  Buffer uut (
    .data_in(data_in),
    .clk(clk),
    .rst(rst),
    .write(write),
    .read(read),
    .full(full),
    .empty(empty),
    .data_out(data_out)
  );

  initial begin
    clk = 0;
    forever #((clock_period)/2) clk = ~clk;
  end

  initial begin
    rst = 1'b1;
    write = 1'b0;
    read = 1'b0;
    data_in = 8'h00;

    // Apply reset and wait for a few clock cycles
    #5 rst = 1'b0;

    // Test 1: Write data to the buffer
    // Time = 15
    // data 1
    write = 1'b1;
    data_in = 8'h01;
    #10;
    // data 2
    write = 1'b1;
    data_in = 8'h02;
    #10
    // data 3
    write = 1'b1;
    data_in = 8'h03;
    #10;
    // read
    write = 1'b0;
    read = 1'b1;
    #5
    // write
    write = 1'b1;
    read = 1'b0;
    #5
    // data 4
    write = 1'b1;
    data_in = 8'h04;
    #10
    // data 5
    write = 1'b1;
    data_in = 8'h05;
    #10;
    // data 6
    write = 1'b1;
    data_in = 8'h06;
    #10
    // data 7
    write = 1'b1;
    data_in = 8'h07;
    #10;
    // data 8
    write = 1'b1;
    data_in = 8'h08;
    #10
    // data 9
    write = 1'b1;
    data_in = 8'h09;
    #10
    // data 10
    write = 1'b1;
    data_in = 8'h0A;
    #10
    // data 11
    write = 1'b1;
    data_in = 8'h0B;
    #10

    // End of Writing
    write = 1'b0;

    // Test 2: Read data from the buffer
    read = 1'b1;
    #70;
    //tb_read = 1'b0;


    #50 $finish;
  end

  always @(posedge clk) begin
    $display("Time=%0t | Full=%b | Empty=%b | Data_out=%d", $time, full, empty, data_out);
  end

endmodule
