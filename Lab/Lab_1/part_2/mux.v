//SW[2:0] data inputs
//SW[9] select signal

//LEDR[0] output display

// This one is a 4 to 1 mux

module mux(LEDR, SW);
    input [9:0] SW;
    output [9:0] LEDR;

    // SW[8] : S0
    // SW[9] : S1

    wire w0, w1;

    mux2to1 u1(
        .u(SW[0]),
        .v(SW[1]),
        .s0(SW[8]),
        .m(w0)
        );

    mux2to1 u2(
        .x(SW[3],
        .y(SW[4]),
        .s0(SW[8]),
        .m(w1)
        );

    mux2to1 u0(
        .m1(w0),
        .m2(w1]),
        .s1(SW[9]),
        .m(LEDR[0])
        );    
endmodule

module mux2to1(x, y, s, m);
    input x; //selected when s is 0
    input y; //selected when s is 1
    input s; //select signal
    output m; //output
  
    assign m = s & y | ~s & x;
    // OR
    // assign m = s ? y : x;

endmodule