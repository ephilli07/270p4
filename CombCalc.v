// File Name: CombCalc.v
module CombCalc #(parameter W = 16)(
	input [2:0] OP,
	input signed [W-1:0] A, B,
	output signed [W-1:0] R,
	output ovf
);


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
wire absCarry = (absA & A[W-1]) | (absB & B[W-1]);
wire subCarry = subAB | subBA;
assign c0 = absCarry | subCarry;

// Determine which inputs depending on order of operations
wire signed [W-1:0] inputA, inputB; 

assign inputA = (absA) ? (~A) : (absB) ? (~B) : (addAB | subAB) ? A : B;

assign inputB = (absA | absB) ? 0 : (addAB | subAB) ? B : A;

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
AddSub #(.W(W))addSubMain(
	.A(inputA),
	.B(inputB), 
	.c0(c0), 
	.R(operationOutput), 
	.ovf(ovfOutput)
);

// Pick A if absA and input pos or vice ver, operation output for other cases
assign R = (absA & !A[W-1]) ? A : (absB & !B[W-1]) ? B : operationOutput;

assign ovf = ovfOutput;


endmodule //  CombCalc