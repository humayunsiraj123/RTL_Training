
module tb;
  
  bit write;
  bit read;
  logic[7:0] data_in;
  logic[7:0] data_out;
  logic arst;
  
  typedef struct { bit write;
           bit read;
           logic arst;
           logic[7:0] data_in;
           logic[7:0] data_out;
           
                 } driver_s;
 driver_s driver_struct_1,driver_struct_2;
  
  function driver_s driver(bit w,bit r,logic arst,logic[7:0] in,logic [7:0]out); 
  	driver.write=w;
    driver.read=r;
    driver.arst=arst;
    driver.data_in=in;
    driver.data_out=out;
	 endfunction 
  
  initial begin
    driver_struct_2=driver(1,1,1,8'haf,8'hff);
    
    $display("the struct signal1  %p",driver(1,1,1,8'haf,8'hff));
    $display("the data_out %h",driver_struct_2.data_out);
    $display("the struct signal2  %p",driver_struct_2);
    
  end
      
  endmodule
  
