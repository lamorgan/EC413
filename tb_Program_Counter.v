`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:24:10 12/05/2017
// Design Name:   Program_Counter
// Module Name:   /ad/eng/users/l/a/lamorgan/Desktop/ec413Project1/tb_Program_Counter.v
// Project Name:  ec413Project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Program_Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Program_Counter;

	// Inputs
	reg [31:0] PC;
	reg clock;

	// Outputs
	wire [31:0] PC_Out;

	// Instantiate the Unit Under Test (UUT)
	Program_Counter uut (
		.PC(PC), 
		.PC_Out(PC_Out), 
		.clock(clock)
	);

	initial begin
		// Initialize Inputs
		PC = 32'b0;
		
		clock = 0;
		#10 clock = 1;
		#10 clock = 0;
		#10 clock = 1;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

