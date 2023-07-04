module tb;
//1d,2d,3d packed array 
 //packed arraye are those whose size befire the name is defined as iteration based on size define prior to name or declaration
  bit [7:0] data;
  bit[3:0][7:0]data2;
  bit[2:0][3:0][7:0]data3;
  bit[31:0]data4;
  bit[3:0][7:0]data5;
  bit[3:0][7:0]data6;
  //assign data5 = data4;
  parameter x=8;
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
                 
    data4=32'hff_aa_bb_cc;//we can use complete pack to like m*n or [m:0][n:0] is same
    data5=32'd12_23_45_65;
    
    data6={x'(data4),x'('hfff)};//static typecasting 
                $display(".............2D packed array ............ ");
    for( int i =0;i<4;i++)
      begin
        $display("the bit at index %d is %h",i,data5[i]);
      end
    foreach(data5[i])
      $display("the bit at index %d is %d",i,data5[i]);
    
    foreach(data6[k])
      $display("the bit at index %d is %h",k,data6[k]);
      
      
    
    
                  end
 
endmodule
  
  
  
  
