// Code your design here
module fifo#(parameter WIDTH =8,DEPTH =64,ADDR=$clog(DEPTH)(
input clk,
  input rst_n,
  input read,
  input write,
  input [WIDTH-1:0]data_in,
  output [WIDTH-1:0]data_out,
  output full,
  output empty
);
  logic [WIDTH-1:0] memory [0:DEPTH-1];
  logic r_reg,r_next,r_prt;
  logic w_reg,w_next,w_prt;
  logic full_reg,full_next;
  logic empty_reg,empty_next;
  logic read_enble, write_enble;
  
 assign write_enable = write & ~full_reg;
  
  always @(posedge clk)
      if(write_enable)
        memory[w_reg]=data_in;
  
  assign data_out=memory[r_reg];
  
  
  always@(posedge clk)
    begin
      if(~rst_n)
        begin
          r_reg<=0;
          w_reg<=0;
          full_reg<=0;
          empty_reg<=0;
        end
      else
        begin
          r_reg<=r_next;
          w_reg<=w_next;
          full_reg<=full_next;
          empty_reg<=empty_next;
        end
    end
  
  
  always @(*)
  begin
    r_next=r_reg;
  	w_next=w_reg;
  full_next=full_reg;
  empty_next=empty_reg;
    case({write,read})
      2'b10:
        if(~full_reg)
          begin
          w_next=w_reg==DEPTH?0:w_reg+1;
            empty_next=1'b0;
            if(w_next =={ADDR{1'b1}})
              full_next=1'b1;
          end
      2'b01:
      if(~empty_reg)
        begin
  		r_next=r_reg==DEPTH?0:r_reg+1;
          full_next=1'b0;
          if(r_next=={ADDR{1'b0}})
            empty_next=1'b1;
        end
      2'b11:
        begin
        w_next=w_reg;
          if(~empty_reg)
            r_next=r_reg;
        end
    endcase
  end
    assign full=full_reg;
    assign empty=empty_reg;
  endmodule
        
