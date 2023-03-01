module tb;
//1d,2d,3d packed array 
 //packed arraye are those whose size befire the name is defined as iteration based on size define prior to name or declaration
  bit [7:0] data;
  bit[3:0][7:0]data2;
  bit[2:0][3:0][7:0]data3;
  
  initial begin
    data=8'hA8;
    $display(".............1D packed array ............ ");
    for( int i =0;i<8;i++)
      begin
        $display("the bit at index %d is %b",i,data[i]);
        
      end
    
    
        data2=32'haedf_2bcd;          
                 $display(".............2D packed array ............ ");
    for( int i =0;i<4;i++)
      begin
        $display("the bit at index %d is %h",i,data2[i]);
      end
       data3=96'hface_cafe_aedf_2bcd_1234_5678;          
                 $display(".............3D packed array ............  %0h",data3);
    
                 foreach(data3[i])begin
                   $display("data3[%0d] = 0x%h",i,data3[i]);
                
    
                   foreach(data3[i][j])begin
                     $display ("data3[%0d][%0d]  = 0x%h",i,j,data3[i][j]);
                     
                   end
                 end
                 
                  end
                 endmodule
  
  
  
  