
module tb_univ_shifter;
parameter K=16;

wire [K-1:0]out;
reg  [1:0] control;
reg clk ,reset;
reg  [K-1:0] data;

					
univ_shifter#(.N(K)) DUT(.clk(clk),.reset(reset),.data(data),.out(out),.control(control));

						
always begin
#5 clk =1'b1;
#5 clk =1'b0;
end

initial begin
data ='d255;
control =2'd1;
reset =1'b0;
#100;
data ='d0;
control =2'd2;
reset =1'b0;
#100;
data ='d128;
control =2'd1;
reset =1'b0;
#100;
control =2'd2;
reset =1'b0;
#100;
control =2'd3;
reset =1'b0;
#100;
data ='d128;
control =2'd1;
reset =1'b1;
repeat(5)begin
#100;
data=$random();
for (int i=0;i<3;i=i+1)begin
#100;
control =i;
end
end
end
initial begin
$monitor("the value of data %b  control %b reset %b  result %b ",data,control,reset,out);
end
endmodule
