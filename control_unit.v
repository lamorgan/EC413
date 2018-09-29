`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:11:56 11/13/2017 
// Design Name: 
// Module Name:    control_unit 
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
module Control_Unit(
    instruction,
    ALU_Control,
    read_sel_a,
    read_sel_b,
    write_sel,
	 ALUOp,
	 Branch,
	 MemRead,
	 MemToReg,
	 MemWrite,
	 ALUSrc,
	 RegWrite,
	 RegDest
);

    // TODO This is an unfinished control unit. It serves just to get you going with phase I, so you will need to change it
    // as you go along.

    input [31:0] instruction;
    output reg [3:0] ALU_Control;
    output reg [4:0] read_sel_a, read_sel_b, write_sel;
	 output reg [5:0] ALUOp;
	 output reg Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, RegDest;

always@(*)
	 begin
		read_sel_a = instruction[25:21];
		read_sel_b = instruction[20:16];
		ALUOp = instruction[31:26];
	 if(ALUOp == 6'b100011)	//LW
	 begin
		ALU_Control = 4'b0010;
		RegDest = 1'b0;
		ALUSrc = 1'b1;
		MemToReg = 1'b1;                                                                                                                                                                  
		RegWrite = 1'b1;
		MemRead = 1'b1;
		MemWrite = 1'b0;
		Branch = 1'b0;
	 end
	 else if(ALUOp == 6'b101011) //SW
	 begin
		ALU_Control = 4'b0010;
		ALUSrc = 1'b1;
		RegWrite = 1'b0;
		MemRead = 1'b0;
		MemWrite = 1'b1;
		Branch = 1'b0;
	 end
	 else if(ALUOp == 6'b000100)	//Branch
	 begin
		ALUSrc = 1'b0;
		RegWrite = 1'b0;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b1;
		ALU_Control = 4'b0110;
	 end
	 else if(ALUOp == 6'b001000) // ADDI
	 begin
		RegDest = 1'b0;
		ALUSrc = 1'b1;
		MemToReg = 1'b0;
		RegWrite = 1'b1;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b0;
		write_sel = instruction[15:11];
		ALU_Control = 4'b0010;
	 end
	 else
	 begin
		ALU_Control = instruction[3:0];
		write_sel = instruction[15:11];
		RegDest = 1'b1;
		ALUSrc = 1'b0;
		MemToReg = 1'b0;
		RegWrite = 1'b1;
		MemRead = 1'b0;
		MemWrite = 1'b0;
		Branch = 1'b0;
	 end
//    assign ALU_Control = instruction[3:0];
//    assign read_sel_a  = instruction[20:16];
//    assign read_sel_b  = instruction[15:11];
//    assign write_sel   = instruction[25:21];
//    assign write       = 1'b1;
end

endmodule
