module tb;
  bit [7:0] data;
   //dynamic array
  bit [7:0]data1;
  

  initial begin
    data=8'hA2;
//wrintg values formn data   
    for(int i=0; i < $size(data) ;i++)begin 
      data1[i]=data[i];
      $display("the value  on index %d is %b",i,data[i]);
    end
    
    for(int i=0; i < $size(data1);i++)begin 
      $display("the value  on index %d is %b = %b",i,data1[i],data[i]);
    end

  end
    endmodule
    