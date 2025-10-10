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

// ====================================================
// PROJECT 4 TEST GLOSSARY
// Welcome to my comprehensive test glossary. 
// Each test is specified below. 

// ADD TESTS

// A + B
// -------------------------------------------
// TEST 1 - BASIC POS POS (A + B = POSITIVE), NO OVERFLOW (1 + 3 = 4)
// Expected: HEX7/HEX6 1 HEX5/HEX4 3 HEX3/HEX2 4 HEX0 off
// -------------------------------------------
// TEST 2 - OVERFLOW POS POS (A + B = POSITIVE), OVERFLOW (7 + 1 = 8)
// Expected: HEX7/HEX6 7 HEX5/HEX4 1 HEX3/HEX2 8 HEX0 on
// -------------------------------------------
// TEST 3 - OVERFLOW NEG NEG (-A + -B = NEGATIVE), OVERFLOW (-8 + -2 = -10)
// Expected: HEX7/HEX6 -8 HEX5/HEX4 -2 HEX3/HEX2 -10 HEX0 on
// -------------------------------------------
// TEST 4 - OVERFLOW POS POS A + B = POSITIVE, OVERFLOW (8 + 8 = 16)
// Expected: HEX7/HEX6 8 HEX5/HEX4 8 HEX0 on
// -------------------------------------------
// TEST 5 - NO OVERFLOW NEG NEG (-A + -B = NEGATIVE), NO OVERFLOW (-3 + -2 = -5)
// Expected: HEX7/HEX6 -3 HEX5/HEX4 -2 HEX3/HEX2 -5 HEX0 off
// -------------------------------------------
// TEST 6 - BREAK EVEN NEG POS (-A + B = 0), NO OVERFLOW (-8 + 8 = 0)
// Expected: HEX7/HEX6 -8 HEX5/HEX4 8 HEX3/HEX2 0 HEX0 off

// B + A
// -------------------------------------------
// TEST 1 - BASIC POS POS (B + A = POSITIVE), NO OVERFLOW (3 + 1 = 4)
// Expected: HEX7/HEX6 3 HEX5/HEX4 1 HEX3/HEX2 4 HEX0 off
// -------------------------------------------
// TEST 2 - OVERFLOW POS POS (1 + 7 = 8)
// Expected: HEX7/HEX6 1 HEX5/HEX4 7 HEX3/HEX2 8 HEX0 on
// -------------------------------------------
// TEST 3 - OVERFLOW NEG NEG (-2 + -8 = -10)
// Expected: HEX7/HEX6 -2 HEX5/HEX4 -8 HEX3/HEX2 -10 HEX0 on
// -------------------------------------------
// TEST 4 - OVERFLOW POS POS (7 + 7 = 14)
// Expected: HEX7/HEX6 7 HEX5/HEX4 7 HEX3/HEX2 14 HEX0 on
// -------------------------------------------
// TEST 5 - POS NEG BREAK EVEN (7 + -7 = 0)
// Expected: HEX7/HEX6 7 HEX5/HEX4 -7 HEX3/HEX2 0 HEX0 off

// SUB TESTS

// A - B
// -------------------------------------------
// TEST 1 - POS - POS (7 - 7 = 0)
// Expected: HEX7/HEX6 7 HEX5/HEX4 7 HEX3/HEX2 0 HEX0 off
// -------------------------------------------
// TEST 2 - POS - POS (7 - 1 = 6)
// Expected: HEX7/HEX6 7 HEX5/HEX4 1 HEX3/HEX2 6 HEX0 off
// -------------------------------------------
// TEST 3 - POS - NEG (7 - -7 = 14), OVERFLOW
// Expected: HEX7/HEX6 7 HEX5/HEX4 -7 HEX0 on
// -------------------------------------------
// TEST 4 - NEG - POS (-7 - 7 = -14), OVERFLOW
// Expected: HEX7/HEX6 -7 HEX5/HEX4 7 HEX0 on
// -------------------------------------------
// TEST 5 - NEG - NEG (-7 - -7 = 0)
// Expected: HEX7/HEX6 -7 HEX5/HEX4 -7 HEX3/HEX2 0 HEX0 off

// B - A
// -------------------------------------------
// TEST 1 - POS - POS (7 - 7 = 0)
// Expected: HEX7/HEX6 7 HEX5/HEX4 7 HEX3/HEX2 0 HEX0 off
// -------------------------------------------
// TEST 2 - POS - POS (1 - 7 = -6)
// Expected: HEX7/HEX6 1 HEX5/HEX4 7 HEX3/HEX2 -6 HEX0 off
// -------------------------------------------
// TEST 3 - POS - NEG (7 - -7 = 14), OVERFLOW
// Expected: HEX7/HEX6 7 HEX5/HEX4 -7 HEX0 on
// -------------------------------------------
// TEST 4 - NEG - POS (-7 - 7 = -14), OVERFLOW
// Expected: HEX7/HEX6 -7 HEX5/HEX4 7 HEX0 on
// -------------------------------------------
// TEST 5 - NEG - NEG (-7 - -7 = 0)
// Expected: HEX7/HEX6 -7 HEX5/HEX4 -7 HEX3/HEX2 0 HEX0 off

// ABS TESTS

// ABS A 
// -------------------------------------------
// TEST 1 - ABS(0) = 0
// Expected: HEX7/HEX6 0 HEX3/HEX2 0 HEX0 off
// -------------------------------------------
// TEST 2 - ABS(7) = 7
// Expected: HEX7/HEX6 7 HEX3/HEX2 7 HEX0 off
// -------------------------------------------
// TEST 3 - ABS(-7) = 7
// Expected: HEX7/HEX6 -7 HEX3/HEX2 7 HEX0 off
// -------------------------------------------
// TEST 4 - ABS(-8) OVERFLOW
// Expected: HEX7/HEX6 -8 HEX0 on

// ABS B 
// -------------------------------------------
// TEST 1 - ABS(0) = 0
// Expected: HEX5/HEX4 0 HEX3/HEX2 0 HEX0 off
// -------------------------------------------
// TEST 2 - ABS(7) = 7
// Expected: HEX5/HEX4 7 HEX3/HEX2 7 HEX0 off
// -------------------------------------------
// TEST 3 - ABS(-7) = 7
// Expected: HEX5/HEX4 -7 HEX3/HEX2 7 HEX0 off
// -------------------------------------------
// TEST 4 - ABS(-8) OVERFLOW
// Expected: HEX5/HEX4 -8 HEX0 o

// ====================================================


initial begin

// TEST 1 
KEY = 3'b000; 
SW = 8'b00010011; 
#10; 

// TEST 2
KEY = 3'b000; 
SW = 8'b01110001; 
#10;

// TEST 3
KEY = 3'b000; 
SW = 8'b10001110; 
#10;

// TEST 4
KEY = 3'b000; 
SW = 8'b01110111; 
#10;

// TEST 5
KEY = 3'b000; 
SW = 8'b11011110; 
#10;

// TEST 6
KEY = 3'b000; 
SW = 8'b10001000; 
#10;




end

endmodule // TestBench4