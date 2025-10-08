// File Name: CombCalc.v
module  CombCalc(
	input [2:0] OP,
	input signed [3:0] A, B,
	output signed [3:0] R,
	output ovf
);

	wire signed [3:0] X, Y;
	wire c0;

// Prefix Circuit
// Should choose operation based on opcode and pass into "R"

// Need internal wires
wire [W-1:0] operationOutput;
wire ovfOutput; 

// Set of operations
wire addAB, addBA, subAB, subBA, absA, absB;

// Operation code is defined by OP [2:0] which is actually OP[2] OP[1] OP[0] 

// 000 --> A + B
assign addAB = (~OP[2]) & (~OP[1]) & (~OP[0]);
// 001 --> A - B
assign subAB = (OP[2] & OP[1] & OP[0]);

// 01_ --> abs(B)
assign absB = (OP[2] & ~OP[1]); 

// 100 --> B + A
assign addBA = (OP[2] & ~OP[1] & ~OP[0]); 

// 101 --> B - A
assign subBA = (OP[2] & ~OP[1] & OP[0]);

// 11_ --> abs(A)
assign absA = (OP[2] & OP[1]); 

// Depending on the opcode, determine operand (use ternary here)



// Depending on operand, compute necessary
assign R = ; 



// Instantiate a 4-bit Adder/Subtractor

// c0 determines whether adding, subtracting, abs
AddSub addSubMain(
	.A(A),
	.B(B), 
	.c0(c0), 
	.R(operationOutput), 
	.ovf(ovfOutput)

);

endmodule //  CombCalc