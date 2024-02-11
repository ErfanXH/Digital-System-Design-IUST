module MUX2X1 (
    input wire D0,
    input wire D1,
    input wire S,
    output wire Y
);

    assign Y = ( D0 & ~S ) | ( D1 & S );

endmodule