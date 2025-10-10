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

// Basic add 
// Positive overflow 
// Negative overflow
// Break even 

// Basic add 
// Positive overflow 
// Negative overflow
// Break even 

// SUBTRACT TESTS

// Basic subtract 
// Positive overflow 
// Negative overflow
// Break even 

// Basic subtract 
// Positive overflow 
// Negative overflow
// Break even 

// ABSOLUTE VALUE TESTS

// Basic  
// Positive  
// Negative 
// Zero
// Overflow

// Basic  
// Positive  
// Negative 
// Zero
// Overflow


end

endmodule // TestBench4