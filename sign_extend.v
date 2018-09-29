`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:06 12/05/2017 
// Design Name: 
// Module Name:    sign_extend 
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
module sign_extend(
instruction,
out
    );

input [15:0] instruction;
output reg [31:0] out;

always@(*)
begin

out[15:0] = instruction;

if(instruction[15] == 1'b0)
begin
	out[31:16] = 16'b0000000000000000;
end

else if(instruction[15] == 1'b1)
begin
	out[31:16] = 16'b1111111111111111;
end

end

endmodule
