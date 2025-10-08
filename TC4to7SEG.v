// FileName: TC4to7SEG.v
// 4-Bit Two's Complement to 7-Segment Display
module TC4to7SEG(
	input [3:0] N,					       // 4 bit two's complement number
	output [6:0] Sign,			     // 7-segment for Sign
	output [6:0] Magnitude	 // 7-segment for Magnitude
	);
	
	// Declare and load look-up table 
	reg [6:0] TCmag[0:15];	   // TC4 to 7-segment magnitude Look-up Table

// Use localparams to define 7SEG display patterns for the presence or absence of a minus sign
	
 // Assign the outputs

endmodule // TC4to7SEG
