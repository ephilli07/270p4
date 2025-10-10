// FileName: TC4to7SEG.v
// 4-Bit Two's Complement to 7-Segment Display
module TC4to7SEG(
	input [3:0] N,					       // 4 bit two's complement number
	output [6:0] Sign,			     // 7-segment for Sign
	output [6:0] Magnitude	 // 7-segment for Magnitude
	);

	// Use localparams to define 7SEG display patterns for the presence or absence of a minus sign
	// converts a 4-bit two's complement number to its corresponding signed-magnitude decimal
	// representation that can be used to drive the HEX displays
	
	// Declare and load look-up table 
	reg [6:0] TCmag[0:15];	   // TC4 to 7-segment magnitude Look-up Table each row is 16 bits

	initial begin
		// 0 
		TCmag[0] = 7'b1000000; 
		// 1
		TCmag[1] = 7'b1111001;
		// 2
		TCmag[2] = 7'b0100100; 
		// 3
		TCmag[3] = 7'b0110000; 
		// 4
		TCmag[4] = 7'b0011001;
		// 5
		TCmag[5] = 7'b0010010; 
		// 6
		TCmag[6] = 7'b0000010; 
		// 7
		TCmag[7] = 7'b1111000;


		// 8 and -8 
		TCmag[8] = 7'b0000000; 
		// -7
		TCmag[9] = 7'b1111000; 
		// -6
		TCmag[10] = 7'b0000010; 
		// -5
		TCmag[11] = 7'b0010010; 
		// -4
		TCmag[12] = 7'b0011001; 
		// -3
		TCmag[13] = 7'b0110000; 
		// -2
		TCmag[14] = 7'b0100100; 
		// -1
		TCmag[15] = 7'b1111001; 
		
	end

	// Magnitude
	assign Magnitude = TCmag[N];

	// Sign is based on MSB 
	localparam [6:0] negative = 7'b0111111;
	localparam [6:0] noNegative = 7'b1111111;
	assign Sign = N[3] ? negative : noNegative; 




// Assign the outputs
// Active low!
// The negative sign is rendered on the left display by turning off all segments except segment 6

//    0
//    _
// 5 |_| 1
// 4 |_| 2
//    3
//

endmodule // TC4to7SEG
