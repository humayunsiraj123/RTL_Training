// Code your testbench here
// or browse Examples
interface APB_int;
  logic [31:0]addr;
  logic [7:0]r_data;
  logic [7:0]w_data;
  logic selx,enable,write,read;
endinterface

module master(APB_int com_bus,logic clk,reset);
endmodule 

module slave(APB_int  com_bus,logic clk,reset);
endmodule

module top();
  APB_int bus ();
  master master(.com_bus(bus),.clk(clk),.reset(reset));
  slave  slave (.com_bus(bus),.clk(clk),.reset(reset));
endmodule