module tb;
  string name[$];
  int list[$];
  logic [7:0] data[$:127];
  int q1 [$]={1,2,4,5,6,7,8,9};
  int q2 [$];
  int temp;
  
  initial begin
    string cat[$]={"tabby","snow","tuna"};
    foreach(cat[i])
      $display("%0d , %0s ",i,cat[i]);
  
    $display( "%0p" ,cat);
    cat=cat[0:$-1];
    $display( "%0p" ,cat);
    
    $display("the size is %d",cat.size());
    cat.insert(2,"fluffy");
    $display("the insert fluffy at 2 is %p",cat);
 
    cat.push_back("siber");
    $display("the push_back is %p",cat);
    
    cat.push_front("turkey");
    $display("the push_front is %p",cat);
    
    $display("the pop_front is %s %p",cat.pop_back(),cat);
    $display("the pop_back is %s %p",cat.pop_front(),cat);
    
    
  end
      
  endmodule
  
