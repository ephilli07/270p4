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
SW = 7'b01000011;
#20; 
// Positive overflow (7 + 1)
KEY = 3'b000; 
SW = 7'b01110001; 
#20; 
// Negative overflow (-7 + -1)
KEY = 3'b000;
SW = 7'b10011111; 
#20; 
// Break even (-8 + 8 = 0)
KEY = 3'b000;
SW = 7'b10001000;
#20; 

// B + A
// Basic add 
KEY = 3'b100;
SW = 7'b01000011;
#20;
// Positive overflow 
KEY = 3'b100; 
SW = 7'b01110001; 
// Negative overflow (-7 + -1)
KEY = 3'b100;
SW = 7'b10011111; 
#20; 
// Break even 
KEY = 3'b100;
SW = 7'b10001000;
#20; 

// SUBTRACT TESTS
// A - B 001 
// Basic subtract (5 - 2 = 3)
KEY = 3'001;
SW = 7'b001010010;
#20; 
// Positive overflow 
KEY = 3'001;
SW = 7'b10001000;
#20; 
// Negative overflow
KEY = 3'001;
SW = 7'b10001000;
#20; 
// Break even 
KEY = 3'001;
SW = 7'b10001000;
#20; 

// B - A 101
// Basic subtract 
KEY = 3'101;
SW = 7'b10001000;
#20; 

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