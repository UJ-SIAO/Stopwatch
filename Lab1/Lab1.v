module  Lab1	(
	clk,
	rst,
	key0_in,
	min1,
	min2,
	sec1,
	sec2,
	ms1,
	ms2
);
input clk;
input rst;
input key0_in;
output [6:0]min1;
output [6:0]min2;
output [6:0]sec1;
output [6:0]sec2;
output [6:0]ms1;
output [6:0]ms2;

wire	debo_key0;
wire	run_stop;
wire	[6:0]min;
wire	[6:0]sec;
wire	[6:0]ms;
wire	posed_key0;
wire	neged_key0;
wire	[3:0]min_units;
wire	[3:0]min_tens;
wire	[3:0]sec_units;
wire	[3:0]sec_tens;
wire	[3:0]ms_units;
wire	[3:0]ms_tens;

debounce debounce_key0(
	.clk(clk),
	.rst(rst),
	.key_in(key0_in),
	.key_out(debo_key0)
);
edge_detect edge_detect0(
	.clk(clk),
   .rst(rst),
   .data_in(key0_in),
   .pos_edge(posed_key0),
   .neg_edge(neged_key0) 
);
state state1(
	.clk(clk),
	.rst(rst),
	.key0(neged_key0),
	.run_stop(run_stop)
);
stopwatch stopwatch1(
	.clk(clk),
	.rst(rst),
	.run_stop(run_stop),
	.min(min),
	.sec(sec),
	.ms(ms)
);

assign min_units=min%10;
assign min_tens=min/10;
assign sec_units=sec%10;
assign sec_tens=sec/10;
assign ms_units=ms%10;
assign ms_tens=ms/10;

seg	min_uni(
	.clk(clk),
	.rst(rst),
	.number_in(min_units),
	.code_out(min1)
);
seg	min_ten(
	.clk(clk),
	.rst(rst),
	.number_in(min_tens),
	.code_out(min2)
);
seg	sec_uni(
	.clk(clk),
	.rst(rst),
	.number_in(sec_units),
	.code_out(sec1)
);
seg	sec_ten(
	.clk(clk),
	.rst(rst),
	.number_in(sec_tens),
	.code_out(sec2)
);
seg	ms_uni(
	.clk(clk),
	.rst(rst),
	.number_in(ms_units),
	.code_out(ms1)
);
seg	ms_ten(
	.clk(clk),
	.rst(rst),
	.number_in(ms_tens),
	.code_out(ms2)
);
endmodule		
