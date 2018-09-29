`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:05:05 12/04/2017
// Design Name:   Control_Unit
// Module Name:   /ad/eng/users/l/a/lamorgan/Desktop/ec413Project1/tb_control_unit.v
// Project Name:  ec413Project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_control_unit;

	// Inputs
	reg [31:0] instruction;

	// Outputs
	wire [3:0] ALU_Control;
	wire [4:0] read_sel_a;
	wire [4:0] read_sel_b;
	wire [4:0] write_sel;
	wire write;
	wire [5:0] ALUOp;
	wire Branch;
	wire MemRead;
	wire MemToReg;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;
	wire RegDest;

	// Instantiate the Unit Under Test (UUT)
	Control_Unit uut (
		.instruction(instruction), 
		.ALU_Control(ALU_Control), 
		.read_sel_a(read_sel_a), 
		.read_sel_b(read_sel_b), 
		.write_sel(write_sel), 
		.write(write), 
		.ALUOp(ALUOp), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemToReg(MemToReg), 
		.MemWrite(MemWrite), 
		.ALUSrc(ALUSrc), 
		.RegWrite(RegWrite), 
		.RegDest(RegDest)
	);

	initial begin
		// Initialize Inputs
		#10 instruction = 32'b00000000011000010001000000100011;
		#10 instruction = 32'b00000000100000010001100000101011;
		#10 instruction = 32'b00000000100000010001100000000100;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

