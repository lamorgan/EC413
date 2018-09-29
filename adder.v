`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:58:48 12/06/2017 
// Design Name: 
// Module Name:    adder 
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
module adder(
	zero,
	branch,
	out
    );
	
	input zero;
	input branch;
	output reg out;
	
	always@(*)
	begin
	
	if(zero == 1)
	begin
		out = zero & branch;
	end

	end
	
endmodule
