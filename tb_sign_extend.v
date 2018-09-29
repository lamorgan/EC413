`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:36:11 12/05/2017
// Design Name:   sign_extend
// Module Name:   /ad/eng/users/l/a/lamorgan/Desktop/ec413Project1/tb_sign_extend.v
// Project Name:  ec413Project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_sign_extend;

	// Inputs
	reg [15:0] instruction;

	// Outputs
	wire test;
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	sign_extend uut (
		.instruction(instruction), 
		.test(test), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		#10 instruction = 16'b0001000000000000;
		#10 instruction = 16'b1001000000000000;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

