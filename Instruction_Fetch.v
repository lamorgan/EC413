`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:44 12/04/2017 
// Design Name: 
// Module Name:    Instruction_Fetch 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Instruction_Fetch(
	PC,
	Instruction
    );

input [31:0] PC;
output reg [31:0] Instruction;

always@(PC)
begin
	case(PC)
		0: Instruction = 32'b00000000001000100001100000000110; // add
		
		1: Instruction = 32'b10101100010010000000000000000000; // sw
		
		2: Instruction = 32'b00010000101001010000000000000001; // Branch
		
		4: Instruction = 32'b10001100101010100000000000000000; // lw
		
		5: Instruction = 32'b00100000101000110110000000000000; // addi
		
		//2: Instruction = 32'b00000000001001000010100000000010;
		
	endcase
	
end


endmodule
