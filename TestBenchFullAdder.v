`timescale 1ns/1ns

module TestBenchFullAdder( 
    
);


// Need place to have sum and carry out
wire sum, carryOut; 

FullAdder testFullAdder(
    .a(), 
    .b(),
    .cin(), 
    .s(sum), 
    .cout(carryOut)
); 

initial begin 
    
end

endmodule