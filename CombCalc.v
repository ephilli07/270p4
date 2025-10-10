// File Name: CombCalc.v
module CombCalc (
	input [2:0] OP,
	input  [3:0] A, B,
	output  [3:0] R,
	output ovf
);


wire c0; 
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


// If a or b needed
wire absANeeded = absA & A[3];
wire absBNeeded = absB & B[3];

assign c0 = subAB | subBA | absANeeded | absBNeeded;

// Both input values
wire [3:0] inputA, inputB;

assign inputA = absANeeded ? ~A : absBNeeded ? ~B : (addAB | subAB) ? A : B;
assign inputB = (absANeeded | absBNeeded) ? 4'b0001 : (addAB | subAB) ? B : A;

wire [3:0] operationOutput;
wire ovfOutput;

// Instantiate
AddSub addSubMain(
	.A(inputA),
	.B(inputB),
	.c0(c0),
	.R(operationOutput),
	.ovf(ovfOutput)
);


// Abslute value logic 
wire minAZero = ~A[0] & ~A[1] & ~A[2];
wire minA = A[3] & minAZero;

wire minBZero = ~B[0] & ~B[1] & ~B[2];
wire minB = B[3] & minBZero;

wire absAOvf = absA & minA;
wire absBOvf = absB & minB;

// Final outputs
assign ovf = ovfOutput | absAOvf | absBOvf;
assign R = (absA & ~A[3]) ? A : (absB & ~B[3]) ? B : operationOutput;


endmodule //  CombCalc