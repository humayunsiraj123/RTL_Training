module univ_shifter #(parameter N)(clk,reset,data,out,control);
input clk;
input reset;
input [1:0]control;
input [N-1:0]data;
output reg[N-1:0]out;

reg [N-1:0] r_reg,r_next;

always @(posedge clk)
begin
if (reset)
	r_reg<='d0;
else
	r_reg<=r_next;
end


always @* begin
case(control)
2'd0 : r_next =r_reg;
2'd1 : r_next ={r_reg[N-1-1:0],data[0]};
2'd2 : r_next ={data[N-1],r_reg[N-1-1:1]};
2'd3 : r_next =data;
endcase
out =r_reg;
end
endmodule

  
	
	