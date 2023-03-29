// Code your testbench here
// or browse Examples
module tb_div_by_5;
  logic clk;
  logic rst_n;
  logic data_in;
  logic out;
  logic fsm2;
  
  
  div_by_5_simple DUT1(
	clk,
	rst_n,
	data_in,
  	fsm2);
  
   div_by_5 DUT2(
clk,
rst_n,
 data_in,
out);
  
  
  always #5 clk =~ clk;
  
  
  initial begin
     $dumpfile("dump.vcd");
    $dumpvars(0,tb_div_by_5);
  rst_n =1'b0;
    repeat(25) @(posedge clk);
  rst_n =1'b0;
   repeat(5) @(posedge clk); 
      data_in=1'b0;
      @(posedge clk);
	data_in=1'b1;
      @(posedge clk);
	data_in=1'b0;
      @(posedge clk);
	data_in=1'b1;
      @(posedge clk);
	data_in=1'b0;
      @(posedge clk);
	data_in=1'b1;
      @(posedge clk);
    data_in=1'b1;
      @(posedge clk);
      data_in=1'b1;
      @(posedge clk);
      data_in=1'b1;
      @(posedge clk);
      data_in=1'b0;
      @(posedge clk);
      repeat(100) 
        begin
		data_in=$random;
          @(posedge clk);
        end
    $stop;
      end            
endmodule
  
