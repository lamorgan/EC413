//`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:29:53 11/13/2017
// Design Name:   CPU
// Module Name:   /ad/eng/users/l/a/lamorgan/Desktop/ec413Project1/tb_CPU.v
// Project Name:  ec413Project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
/** @module : CPU
 *  @author : Albert Bitdiddle
 *  CPU Module Testbed 
 *  Adaptive and Secure Computing Systems (ASCS) Laboratory
 */


module tb_CPU (); 
reg clock, reset, start; 
reg [31:0] program_counter;  


CPU cpu (
    .clock(clock), 
    .reset(reset), 
    .start(start), 
    .program_counter(program_counter)
);     

    // In phase I, we are not implementing the instruction memory. Therefore, we manually the instruction, the register
    // in the CPU.v It is implemented as a register right now, but you will eventually want to change it to a wire and 
    // drive it from instruction memory.

    // Clock generator
    always #1 clock = ~clock;

    initial begin
        clock = 0;
        reset = 1;
        start = 0;
			program_counter = 0;
        // Right now the regfile is empty. You can manually set the values in the regfile with something like:

		  cpu.registers.regfile[1] = 7;
		  cpu.registers.regfile[2] = 5;
		  cpu.registers.regfile[5] = 5;
		  cpu.registers.regfile[8] = 3;
		  
		  cpu.Program_Counter.PC_Out = 32'b0;
		  //cpu.registers.write <= 1;
        // This will allow you to test your ALU and register file before the processor is complete. 

        #10 reset = 0;
            start = 1;

			
			
        // After 10 nanoseconds, lets set the regfile_read_sel_1 to 1, regfile_read_sel_2 to 2, AND those values,
        // and write the result to register 3.
       // #10 cpu.instruction = 32'b00000000011000010001000000000000; // AND regs 1 and 2, put result in 3 
        //#10 cpu.instruction = 32'b00000000100000010001100000000001; // OR regs 1 and 3, put result in 4 
       // #10 cpu.instruction = 32'b00000000101000010010000000000010; // ADD regs 1 and 4, put result in 5

			//cpu.MemRead = 1;	
			//#10 cpu.MemWrite = 1;
			//#10 cpu.MemWrite = 0;

        // If you set the values of those  registers 1 and 2 to something other than 0, you should see some result in
        // register 3.

     end
     
endmodule

