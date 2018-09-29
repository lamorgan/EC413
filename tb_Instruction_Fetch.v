`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:37:41 12/05/2017
// Design Name:   Instruction_Fetch
// Module Name:   /ad/eng/users/l/a/lamorgan/Desktop/ec413Project1/tb_Instruction_Fetch.v
// Project Name:  ec413Project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Instruction_Fetch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Instruction_Fetch;

	// Inputs
	reg [31:0] PC;

	// Outputs
	wire [31:0] Instruction;
	
	wire [31:0] PC_Out;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Fetch uut (
		.PC(PC), 
		.Instruction(Instruction),
		.PC_Out(PC_Out)
	);

	initial begin
		// Initialize Inputs
		PC = 32'b0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

