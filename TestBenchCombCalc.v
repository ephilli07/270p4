`timescale 1ns/1ns

module TestBenchCombCalc();
    // Add inputs
    parameter W = 16;
    reg  [2:0] OP;
    reg  signed [W-1:0] A, B;
    wire signed [W-1:0] R;
    wire ovf;


// Instantiate CombCalc instance for testing
CombCalc #(.W(W)) DUT (
    .OP(OP),
    .A(A),
    .B(B),
    .R(R),
    .ovf(ovf)
);



initial begin
// Add testing logic here

    // OP = 000  (A + B)
    OP = 3'b000; A = 10;  B = 5;   #10;
    OP = 3'b000; A = -15; B = 30;  #10;

    // OP = 001  (A - B)
    OP = 3'b001; A = 20;  B = 5;   #10;
    OP = 3'b001; A = -10; B = -25; #10;

    // OP = 010 / 011  (abs(B)
    OP = 3'b010; A = 0;   B = -100; #10;
    OP = 3'b011; A = 0;   B = 77;   #10;

    // OP = 100  (B + A)
    OP = 3'b100; A = 12;  B = 18;   #10;
    OP = 3'b100; A = -40; B = 100;  #10;

    // OP = 101  (B - A)
    OP = 3'b101; A = 10;  B = 5;    #10;
    OP = 3'b101; A = -50; B = 20;   #10;

    // OP = 110 / 111  (abs(A))
    OP = 3'b110; A = -45; B = 0;    #10;
    OP = 3'b111; A = 30;  B = 0;    #10;

    // Overflow edge cases
    OP = 3'b000; A = 32760;  B = 100;   #10;
    OP = 3'b001; A = -32760; B = 100;   #10;
end


endmodule