// Code your design here
interface Bus(input clk);
  logic [7:0]data;
  logic enable;
  
  
  modport TB( input data,clk,output enable);
  	
  modport DUT (output data,input enable,clk);
endinterface


module dut(Bus busIF);
  always @ (posedge busIF.clk)
    if(busIF.enable)
      busIF.data<='hff;
  	else
      busIF.data<=0;
endmodule


