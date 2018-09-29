`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:30:42 11/09/2017
// Design Name:   registerFile
// Module Name:   /ad/eng/users/l/a/lamorgan/Desktop/ec413Project1/tb_registerFile.v
// Project Name:  ec413Project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: registerFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_registerFile (); 

reg clock, reset; 
reg [4:0] read_reg1, read_reg2, write_reg; 
reg write; 
reg [31:0] write_data; 
wire [31:0] read_data1, read_data2; 

registerFile DUT (
        .clock(clock), .reset(reset), 
        .read_reg1(read_reg1), .read_reg2(read_reg2),
        .write(write), .write_reg(write_reg), .write_data(write_data), 
        .read_data1(read_data1), .read_data2(read_data2)
); 

// Clock generator
always #1 clock = ~clock;

initial begin
  clock = 0;
  reset = 1;
  write = 0;
  #10 reset = 0; 
  $display (" --- Start --- ");
  repeat (1) @ (posedge clock);
  
  write_data <= 32'h0000_0000_0000_0002;
  write_reg  <= 5'b00001;  
  write      <= 1'b1;
  repeat (1) @ (posedge clock);
  
  write_data <= 32'h0000_0000_0000_0005;
  write_reg  <= 5'b00011;  
  write      <= 1'b1;
  repeat (1) @ (posedge clock);
  
  write_data <= 32'h0000_0000_0000_0009;
  write_reg  <= 5'b00111;  
  write      <= 1'b1;
  repeat (1) @ (posedge clock);
  
  write_data <= 32'h0000_0000_0000_0007;
  write_reg  <= 5'b00000;  
  write      <= 1'b1;
  repeat (1) @ (posedge clock);
  
  write_data <= 32'h0000_0000_0000_000A;
  write_reg  <= 5'b00101;  
  write      <= 1'b1;
  read_reg1  <= 5'b00101; 
  repeat (1) @ (posedge clock);

  write_data <= 32'h0000_0000_0000_000A;
  write_reg  <= 5'b00101;  
  write      <= 1'b0;
  read_reg1  <= 5'b00101; 
  repeat (1) @ (posedge clock);
 
  write_data <= 32'h0000_0000_0000_000A;
  write_reg  <= 5'b00101;  
  write      <= 1'b0;
  read_reg1 <= 5'b00101; 
  read_reg2  <= 5'b00101; 
  repeat (1) @ (posedge clock);
 
  read_reg1  <= 5'b00111; 
  read_reg2  <= 5'b00111; 
  repeat (1) @ (posedge clock);
  
  read_reg1  <= 5'b00011; 
  read_reg2  <= 5'b00001; 
  repeat (1) @ (posedge clock);
 
  read_reg1  <= 5'b00000; 
  read_reg2  <= 5'b00001; 
  repeat (1) @ (posedge clock);          
end
  
  
always @ (posedge clock) begin 
    	$display ("Read1 Sel [%d], Read1 Data [%h]",read_reg1, read_data1); 
    	$display ("Read2 Sel [%d], Read2 Data [%h]",read_reg2, read_data2); 
end

endmodule

