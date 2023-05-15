module tb;
  
  
initial begin
  for(int i =0;i<10;i++)
    begin
      automatic string id = $sformatf("%0d",i);//int to string conv
      automatic string name = {id," ", id};//string concatenation
      $display(" Name  %0s", name);
    end 
  
  endmodule
