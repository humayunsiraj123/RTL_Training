
module tb_oneshot;
wire out1,out2;
reg clk=1'b0;
reg sig;


one_shot dut(clk,sig,out1,out2);

always #5 clk=~clk;

initial begin
sig =1'b1;
repeat(10) @(posedge clk);
sig =1'b0;
repeat(5) @(posedge clk);
sig =1'b1;
repeat(10) @(posedge clk);
sig =1'b0;
repeat(5) @(posedge clk);

repeat(5)
begin
repeat(10) @(posedge clk);
sig=$random();
end
end
endmodule



