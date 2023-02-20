module test(
	input  		[1:0] in    ,
	output 	reg	[4:0] out   ,
	output  reg    	[4:0] temp1);
	initial begin
		temp1 =  4'b0001;	
		end

always @* begin
case(in)
'd0 : out = temp1;
'd1 : out = temp1<<in;
'd2 : out = temp1<<in;
'd3 : out = temp1<<in;
endcase
end
endmodule

module test1(
	input  		[1:0] in    ,
	output 		[4:0] out   
	);
	 parameter temp1= 4'b0001;	
assign out=temp1<<in;
endmodule





module tb_test ;

wire [3:0]  out;
wire [3:0]  temp1;
wire [3:0]  out1;
reg  [1:0]  in ;


test  dut (.in(in),.out(out),.temp1(temp1));
test1 dut1 (.in(in),.out(out1));

initial begin
	in = 2'd0;
	#100;
	in = 2'd1;
	#100;
	in =2'd2;
	#100;
	in =2'd3;
	#100;
	in = 2'd2;
	#100;
	in = 2'd1;
	#100;
	in =2'd0;
	#100;
	in =2'd3;
end
initial begin
$monitor("he value of IN = %d and out = %b  temp1 = %b , out1=%b" ,in,out,temp1,out1);
end
endmodule
