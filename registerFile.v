`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:57:41 11/14/2017 
// Design Name: 
// Module Name:    registerFile 
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
module registerFile (
				clock, reset, 
                read_reg1, read_reg2,
				write, write_reg, write_data, 
				read_data1, read_data2
);

input clock, reset; 
input [4:0] read_reg1, read_reg2; 
input write; 
input [31:0] write_data;
input [4:0] write_reg;
output reg[31:0] read_data1; 
output reg[31:0] read_data2; 

//--------------Add your code here ------------------ 
reg [31:0] regfile [31:0];

// do we have to initialize the array at all?

always@(*)
begin
	if(write)
	begin
	regfile[write_reg] = write_data;

	end
	read_data1 = regfile[read_reg1];
	
	read_data2 = regfile[read_reg2];
end






//----------------------------------------------------
endmodule
