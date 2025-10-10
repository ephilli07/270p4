// File Name: TestBench4.v
`timescale 1ns/1ns
module TestBench4();
	reg [2:0] KEY;           // OP
	reg [7:0] SW;            // A[7:4] and B[3:0]
	wire [6:0] HEX7, HEX6;   // A
	wire [6:0] HEX5, HEX4;   // B
	wire [6:0] HEX3, HEX2;   // R
	wire [6:0] HEX0;         // OVF: Display E (Error) on Overflow

// Instantiate the calculator and number converters
Project4 calculator(
	.KEY(KEY),
	.SW(SW), 
	.HEX7(HEX7), 
	.HEX6(HEX6), 
	.HEX5(HEX5), 
	.HEX4(HEX4), 
	.HEX3(HEX3), 
	.HEX2(HEX2), 
	.HEX0(HEX0)
);

initial begin
// ADD TESTS

// A + B
// Basic add (4 + 3 = 7)
KEY = 3'b000;
SW = 8'b01000011;
#20; 
// Positive overflow (7 + 1)
KEY = 3'b000; 
SW = 8'b01110001; 
#20; 
// Negative overflow (-7 + -1)
KEY = 3'b000;
SW = 8'b10011111; 
#20; 
// Break even (-8 + 8 = 0)
KEY = 3'b000;
SW = 8'b10001000;
#20; 

// B + A
// Basic add 
KEY = 3'b100;
SW = 8'b01000011;
#20;
// Positive overflow 
KEY = 3'b100; 
SW = 8'b01110001; 
// Negative overflow (-7 + -1)
KEY = 3'b100;
SW = 8'b10011111; 
#20; 
// Break even 
KEY = 3'b100;
SW = 8'b10001000;
#20; 

// SUBTRACT TESTS
// A - B 001 
// Basic subtract (5 - 2 = 3)
KEY = 3'b001;
SW = 8'b01010010;
#20; 
// Positive overflow (5 - - 4 = 9)
KEY = 3'b001;
SW = 8'b01011100;
#20; 
// Negative overflow (-7 - 7 = -14)
KEY = 3'b001;
SW = 8'b10010111;
#20; 
// Break even (-7 - -7 = 0)
KEY = 3'b001;
SW = 8'b10011001;
#20; 

// B - A 101
// Basic subtract (5 - 2 = 3)
KEY = 3'b101;
SW = 8'b01010010;
#20; 
// Positive overflow (5 - - 4 = 9)
KEY = 3'b101;
SW = 8'b01011100;
#20; 
// Negative overflow (-7 - 7 = -14)
KEY = 3'b101;
SW = 8'b10010111;
#20; 
// Break even (-7 - -7 = 0)
KEY = 3'b101;
SW = 8'b10011001;
#20; 

// ABSOLUTE VALUE TESTS

// absB with 010
// Basic  abs(-3)
KEY = 3'b010;
SW = 8'b00001101;
#20;
// Positive  abs(7)
KEY = 3'b010;
SW = 8'b00000111;
#20;
// Negative abs(-4)
KEY = 3'b010;
SW = 8'b00001100;
#20;

// Zero abs(0)
KEY = 3'b010;
SW = 8'b00000000;
#20;

// Overflow becase 8 doesn't exist
KEY = 3'b010;
SW = 8'b00001000;
#20;

// absB with 011
// Basic  abs(-3)
KEY = 3'b011;
SW = 8'b00001101;
#20;

// Positive  abs(7)
KEY = 3'b011;
SW = 8'b00000111;
#20;
// Negative abs(-4)
KEY = 3'b011
SW = 8'b00001100
#20;

// Zero abs(0)
KEY = 3'b011
SW = 8'b00000000
#20;

// Overflow becase 8 doesn't exist
KEY = 3'b011;
SW = 8'b00001000;
#20;


// absA with 110 

// Basic  abs(-3)
KEY = 3'b110;
SW = 8'b00000101;
#20;

// Positive
KEY = 3'b110;
SW = 8'b00000101;
#20;

// Negative
KEY = 3'b110;
SW = 8'b00000101;
#20;

// Zero 
KEY = 3'b110;
SW = 8'b00000101;
#20;

// Overflow
KEY = 3'b110;
SW = 8'b00000101;
#20;

// absA with 111

// Basic  abs(-3)
KEY = 3'b111;
SW = 8'b11010000;
#20;

// Positive
KEY = 3'b111;
SW = 8'b01110000;
#20;

// Negative
KEY = 3'b111;
SW = 8'b11000000;
#20;

// Zero 
KEY = 3'b111;
SW = 8'b00000000;
#20;

// Overflow
KEY = 3'b111;
SW = 8'b10000000;
#20;


end

endmodule // TestBench4