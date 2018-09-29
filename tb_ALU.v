`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:43:09 11/09/2017
// Design Name:   ALU
// Module Name:   /ad/eng/users/l/a/lamorgan/Desktop/ec413Project1/tb_ALU.v
// Project Name:  ec413Project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_ALU (); 
 
reg    clock; 
reg [3:0]   ALU_Control; 
reg [31:0]  operand_A ;
reg [31:0]  operand_B ;
wire zero; 
wire [31:0] ALU_result;

 
ALU DUT (
		.ALU_Control(ALU_Control), 
		.operand_A(operand_A), .operand_B(operand_B), 
		.ALU_result(ALU_result), .zero(zero)
); 

// Clock generator
always #1 clock = ~clock;

initial begin
  clock = 0;
  //MemWrite = 0;
  //MemRead  = 0;
  $display (" --- Start --- ");
  repeat (1) @ (posedge clock);
  
  operand_A   <= 32'h0000_0000_0000_0005;
  operand_B   <= 32'h0000_0000_0000_0007;
  ALU_Control <= 4'b0000;  
  repeat (1) @ (posedge clock);
  
  operand_A   <= 32'h0000_0000_0000_0002;
  operand_B   <= 32'h0000_0000_0000_0004;
  ALU_Control <= 4'b0001;  
  repeat (1) @ (posedge clock);
  
  operand_A   <= 32'h0000_0000_0000_000A;
  operand_B   <= 32'h0000_0000_0000_0004;
  ALU_Control <= 4'b0110;  
  repeat (1) @ (posedge clock);
  
  operand_A   <= 32'h0000_0000_0000_0002;
  operand_B   <= 32'h0000_0000_0000_0004;
  ALU_Control <= 4'b0111;  
  repeat (1) @ (posedge clock);
  
  operand_A   <= 32'h0000_0000_0000_0002;
  operand_B   <= 32'h0000_0000_0000_0004;
  ALU_Control <= 4'b1100;  
  repeat (1) @ (posedge clock);
end
  
  
always @ (posedge clock) begin 
    	$display ("ALU_Control [%b], operand_A [%d] operand_B [%d]", ALU_Control, operand_A, operand_B); 
    	$display ("ALU_result [%d] zero  [%b]",ALU_result,zero); 
end
     
endmodule

