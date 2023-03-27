// Code your testbench here
// or browse Examples

module testbench;
  logic clk =1'b0;
  logic reset;
  logic btn;
  logic out;
  
  
  btn_debounce(clk,reset,btn,out);
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("abc.vcd");
    $dumpvars(0,a);
    reset =1'b1;
    repeat(25) @(posedge clk);
    reset =1'b0;
    repeat(5) @(posedge clk);
    repeat(10000) begin
      btn =$random;
    end
  end
    endmodule