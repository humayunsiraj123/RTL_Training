
module one_shot(
input clk,
input sig,
output out1,
output out2);

reg sig1,sig2;

always @(posedge clk)
begin
if(sig)
sig1<=1'b1;
else
sig1<=1'b0;
end

always @(posedge clk)
begin
if(sig1)
sig2<=1'b1;
else
sig2<=1'b0;
end


assign out1=sig1 ;
assign out2=sig2;

endmodule