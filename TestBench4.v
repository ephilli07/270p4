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
// -------------------------------------------
// TEST 1 A + B = POSITIVE, NO OVERFLOW (1 + 3 = 4)
// Expected: HEX7/HEX6 1 HEX5/HEX4 3 HEX3/HEX2 4 HEX0 off
// -------------------------------------------
// TEST 2 A + B = POSITIVE, OVERFLOW (7 + 1 = 8) 
// Expected: HEX7/HEX6 7 HEX5/HEX4 1 HEX3/HEX2 8 HEX0 on
// -------------------------------------------
// TEST 3 -A + -B = NEGATIVE, OVERFLOW (-5 + -12 = -17) 
// Expected: HEX7/HEX6 7 HEX5/HEX4 1 HEX3/HEX2 8 HEX0 on
// -------------------------------------------
// TEST 4 A + -B = POSITIVE, OVERFLOW (-5 + -12 = -17) 
// Expected: HEX7/HEX6 7 HEX5/HEX4 1 HEX3/HEX2 8 HEX0 on
// -------------------------------------------
// TEST 5 -A + -B = 0, NO OVERFLOW (-7 + 7 = 0) 
// Expected: HEX7/HEX6 -7 HEX5/HEX4 7 HEX3/HEX2 0 HEX0 off



// ====================================================


initial begin

// TEST 1 
KEY = 3'b000; 
SW = 8'b00010011; 
#10; 

// TEST 2


end

endmodule // TestBench4