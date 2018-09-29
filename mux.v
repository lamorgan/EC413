`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:55:20 12/04/2017 
// Design Name: 
// Module Name:    mux 
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
module mux(
	in_1,
	in_2,
	select,
	out
    );

input [4:0] in_1;
input [4:0]in_2;
input select;
output [4:0] out;

assign out = (select) ? in_2 : in_1;

endmodule
