module MOD_COUNTER#(parameter n=10,N=4)(clk,reset,q);
output reg [N-1:0]q;
input clk,reset;
always@(posedge clk);
if(reset ,q==n)begin
q<=0;
end
else
q<=q+1;
end
endmodule


module TB;
reg clk,reset;
integer N=4;
integer n=10;
wire [N-1:0]q;

MOD_COUNTER#(n,N) counter(.clk(clk),.reset(reset),.q(q));

always begin
#5 clk=~clk;
end


initial begin
reset=0;
$display("the value of count =%d",q);
#10;
$display("the value of count =%d",q);
#10;$display("the value of count =%d",q);
#10;$display("the value of count =%d",q);
#10;$display("the value of count =%d",q);
#10;$display("the value of count =%d",q);
#10;$display("the value of count =%d",q);
#10;$display("the value of count =%d",q);
#10;$display("the value of count =%d",q);
#10;reset=1'b1;
$display("the value of count =%d",q);
#10;$display("the value of count =%d",q);
#10;$display("the value of count =%d",q);
#10;$display("the value of count =%d",q);
#10;reset=1'b1;
$display("the value of count =%d",q);
#10;$display("the value of count =%d",q);
#10;$display("the value of count =%d",q);
end
endmodule
