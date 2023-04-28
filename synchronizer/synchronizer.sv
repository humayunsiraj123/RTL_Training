
// Code your design here
// Code your design here
// Code your design here
module synchronizer#(parameter CYCLE=2
                    )(
  			input src_clk,
  			input dst_clk,
  			input src_sig,
  			output dst_sig);
  
  parameter DLY= CYCLE+1;
  
  logic [DLY-1:0] sample={DLY{1'b0}} ;
  logic [DLY-1:0] src_sample =0;//{DLY{1'b0}};
  logic [DLY-1:0] dst_sample =0;//{DLY{1'b0}};
  logic src_sig_sample =0;
  logic dst_sig_sample=0;
  always_ff @(posedge src_clk)
    if(src_sig)
      src_sig_sample<=~src_sig_sample;
  always_ff @(posedge dst_clk)
  	dst_sample <= {dst_sample,src_sig_sample};
  always_ff @(posedge dst_clk)
    	dst_sig_sample<= ^dst_sample[DLY-1-:2];
  assign dst_sig = dst_sig_sample;
endmodule
  