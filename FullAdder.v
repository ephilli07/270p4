// File Name: FullAdder.v
module FullAdder(
		input a, b, cin,
		output s, cout
	);

// Behavioral specification of FA
assign s = (a ^ b ^ cin); 
assign cout = (a & b) | (cin & (a ^ b)); 

endmodule // FullAdder
