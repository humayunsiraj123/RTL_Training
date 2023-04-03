module fibonacci#(parameter N) (
input clk,
input rst,
input [4:0] in,
input wire start,
output reg ready,
output  reg done,
output [N-1:0]fib
);

localparam [2:0] IDEL = 3'b001,
		 OP   = 3'b010,
		 DONE = 3'b100; 

reg [N-1:0] t0_reg,t0_nxt,t1_reg,t1_nxt;
reg [4 :0] n_reg, n_nxt;
reg [2 :0] cur_state , nxt_state;



always @(posedge clk)
begin
if(rst)
	cur_state <= IDEL;
else
	cur_state <= nxt_state;
end

always @(posedge clk)
begin
if(rst) 
begin
	t0_reg <= 0;
	t1_reg <= 0;
	n_reg  <= 0;	
end
else 
 begin
	t0_reg <= t0_nxt;
	t1_reg <= t1_nxt;
	n_reg  <= n_reg;	
end
end

always @ *
 begin 
t0_nxt = t0_reg;
t1_nxt = t1_reg;
ready = 1'b0;
done = 1'b0;
n_nxt=n_reg;
nxt_state =cur_state;
 
case(cur_state)
IDEL : begin
	ready =1'b1;
	if(start)
		begin
		t0_nxt = 'd0;
		t1_nxt = 'd1;
		n_nxt = in;
		nxt_state = OP;
		end
	end
OP : begin
	if(n_reg==0)
	begin
		t1_nxt    = 'd0;
		nxt_state = DONE;
	
	end
	else if (n_reg == 1)
   		nxt_state = DONE;
	else
		begin		
		t1_nxt = t0_reg + t1_reg;
		t0_nxt = t1_reg;
		n_nxt = n_nxt - 5'd1;
		nxt_state = OP;
		end
end
DONE :
	begin
	   done = 1'b1;
		nxt_state = IDEL;
	end
endcase
end
assign fib = t1_reg;
endmodule

