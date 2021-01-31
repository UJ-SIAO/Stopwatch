module  stopwatch	(
	clk,
	rst,
	run_stop,
	min,
	sec,
	ms
);

input	clk;
input	rst;
input run_stop;
output min;
output sec;
output ms;

reg	[31:0]min_counter;
reg	[25:0]sec_counter;
reg	[18:0]ms_counter;
reg	[6:0]ms;
reg	[6:0]sec;
reg	[6:0]min;

always@(posedge clk or negedge rst)
begin
	if(!rst)
		ms_counter <=19'b1;
	else 
	begin
		if(ms_counter==19'd500000)
			ms_counter <=19'b0;
		else
		begin
			if(run_stop)
				ms_counter <=ms_counter+1;
			else
				ms_counter <=ms_counter;
		end			
	end
end

always@(posedge clk or negedge rst)
begin
	if(!rst)
		ms<=7'd0;
	else
	begin
		if(run_stop)
			if(ms_counter==19'd0)
				if(ms==7'd99)
					ms<=7'd0;
				else
					ms<=ms+1;
			else
				ms<=ms;
		else
			ms<=ms;
	end
end

always@(posedge clk or negedge rst)
begin
	if(!rst)
		sec_counter<=26'b1;
	else
	begin
		if(sec_counter==26'd50000000)
			sec_counter <= 26'b0;
		else
		begin
			if(run_stop)
				sec_counter <=sec_counter+1;
			else
				sec_counter <=sec_counter;
		end
	end
end

always@(posedge clk or negedge rst)
begin
	if(!rst)
		sec<=7'd0;
	else
	begin
		if(run_stop)
			if(sec_counter==19'd0)
				if(sec==7'd59)
					sec<=7'd0;
				else
					sec<=sec+1;
			else
				sec<=sec;
		else
			sec<=sec;
	end
end

always@(posedge clk or negedge rst)
begin
	if(!rst)
		min_counter<=32'b1;
	else
	begin
		if(min_counter==32'd3000000000)
			min_counter <= 32'b0;
		else
		begin
			if(run_stop)
				min_counter <=min_counter+1;
			else
				min_counter <=min_counter;
		end
	end
end

always@(posedge clk or negedge rst)
begin
	if(!rst)
		min<=7'd0;
	else
	begin
		if(run_stop)
			if(min_counter==19'd0)
				if(min==7'd59)
					min<=7'd0;
				else
					min<=min+1;
			else
				min<=min;
		else
			min<=min;
	end
end
endmodule
		