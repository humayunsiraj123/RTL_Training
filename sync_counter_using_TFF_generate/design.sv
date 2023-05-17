


// part1

module LAB3(input [9:0] SW,output [9:0] LEDR,input kEY0);

sync_counter#(8) lab3p1(SW[9],SW[8],SW[7],LEDR[7:0]);
endmodule


module sync_counter#(parameter N=8)(clk,reset,enable,q);
input clk,reset;
input enable;
wire [N:0]en_sig;
output reg [N-1:0]q;
assign en_sig[0]=enable;
genvar i;
generate 
for(i=0;i<N;i=i+1)
begin:myloop
TFF TFF_i(clk,reset,en_sig[i],q[i]);

assign en_sig[i+1]=enable&q[i];
end
endgenerate
 
endmodule


module TFF(clk,reset,en,q);
input clk,en,reset;
output reg q;

always @(posedge clk,negedge reset)
begin
if(reset)
q<=0;
else if(en)
	q<=~q;
else
q<=q;
end
endmodule


	