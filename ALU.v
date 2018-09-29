`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:08:35 11/09/2017 
// Design Name: 
// Module Name:    ALU 
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
/** @module : ALU
 *  @author : Albert Bitdiddle
 *  ALU Module Template 
 *  Adaptive and Secure Computing Systems (ASCS) Laboratory
 */
 
module ALU (
		ALU_Control, 
		operand_A, operand_B, 
		ALU_result, zero
); 
input [3:0]   ALU_Control; 
input [31:0]  operand_A ;
input [31:0]  operand_B ;
output reg zero; 
output reg [31:0] ALU_result;

//--------------Add your code here ------------------ 

//always@(ALU_Control | operand_A | operand_B)
always@(*)
begin
	case(ALU_Control)
		4'b0000: ALU_result = operand_A & operand_B;
		4'b0001: ALU_result = operand_A | operand_B;
		4'b0010: ALU_result = operand_A + operand_B;	
		4'b0110: ALU_result = operand_A - operand_B;
		4'b0111: ALU_result = (operand_A < operand_B) ? 1 : 0;
		4'b1100: ALU_result = ~(operand_A | operand_B);
		
		default: ALU_result = "HIHIHI";
	endcase 
	
	//zero = ALU_result == (ALU_result == 0) ? 1 : 0;
	if(ALU_result == 32'b0)
	begin
		zero = 1;
	end
	else
	begin
		zero = 0;
	end
end

//----------------------------------------------------

endmodule
