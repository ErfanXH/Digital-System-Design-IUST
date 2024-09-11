`include "Stack.v"

module tb_Stack;

  parameter data_count = 3;
  parameter data_width = 16;
  parameter clock_period = 10; 

  reg clock;
  reg pop, push;
  reg [data_width - 1:0] data_in;

  wire empty, full;
  wire [data_width - 1:0] data_out;

  Stack #(
    .data_count(data_count),
    .data_width(data_width)
  ) uut (
    .clock(clock),
    .pop(pop),
    .push(push),
    .data_in(data_in),
    .empty(empty),
    .full(full),
    .data_out(data_out)
  );

  initial begin
    clock = 0;
    forever #((clock_period)/2) clock = ~clock;
  end

  initial begin
    pop = 1'b0;
    push = 1'b0;
    data_in = 0;

    // Initial values and wait for a few clock cycles
    #5;

    // Test 1: Push data into the stack
    push = 1'b1;
    data_in = 16'hFFFF;
    #10;
    push = 1'b1;
    data_in = 16'hAAAA;
    #10;
    push = 1'b1;
    data_in = 16'h5555;
    #10
    push = 1'b1;
    data_in = 16'h0F0F;
    #10

    // Test 2: Pop data from the stack
    push = 1'b0;
    pop = 1'b1;
    #10;
    pop = 1'b1;
    #10
    pop = 1'b1;


    #20 $finish; 
  end

  always @(posedge clock) begin
    $display("Time=%0t | Full=%b | Empty=%b | Data_out=%h", $time, full, empty, data_out);
  end

endmodule
