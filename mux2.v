`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52:32 12/05/2017 
// Design Name: 
// Module Name:    mux2 
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
module mux2(
	in_1,
	in_2,
	select,
	out
    );

input [31:0] in_1;
input [31:0]in_2;
input select;
output [31:0] out;

assign out = (select) ? in_2 : in_1;

endmodule
