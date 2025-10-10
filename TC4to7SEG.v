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

	localparam [6:0] negative = 7'b0111111;
	localparam [6:0] noNegative = 7'b1111111;

	localparam zero = 7'b1000000;;
	localparam one = 7'b1111001;
	localparam two = 7'b0100100;
	localparam three = 7'b0110000;
	localparam four = 7'b0011001;
	localparam five = 7'b0010010;
	localparam six = 7'b0000010;
	localparam seven = 7'b1111000;
	localparam eight = 7'b0000000;


	initial begin
		// 0 
		TCmag[0] = {noNegative, zero}; 
		// 1
		TCmag[1] = {noNegative, one};
		// 2
		TCmag[2] = {noNegative, two};
		// 3
		TCmag[3] = {noNegative, three};
		// 4
		TCmag[4] = {noNegative, four};
		// 5
		TCmag[5] = {noNegative, five};
		// 6
		TCmag[6] = {noNegative, six};
		// 7
		TCmag[7] = {noNegative, seven};
		// -8 
		TCmag[8] = {negative, eight};
		// -7
		TCmag[9] = {negative, seven};
		// -6
		TCmag[10] = {negative, six};
		// -5
		TCmag[11] = {negative, five};
		// -4
		TCmag[12] = {negative, four};
		// -3
		TCmag[13] = {negative, three};
		// -2
		TCmag[14] = {negative, two};
		// -1
		TCmag[15] = {negative, one};
		
	end

    assign Sign = TC_to_7SEG[N][13:7];
    assign Magnitude = TC_to_7SEG[N][6:0];




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
