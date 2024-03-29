module FiFo(data_out,data_in,fifo_full,fifo_empty,fifo_thresh,fifo_overflow,fifo_underflow,clk,reset,wr,rd);
input clk,rd,wr,reset;
output fifo_full,fifo_empty,fifo_thresh,fifo_overflow,fifo_underflow;
input [7:0]data_in;
output [7:0]data_out;
wire [4:0]wptr,rptr; 
wire fifo_we,fifo_rd;
memory_array ma(data_out,data_in,clk,fifo_we,wptr,rptr);
read_ptr rp(rptr,rd,fif_rd,fifi_empty,clk,reset);
status_signal ss(fifo_full,fifo_empty,fifo_thresh,fifo_overflow,fifo_underflow,rd,wr,fifo_rd,fifo_we,rptr,wptr,clk,reset);
write_ptr  wp(wptr,fifo_we,wr,fifo_full,clk,reset);
endmodule


module memory_array(data_out,data_in,clk,fifo_we,wptr,rptr);
input [7:0]data_in ;
input clk,fifo_we;
input [4:0]wptr,rptr;
output [7:0]data_out;
reg [7:0] memory [15:0];
always @(posedge clk)
begin
if (fifo_we)
	memory[wptr[3:0]] <=data_in;
end
assign data_out = memory[rptr[3:0]] ;

endmodule


module read_ptr(rptr,rd,fifo_rd,fifo_empty,clk,reset);
input clk,reset,fifo_empty,rd;
output reg [4:0]rptr;
output fifo_rd;

assign fifo_rd =~fifo_empty& rd;

always @(posedge clk)
begin
if(reset)
rptr<=5'd0;
else if (fifo_rd)
rptr<=rptr +5'd1;
else
rptr<=rptr;
end
endmodule

module status_signal(fifo_full,fifo_empty,fifo_thresh,fifo_overflow,fifo_underflow,rd,wr,fifo_rd,fifo_we,rptr,wptr,clk,reset);
input rd,wr,fifo_we,clk,reset,fifo_rd;
input [4:0]rptr ,wptr;
output  reg fifo_full,fifo_empty,fifo_thresh,fifo_overflow,fifo_underflow;
reg fbit_comp,underflow,overflow, equal;
wire [4:0]pointer_result;

//assign fbit_comp=wptr[4]^rptr[4];
//assign equal =(wptr[3:0]-rptr[3:0]) ? 0:1;
//assign overflow=fifo_full&wr;
//assign underflow=fifo_empty&rd;
//assign equal = wptr[3:0] ;
assign pointer_result=wptr[4:0]-rptr[4:0];

always @ *
begin
 fbit_comp=wptr[4]^rptr[4];
equal =(wptr[3:0]-rptr[3:0]) ? 0:1;

fifo_full=fbit_comp & equal;
fifo_empty =~fbit_comp&equal;
fifo_thresh=(pointer_result[4]||pointer_result[3])?1:0;
overflow=fifo_full&wr;
underflow=fifo_empty&rd;
end


always @(posedge clk or negedge reset)
begin
if(reset)
fifo_overflow<=0;
else if((overflow==1) && (fifo_rd==0))
fifo_overflow<=1;
else if (fifo_rd)
	fifo_overflow<=0;
else
fifo_overflow <=fifo_overflow;
end

always @ (posedge clk or negedge reset)
begin
if(reset)
fifo_underflow<=0;
else if (underflow==1 && fifo_we==0)
fifo_underflow<=1;
else if (fifo_we)
fifo_underflow<=0;
else
fifo_underflow<=fifo_underflow; 
end
endmodule
module write_ptr(wptr,fifo_we,wr,fifo_full,clk,reset);
input wr,fifo_full,clk,reset;
output reg [4:0] wptr;
output fifo_we;
assign fifo_we=~fifo_full&wr;
always @ (posedge clk or negedge reset)
begin
if(reset)
wptr<=5'd0;
else if (fifo_we)
wptr<=wptr+5'd1;
else
wptr<=wptr;
end
endmodule
 

