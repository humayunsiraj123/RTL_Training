// Code your testbench here
// or browse Exa



module tb;
  logic clk=1'b0;
  
  
  always #5 clk=~clk;
 
  Bus busIF(clk);
  
  
  dut DUT(busIF.DUT);
  
  initial begin
    
  busIF.enable =0;
    #10;
 	busIF.enable =1;
    #10;
    busIF.enable =0;
    #10;
     busIF.enable =1;
    busIF.enable =$urandom_range(0,1);
    #10;
 busIF.enable =$urandom_range(0,1);   
    #10;
    busIF.enable =$urandom_range(0,1);
    $monitor(" %t enable %b  data %d" ,,busIF.enable,busIF.data); 
  end
  
endmodule
  
 