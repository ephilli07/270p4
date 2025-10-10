// File Name: CombCalc.v
module CombCalc #(parameter W = 16)(
	input [2:0] OP,
	input signed [3:0] A, B,
	output signed [3:0] R,
	output ovf
);

	wire signed [3:0] X, Y;
	wire c0;

// Prefix Circuit
// Should choose operation based on opcode and pass into "R"

// PICKING THE CORRECT OPERATION

// Set of operations
wire addAB, addBA, subAB, subBA, absA, absB;

// Operation code is defined by OP [2:0] which is actually OP[2] OP[1] OP[0] 

// 000 --> A + B
assign addAB = (~OP[2]) & (~OP[1]) & (~OP[0]);
// 001 --> A - B
assign subAB = (~OP[2]) & (~OP[1]) & (OP[0]);

// 01_ --> abs(B)
assign absB = (~OP[2]) & (OP[1]); 

// 100 --> B + A
assign addBA = (OP[2]) & (~OP[1]) & (~OP[0]); 

// 101 --> B - A
assign subBA = (OP[2]) & (~OP[1]) & (OP[0]);

// 11_ --> abs(A)
assign absA = (OP[2]) & (OP[1]); 






// ADDING AND SUBTRACTING

// Depending on the opcode, determine operand (use ternary here)
// When c0 = 1, subtract (subAB or subBA) 

assign c0 = (subAB | subBA); 

// Determine which inputs depending on order of operations
wire signed [W-1:0] inputA, inputB; 

assign inputA = (addAB | subAB | absB) ?  A : B;

assign inputB = B ? (addBA | subBA) ? B : A:

// OP[2] OP[1] OP[0]
// A + B  A B 0 
// A - B A B 1
// B + A B A 0
// B - A B A 1

// Instantiate a 4-bit Adder/Subtractor

// Need internal wires
wire signed [W-1:0] operationOutput;
wire ovfOutput; 

// c0 determines whether adding, subtracting, abs
// Instantiate and do adder
AddSub addSubMain(
	.A(inputA),
	.B(inputB), 
	.c0(c0), 
	.R(operationOutput), 
	.ovf(ovfOutput)
);


// ABSOLUTE VALUE 

// In two's complement, negative if MSB is 1
// Convert between then, flip (XOR) and add 1 (think use adder here)


wire signed [W-1:0] absValA;
wire overflowAbsA; 
assing absValA = 

wire signed [W-1:0]absValB; 


wire signed [W-1:0] oppositeA, oppositeB; 

// Flip
assign oppositeA = A ^ {4{A[3]}};
assign oppositeB = B ^ {4{B[3]}};

// Add 1
wire signed [3:0] absA, absB; 


assing R = absValA 


endmodule //  CombCalc