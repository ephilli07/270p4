// File Name: FullAdder.v
module FullAdder(
		input a, b, cin,
		output s, cout
	);

// Behavioral specification of FA
s = a ^ b ^ cin; 
cout = (a & b) | (cin & (a ^ b)); 

endmodule // FullAdder
