module seg(
	clk,
	rst,
	number_in,
	code_out
);

input clk;
input rst;
input [3:0]number_in;
output [6:0]code_out;

reg [6:0]code_out;

always@(posedge clk or negedge rst)
begin
	if(!rst)
		code_out<=7'b1000000;
	else
		begin
			case(number_in)
			4'h0: code_out <= 7'b1000000; //0  
			4'h1: code_out <= 7'b1111001; //1
			4'h2: code_out <= 7'b0100100; //2
			4'h3: code_out <= 7'b0110000; //3
			4'h4: code_out <= 7'b0011001; //4
			4'h5: code_out <= 7'b0010010; //5
			4'h6: code_out <= 7'b0000010; //6
			4'h7: code_out <= 7'b1111000; //7
			4'h8: code_out <= 7'b0000000; //8
			4'h9: code_out <= 7'b0011000; //9
			4'ha: code_out <= 7'b0001000; //a
			4'hb: code_out <= 7'b0000011; //b
			4'hc: code_out <= 7'b1000110; //c
			4'hd: code_out <= 7'b0100001; //d
			4'he: code_out <= 7'b0000110; //e
			4'hf: code_out <= 7'b0001110; //f
	     default: code_out <= 7'b0111111; //0	
		  endcase
		end
end
endmodule
		