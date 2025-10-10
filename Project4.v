// File Name: Project4.v (CombCalc)
module Project4(
	input [2:0] KEY,				        // OP
	input [7:0] SW, 				         // A[7:4] and B[3:0]
	output [6:0] HEX7, HEX6,	// A
	output [6:0] HEX5, HEX4,	// B
	output [6:0] HEX3, HEX2,	// R
	output [6:0] HEX0			    // OVF: Display E (Error) on Overflow
	);
	wire signed [3:0] R;
	wire ovf;

// Instantiate the calculator
	CombCalc C(KEY, SW[7:4], SW[3:0], R, ovf);
	
// Use localparams to define 7SEG display patterns for 'E' and 'all segments OFF'
localparam [6:0] E = 7'b0000110; 
localparam [6:0] allSegOff = 7'b1111111; 
	
// Instantiate the number displays 


// Indicate overflow/no overflow on HEX0



endmodule // Project4