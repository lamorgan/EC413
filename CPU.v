//`timescale 1ns / 1ps
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:27:38 11/13/2017 
// Design Name: 
// Module Name:    CPU 
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
/** @module : CPU
 *  @author : Albert Bitdiddle
 *  CPU Module Template 
 *  Adaptive and Secure Computing Systems (ASCS) Laboratory
 */

module CPU (
  clock, 
  reset, 
  start,
  program_counter
); 

    input clock, reset, start; 
	 input [31:0]  program_counter; 
     
    wire [31:0] ALU_operand_A, ALU_operand_B, ALU_result;
    wire ALU_zero;
	 
	 //reg MemWrite;
	// reg MemRead;
	 wire [31:0] ReadData;

    // TODO: the instruction is currently a register, so we can control it from the testbench.
    // Later, we will want to turn it into a wire and drive it from instruction memory.
    wire [31:0] instruction;

    // Control signals from the control unit.
    wire [3:0] ALU_Control;
    wire [4:0] regfile_read_sel1, regfile_read_sel2, regfile_write_sel;
    wire regfile_write, Branch, MemRead, MemToReg, MemWrite;
	 wire ALUSrc, RegWrite, RegDest;
	 wire [5:0] ALUOp;

	 // sign extend
	 wire [15:0] signextend;
	 
	 // control signals from mux1
	 wire [4:0] out;
	 
	 // mux2
	 wire [31:0] out2;
	 
	 // mux3
	 wire [31:0] out3;
	 
	 wire [31:0] program_counter_out;
	 
	 // sign extend
	 wire [31:0] sign_out;
	 
	 wire [31:0] adder_out;
	 
	 // alu_zero == 1 signals
	 wire PCSrc;
	 
    // TODO Instructions: We have connected the phase I modules - the ALU, register file, but not memory. 
    // For phase I, you shouldn't touch this file. You first need to:
    //    1) Complete refisterFile.v and test it 
    //    2) Complete ALU.v and test it
    //    3) Test both ALU and register file together, for which we have provided some simple benchmarks in tb_CPU.v
    //    4) Complete memory.v and test it
    //    5) Connect memory.v here and test all 3 modules together
    //
    // In phase II, you will have to add the rest of the modules.
	 
    Instruction_Fetch instruction_Memory (
		.PC (program_counter_out),
		.Instruction (instruction)
    ); 
	

	 
    Control_Unit control (
        .instruction(instruction      ),
        .ALU_Control(ALU_Control      ),
        .read_sel_a (regfile_read_sel1),
        .read_sel_b (regfile_read_sel2),
        .write_sel  (regfile_write_sel),
		  .ALUOp (ALUOp),
		  .Branch (Branch),
		  .MemRead (MemRead),
		  .MemToReg (MemToReg),
		  .MemWrite (MemWrite),
		  .ALUSrc (ALUSrc),
		  .RegWrite (RegWrite),
		  .RegDest (RegDest)
    );
	 
	mux mux1(
		.in_1 (regfile_read_sel2),
		.in_2	(regfile_write_sel),
		.select (RegDest),
		.out (out) 
	
	);
	
    registerFile registers (
        .clock     (clock            ),
        .reset     (reset            ),
        .read_reg1 (regfile_read_sel1),
        .read_reg2 (regfile_read_sel2),
        .write     (RegWrite    ),
        .write_data(out3),
        .write_reg (out),					//used to be regfile_write_sel
        .read_data1(ALU_operand_A    ),
        .read_data2(ALU_operand_B    )
    ); 
	 
	 sign_extend sign_extend (
		.instruction (instruction),
		.out (sign_out)
	 );
	 
	mux2 mux2(
		.in_1 (ALU_operand_B),
		.in_2 (sign_out),
		.select (ALUSrc),
		.out (out2)
	);
	
    ALU ALU_unit(
        .ALU_Control(ALU_Control  ),
        .operand_A  (ALU_operand_A),
        .operand_B  (out2), 
        .zero       (ALU_zero     ),
        .ALU_result (ALU_result   )
    ); 
      
	adder adder(
		.zero (ALU_zero),
		.branch (Branch),
		.out (PCSrc)
	);
	
	Memory data_Memory (
		.clock (clock),
		.Address	(ALU_result),
		.ReadData	(ReadData),
		.writeData	(ALU_operand_B),
		.MemRead (MemRead),
		.MemWrite (MemWrite)
	);
	
	mux3 mux3(
		.in_1 (ReadData),
		.in_2 (ALU_result),
		.select(MemToReg),
		.out (out3)
	);
	
	Program_Counter Program_Counter(
		.PC_Out (program_counter_out),
		.clock (clock),
		.sign_out (sign_out),
		.ALU_zero (ALU_zero),
		.Branch (Branch),
		.adder_out (adder_out)
	);
	

endmodule
