// Code your design here
module fifo_model#(parameter WIDTH =8,DEPTH =64,ADDR=6)(
input clk,
  input rst_n,
  input read,
  input write,
  input [WIDTH-1:0]data_in,
  output [WIDTH-1:0]data_out,
  output full,
  output empty
);
  logic [WIDTH-1:0] memory [$:DEPTH-1];
 
  assign full = memory.size()==DEPTH;
  assign empty =memory.size()==0;
  always_ff (posedge clk)
    begin
  if(rst_n==0)
    memory ={};
  else
    begin
      if(read)
        data_out=memory.popback();
      if(write)
        memory.pushfront(data);
    end
    end
  endmodule
