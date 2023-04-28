
// Code your testbench here
// or browse Examples
  // Code your testbench here
// or browse Examples
module tb_synchronizer;
  logic slow_clk =0;
  logic fast_clk ;
  logic slow_os;
  logic fast_os;
  
  
 synchronizer dut(fast_clk,slow_clk,fast_os,slow_os);
  
  initial begin
    #2 fast_clk =0;
    forever begin 
    #5 fast_clk =0;
    #5 fast_clk =1;
    end 
    end
  
  always #10 slow_clk =~slow_clk;
  
  always @(posedge fast_clk)
    begin
      repeat($urandom_range('h5,'h14)) @(posedge fast_clk);
      fast_os =1;
      @ ( posedge fast_clk) fast_os =0;
    end
    
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1,tb_synchronizer);
    repeat(500) @(posedge slow_clk);
  end
    endmodule
    
    