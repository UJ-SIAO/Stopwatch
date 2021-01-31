module state(
	clk,
	rst,
	key0,
	run_stop
);
input clk;
input rst;
input key0;
output run_stop;

reg run_stop=1'b0;

always@(posedge clk or negedge rst)
begin
	if(!rst)
		run_stop<=1'b0;
	else
	begin
	if(key0)
		if(run_stop)
			run_stop<=0;
		else
			run_stop<=1;
	else
		run_stop<=run_stop;
	end
end
endmodule
