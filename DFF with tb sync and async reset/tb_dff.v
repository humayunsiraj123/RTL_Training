
module tb;
wire q,q_async;
reg d,reset,clk;

initial clk=1'b0;

always begin
#5 clk=~clk;
end

dff dff1(clk,reset,d,q);
dff_async dff2(clk,reset,d,q_async);

initial begin
d=1'b1;
reset=1'b0;
#50;
d=1'b1;
reset=1'b1;
#50;
d=1'b1;
reset=1'b0;
#50;
d=1'b1;
reset=1'b1;
#50;
d=1'b0;
reset=1'b1;
#50;
d=1'b1;
reset=1'b1;
#50;
repeat(5)begin
#50;
d=$random();
reset=$random();
end
end
initial begin
$monitor("D =%b  reset %b  q %b  q_async %b",d,reset,q,q_async);
 end
endmodule

