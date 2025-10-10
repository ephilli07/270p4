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
CombCalc #(.W(4)) C(
    .OP(KEY),
    .A(SW[7:4]),
    .B(SW[3:0]),
    .R(R),
    .ovf(ovf)
);

	
// Use localparams to define 7SEG display patterns for 'E' and 'all segments OFF'
localparam [6:0] E = 7'b0000110; 
localparam [6:0] allSegOff = 7'b1111111; 
	
// Instantiate the number displays 
// Need one TC4to7SEG per display

wire [6:0] signA;
wire [6:0] signB;
wire [6:0] signR;
wire [6:0] magnitudeA;
wire [6:0] magnitudeB;
wire [6:0] magnitudeR; 

TC4to7SEG Ainst(
	.N(SW[7:4]), 
	.Sign(signA), 
	.Magnitude(magnitudeA)
); 

TC4to7SEG Binst(
	.N(SW[3:0]), 
	.Sign(signB), 
	.Magnitude(magnitudeB)
); 

TC4to7SEG Rinst(
	.N(R), 
	.Sign(signR), 
	.Magnitude(magnitudeR)
); 

// HEX7 sign a
assign HEX7 = signA;
// HEX6 magnitude a
assign HEX6 = magnitudeA;
// HEX5 sing b 
assign HEX5 = signB;
// HEX4s magnitude B
assign HEX4 = magnitudeB;
// HEX3 sign R 
assign HEX3 = signR;
// HEX2 magnitude R
assign HEX2 = magnitudeR;


// Indicate overflow/no overflow on HEX0
assign HEX0 = ovf ? E : allSegOff;



endmodule // Project4