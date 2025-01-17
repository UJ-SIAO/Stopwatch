`timescale 1ns/1ns
module Lab1_sim();

reg	clk;
reg	rst;
reg	key0_in;
wire	[6:0]min1;
wire	[6:0]min2;
wire	[6:0]sec1;
wire	[6:0]sec2;
wire	[6:0]ms1;
wire	[6:0]ms2;
wire	run_stop;
wire	[18:0]min_counter;
Lab1	Lab1_sim(
	.clk(clk),
	.rst(rst),
	.key0_in(key0_in),
	.min1(min1),
	.min2(min2),
	.sec1(sec1),
	.sec2(sec2),
	.ms1(ms1),
	.ms2(ms2)
);
assign  run_stop=Lab1_sim.Lab1.state1.run_stop;
assign  min_counter=Lab1_sim.Lab1.stopwatch1.min_counter;
always
	#10 clk = ~clk;
initial
begin
	clk=0;
	rst=1;
	key0_in=1;
	#10 rst=0;
	#10 rst=1;
	#10 key0_in=0;
	#10 key0_in=1;
	#100 key0_in=0;
	#10 key0_in=1;
	#100 key0_in=0;
	#10 key0_in=1;
	#1000
	#100 rst=0;
	#10 rst=1;
	$stop;
end

always
begin
	#1 force Lab1_sim.Lab1.stopwatch1.ms_counter = 1;
	#1 force Lab1_sim.Lab1.stopwatch1.ms_counter = 0;
end
always
begin
	#5 force Lab1_sim.Lab1.stopwatch1.sec_counter=1;
	#5 force Lab1_sim.Lab1.stopwatch1.sec_counter=0;
end
always
begin
	#10 force Lab1_sim.Lab1.stopwatch1.min_counter=1;
	#10 force Lab1_sim.Lab1.stopwatch1.min_counter=0;
end

endmodule
