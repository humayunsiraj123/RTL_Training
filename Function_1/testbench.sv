//function1
  bit [7:0]data1;
  

  initial begin
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
   