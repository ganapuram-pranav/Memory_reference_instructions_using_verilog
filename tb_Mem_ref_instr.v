`timescale 1ns/1ps

module tb_Mem_ref_instr;

reg Clk;
reg Rst;
wire [11:0]ar;
wire [15:0]ac;
wire [15:0]ir;
wire i;				      		  
wire [15:0]dr;				      		  
wire [2:0]d;
wire [2:0]state;				      		  						  

Mem_ref_instr DUT(Clk, Rst, ar, ac, ir, i, dr, d, state);

initial begin 
	Clk=1'b0; Rst=1'b1;
	DUT.M[0]=16'b0010000000010100;
	DUT.M[1]=16'b0001000000010101;
	DUT.M[2]=16'b0011000000010110;
	DUT.M[3]=16'b1001000000010111;
	DUT.M[4]=16'b1000000000011000;
	DUT.M[5]=16'b0100000000011011;
	DUT.M[15]=16'b0110000000011110;
	DUT.M[20]=16'b0000000000010100;
	DUT.M[21]=16'b0000000000001010;
	DUT.M[23]=16'b0000000000011010;
	DUT.M[24]=16'b0000000000011001;
	DUT.M[25]=16'b0000000000001100;
	DUT.M[26]=16'b0000000000011110;
	DUT.M[27]=16'b0001000000010101;
	DUT.M[28]=16'b0101000000011101;
	DUT.M[30]=16'b0110000000011111;
	DUT.M[31]=16'b1111111111111111;
	#5 Rst=1'b0;
	#500 $finish;
end

initial begin 
	$dumpfile("sim.vcd");
	$dumpvars(0, tb_Mem_ref_instr);
end

always #5 Clk=~Clk;

endmodule
