// File Name: AddSub.v
// Parameterized W-bit Adder/Subtractor
module AddSub
	#(parameter W = 16)	              // Default width
	(
		input  [W-1:0] A, B,       // W-bit TC inputs
		input c0,                               // Carry-in
		output  [W-1:0] R,         // W-bit TC output
		output ovf                             // Overflow signal
	);
	
	wire [W:0] c;                            // Carry signals
	wire [W-1:0] mask; 
	// For subtraction just add the opposite
	wire[W-1:0] Bsub;

	// Initialize c[0]
	assign c[0] = c0; 

	// Invert if subtraction for ALL bits using ^
	// Create mask 
	// Apply mask for subtraction
	assign mask = {W{c0}};
	assign Bsub = B ^ mask;

	// Use generate to instantiate and "chain" W full adders 
	genvar i; 
	generate 
		for (i = 0; i < W; i = i + 1) begin : loop 
			// Instantiate FullAdder
			FullAdder adder(
				.a(A[i]), 
				.b(Bsub[i]),
				.cin(c[i]),
				.s(R[i]), 
				.cout(c[i + 1]) // The final element
			);
		end
	endgenerate

	// Computes R = A + B + 0 when c0 = 0
	// Computes R = A + ~B + 1 when c0 = 1 


// Overflow is determined 
assign ovf = ( A[W-1] &  Bsub[W-1] & ~R[W-1]) |(~A[W-1] & ~Bsub[W-1] &  R[W-1]);

endmodule // AddSub