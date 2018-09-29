`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:13:16 11/09/2017 
// Design Name: 
// Module Name:    memory 
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
/** @module : Memory Module
 *  @author : Albert Bitdiddle
 *  Simple Memory Design Template
 *  Adaptive and Secure Computing Systems (ASCS) Laboratory
 */
 
module Memory (
		clock,
    	Address,
   		MemRead, ReadData,
    	MemWrite,writeData
); 

input clock; 
input [7:0]   Address;
input MemRead;
output reg [31:0]  ReadData;
input MemWrite;
input [31:0]   writeData;
 
localparam MEM_DEPTH = 1 << 7;
reg [31:0]     ram [0:MEM_DEPTH-1];
 
//--------------Add your code here ------------------ 

always@(posedge clock)
begin
	if(MemWrite)
		// write data is equal to the inputted address
		ram[Address] = writeData;
		
	if(MemRead)
		// ReadData is equal to the address 
		ReadData = ram[Address];
		
end

//----------------------------------------------------
endmodule
