module tb;
//1d,2d,3d packed array 
 //packed arraye are those whose size befire the name is defined as iteration based on size define prior to name or declaration
  byte  data[2][4];
  int arry[];
  int size_A;
  initial begin
    arry=new[5];
    arry='{2,4,6,7,3};
    
    foreach(data[i])
      foreach(data[i][j])
        begin
          data[i][j]=$random;
          $display("data[%0d][%0d] = 0x%0h",i,j,data[i][j]);
                 
                  end
    $display("Dynamic array");
    foreach(arry[i])
      $display("data[%0d]= 0x%0h",i,arry[i]);
 size_A =arry.size();
    
    arry=new[10](arry);
$display("DYnamic array");
    for (int k=size_A;k<arry.size;k++)
      arry[k]=$urandom_range('ha,'hff);
    
    foreach(arry[i])
      $display("data[%0d]= 0x%0h",i,arry[i]);
    
          
    $display("data %p",data);end
                 endmodule
  
  
  
  