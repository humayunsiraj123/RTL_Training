module universal_counter #(parameter N=8) (
input clk,up,down,reset,en,preset,load,
input [N-1:0] l_data,
output [N-1:0] count,
output max,min);

parameter preset_val='d10;
 

reg [N-1:0]r_reg,r_next;
wire en_up=en&up;
wire en_down=en&down;
wire en_load=en&load;
wire en_preset=en&preset;
 
always @(posedge clk)
begin
if(reset)
	r_reg<='d0;
else
	r_reg<=r_next;
end

always @(*) begin
if(en_up)
r_next =r_reg+'d1;
else if(en_down)
r_next =r_reg-'d1;
else if (en_load)
r_next = l_data;
else if (en_preset)
r_next = preset_val;
else
r_next=r_reg;
end

assign count =r_reg;
assign max = ((count == {N{1'b1}}) ? 1:0);
assign min = ((count == {N{1'b0}}) ? 1:0);
endmodule

