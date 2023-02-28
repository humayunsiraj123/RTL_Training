// Code your testbench here
// or browse Examples
module top;
  
  
enum {red,green,yellow,orange} colors;
  enum logic[3:0]{A=4'b0111,B,C=4'd11,D} alpha;
  enum {data[10]=100} data_list;
  
  
initial begin
  colors=orange;
  alpha=B;
 
  $display("the name is %s at in index %0d",alpha.name(),alpha.num());
  
  
  data_list=data_list.first();
  for(int i =0;i<20;i++)
    begin
      $display("the name is %s at in index %0d",data_list.name(),data_list);  
      data_list=data_list.next();   
    end
  alpha=alpha.first();
  for(int i=0;i<4;i++)
    begin
      $display("the name is %s at in index %0d",alpha.name(),alpha);
      alpha=alpha.next();
    end
  
end
endmodule
