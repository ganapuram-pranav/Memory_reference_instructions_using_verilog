module Mem_ref_instr ( 
		      input wire clk, rst,
		      output reg [11:0]AR,
		      output reg [15:0]AC,
		      output reg [15:0]IR,
		      output reg I,
		      output reg [15:0]DR,
		      output reg [2:0]D,
		      output reg [2:0]current_T_state
	      	      );

reg [12:0]PC;
reg [15:0]M[4095:0];
reg [2:0]state, next_state;

parameter T0=3'b000,
	  T1=3'b001, 
	  T2=3'b010, 
	  T3=3'b011, 
	  T4=3'b100,
	  AND=3'b000, 
	  ADD=3'b001,
	  LDA=3'b010,
	  STA=3'b011,
	  BUN=3'b100,
	  BSA=3'b101,
	  ISZ=3'b110;	  

always@(posedge clk or posedge rst)begin
if(rst)begin
	PC<=12'b0;
	state<=3'b000;
	next_state<=3'b000;
	AR<=12'b0;
	AC<=16'b0;
	IR<=16'b0;
	I<=1'b0;
	DR<=16'b0;
	D<=3'b0;
	current_T_state<=3'b0;
end else begin
	state<=next_state;
	if(state==T1) PC<=PC+1;
	end
end
	
always@(*)begin
	case(state)
		T0:begin
			AR=PC;
			current_T_state=T0;
			next_state=T1;
		end
		
		T1:begin
			IR=M[AR];
			current_T_state=T1;
			next_state=T2;
		end
		
		T2:begin
			AR=IR[11:0];
			I=IR[15];
			current_T_state=T2;
			next_state=T3;
		end
		
		T3:begin
			if(I)begin
					D=IR[14:12];
					$display ("\nAR=%h",AR);
					AR=M[AR];
					$display ("AR=%h",AR);
					current_T_state=T3;
					next_state=T4;
				end
				else begin
					D=IR[14:12];
					current_T_state=T3;
					next_state=T4;
				end
		end
		
		T4:begin
			
			case(D)
			AND:begin
				DR = M[AR];
				$display ("\nDR=%h",DR);
				AC = AC & DR;
				$display ("AND operation:\nAC=%h",AC);
				current_T_state=T4;
				next_state=T0;	
			end
			     
			ADD:begin
				DR = M[AR];
				$display ("\nDR=%h",DR);
				AC = AC+DR;
				$display ("ADD operation:\nAC=%h",AC);
				current_T_state=T4;
				next_state=T0;
			end
			     
			LDA:begin
				AC = M[AR];
				$display ("\nAR=%h",AR);
				$display ("LDA operation:\nAC=%h",AC);
				current_T_state=T4;
				next_state=T0;
			end
			     
			STA:begin 
				M[AR] = AC; 
				$display ("\nAR=%h",AR);
				$display ("STA operation: \nM\[AR\]=%h",M[AR]);
				current_T_state=T4;
				next_state=T0;
			end
			
			BUN:begin
				PC=AR;
				$display ("\nBUN operation:\nPC=%h",PC);
				current_T_state=T4;
				next_state=T0;
			end
			
			BSA:begin
				M[AR]=PC;
				$display ("\nBSA operation: \nM\[AR\]=%h",M[AR]);
				AR=AR+1;
				PC=AR;
				current_T_state=T4;
				next_state=T0;
			end
			
			ISZ:begin 
				$display ("\nM\[AR\]=%h",M[AR]);
				M[AR]=M[AR]+1;
				$display ("ISZ operation: \nM\[AR\]=%h",M[AR]);
				if (M[AR]==0)
					PC=PC+1;
			end
			endcase
		end
	endcase
end
endmodule	      
