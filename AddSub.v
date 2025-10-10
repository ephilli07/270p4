// File Name: AddSub.v
// Parameterized W-bit Adder/Subtractor
module AddSub              // Default width
	(
		input  [3:0] A, B,       // W-bit TC inputs
		input c0,                               // Carry-in
		output  [3:0] R,         // W-bit TC output
		output ovf                             // Overflow signal
	);
	
	wire [4:0] c;                            // Carry signals
	wire [3:0] mask; 
	// For subtraction just add the opposite
	wire[3:0] Bsub;

	// Initialize c[0]
	assign c[0] = c0; 

	// Invert if subtraction for ALL bits using ^
	// Create mask 
	// Apply mask for subtraction
	assign mask = c0 ? 4'b1111 : 4'b0000;
	assign Bsub = B ^ mask;

	FullAdder firstAdder(
		.a(A[0]), 
		.b(Bsub[0]), 
		.cin(c[0]), 
		.s(R[0]), 
		.cout(c[1])
	);

	FullAdder secondAdder(
		.a(A[1]), 
		.b(Bsub[1]), 
		.cin(c[1]), 
		.s(R[1]), 
		.cout(c[2])
	);

	FullAdder thirdAdder(
		.a(A[2]), 
		.b(Bsub[2]), 
		.cin(c[2]), 
		.s(R[2]), 
		.cout(c[3])
	);

	FullAdder fourthAdder(
		.a(A[3]), 
		.b(Bsub[3]), 
		.cin(c[3]), 
		.s(R[3]), 
		.cout(c[4])
	);

	// Computes R = A + B + 0 when c0 = 0
	// Computes R = A + ~B + 1 when c0 = 1 
	assign ovf = (A[3] & Bsub[3] & ~R[3]) | (~A[3] & ~Bsub[3] & R[3]);

endmodule // AddSub