
module counter#(parameter W=8)(
  input clk,
  input srst_n, 
  input load,
  input down,
  input up,
  input [W-1:0]data,
  output logic rollover,
  output logic [W-1:0] count);
  
  
  always_ff @(posedge clk)
    if(~srst_n)
      count<=0;
  	else begin
      if(load)
        count<=data;
      else begin
  	if(up)
    	count<=count+1;
  	if(down)
    	count<=count-1;
    end
      
  end
 assign  rollover = &count;
endmodule 


interface counter_if#(parameter W=8)(input bit clk);
  logic srst_n;
  logic load;
  logic down;
  logic up;
  logic  [W-1:0]data;
  logic rollover;
  logic [W-1:0]count;
endinterface



module counter_wif#(parameter W=8)(counter_if c_if);
always_ff @(posedge c_if.clk)
begin
if(~c_if.srst_n)
c_if.count <=0;
else
	if(c_if.load)
		c_if.count<=c_if.data;
	else
		if(c_if.up && ~c_if.down)
			c_if.count<=c_if.count+1;
		if(~c_if.up && c_if.down)
			c_if.count<=c_if.count-1;
end

assign c_if.rollover =& c_if.count;
endmodule


