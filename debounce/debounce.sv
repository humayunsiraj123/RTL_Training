
// Code your design here
module debounce#(parameter DELAY=100)(
  input clk,
  input btn,
  output logic btn_out);
  
  logic [ $clog2(DELAY)-1:0] count;
  logic prev;
  always_ff @(posedge clk)begin
    if(prev != btn)
    begin  prev<=btn;
  	  count <=0; end
  else if( count== DELAY) btn_out<=prev;
  else 
      count<=count +1;
end
endmodule