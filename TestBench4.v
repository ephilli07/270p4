// File Name: TestBench4.v
`timescale 1ns/1ns
module TestBench4();
	reg [2:0] KEY;           // OP
	reg [7:0] SW;            // A[7:4] and B[3:0]
	wire [6:0] HEX7, HEX6;   // A
	wire [6:0] HEX5, HEX4;   // B
	wire [6:0] HEX3, HEX2;   // R
	wire [6:0] HEX0;         // OVF: Display E (Error) on Overflow
	
	wire signed [3:0] R;
	wire ovf;

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
	.HEX0(HEX0),
);



// Specify your test procedures
initial begin
	// Test 1: A(0) + B(1) = R(1)
	KEY <= 3'b000; #10;		
	SW <= 8'b00000000; #10;
    SW <= 8'b00000001; #10;
	// show A, B, Overflow, and R on HEX displays.

	// Test 2: No overflow add (negative + negative = positive)

	// Test 3: Overflow add (positive + positive = negative)

	// Test 4: No overflow subtract (negative minus positive = positive)

	// Test 5: Overflow subtract (positive minus negative = negative)

	// Test 6: Overflow of bit postions (7 + 1)

	// Test 7: Regular add 

	// Test 8: Regular subtract

	// Test 9: Absolute value of postive, remains positive

	// Test 10: Absolute value of negative, becomes positive

end

endmodule // TestBench4