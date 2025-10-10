// File Name: CombCalc.v
module CombCalc #(parameter W = 16)(
	input [2:0] OP,
	input  [W-1:0] A, B,
	output  [W-1:0] R,
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

// We need absA when we got the opcdoe and the sign bit [W-1] is negative
wire absANeeded;
assign absANeeded = absA ? A[W-1] : 1'b0;

wire absBNeeded;
assign absBNeeded = absB ? B[W-1] : 1'b0;

assign c0 = subAB | subBA | absANeeded | absBNeeded;

// Determine which inputs depending on order of operations
wire signed [W-1:0] inputA, inputB; 

// First input is determined by: do we need absolute value of A/ if so return
assign inputA = absANeeded ? ~A : absBNeeded ? ~B : (addAB | subAB) ? A : B;


// Feed in a one for adding 1 part 
wire [3:0] valueOne = 4'b0001;
assign inputB = (absANeeded | absBNeeded) ? valueOne : (addAB | subAB) ? B : A;

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


wire notSignA;
wire notSignB;

assign notSignA = A[W-1] ? 1'b0 : 1'b1;
assign notSignB = B[W-1] ? 1'b0 : 1'b1;

// Pick A if absA and input pos or vice ver, operation output for other cases
assign R = (absA & notSignA) ? A :(absB & notSignB) ? B : operationOutput;

wire minAzero;
assign minAzero = ~A[0] & ~A[1] & ~A[2];
wire minA = A[3] & minAzero;

wire minBZero;
assign minBZero = ~B[0] & ~B[1] & ~B[2];
wire minB = B[3] & minBZero;

wire absAOvf = absA & minA;
wire absBOvf = absB & minB;

assign ovf = ovfOutput | absAOvf | absBOvf;


endmodule //  CombCalc