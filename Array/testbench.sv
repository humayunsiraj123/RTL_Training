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
    $display("the facotrial of %d  is %d by recursion",8,factorial(8),fact(8));

  end
  function int factorial(int n); 
    int result = 1;
    repeat(n)
      result = result *(n--);
    return result;
    endfunction
  
  function int fact(int n);
    if(n>0)
      return n*fact(n-1);
    else
      return 1;
  endfunction
  
    endmodule
   
