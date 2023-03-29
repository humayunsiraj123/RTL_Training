// Code your testbench here
// or browse Examples


// Code your testbench here
// or browse Examples

module tb_btn_debounce;
  logic clk =1'b0;
  logic reset;
  logic btn;
  logic out;
  
  
  btn_debounce dut(clk,reset,btn,out);
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("abc.vcd");
    $dumpvars(0);
    reset =1'b1;
    repeat(25) @(posedge clk);
    reset =1'b0;
    repeat(5) @(posedge clk);
btn =1'b1;
	repeat(20) @(posedge clk);
    
repeat(100) begin
      btn =$random();
    end
  end
    endmodule
