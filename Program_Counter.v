`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:19 12/05/2017 
// Design Name: 
// Module Name:    Program_Counter 
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
module Program_Counter(
	PC_Out,
	clock,
	sign_out,
	ALU_zero,
	Branch,
	adder_out
    );

input clock;
input [31:0] sign_out;
input ALU_zero;
input Branch;
output reg [31:0] adder_out;
output reg [31:0] PC_Out;

	always@(posedge clock)
	begin
		PC_Out = PC_Out + 1;
		
		adder_out = sign_out + PC_Out;
		
	if(ALU_zero == 1 && Branch == 1)
	begin
		PC_Out = adder_out;
	end
	
	
	end

	
	

endmodule
