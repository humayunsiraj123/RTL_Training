

module dff_async(
input clk,reset,d,
output reg q
);


always @(posedge clk, negedge reset)
begin
if (!reset)
q<=0;
else
q<=d;
end
endmodule