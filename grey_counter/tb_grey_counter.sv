
// Code your testbench here
// or browse Examples

// Code your testbench here
// or browse Examples
module tb_grey_counter;
parameter WIDTH =5;
  logic clk=1;
  logic srst_n;
  logic [2:0] count;
logic [WIDTH-1:0] g_count;
  
  grey_counter dut(clk,srst_n,count);
  grey_count#(.N(WIDTH)) dut1(clk,srst_n,g_count);
  always #5 clk=~clk;
  
  always @(posedge clk)
    $display("the value of coutner %b , g_count %b",count,g_count);
  initial begin
    srst_n=0;
    repeat(10) @(posedge clk);
    srst_n=1;
    repeat(20) @(posedge clk);
    srst_n=0;
    
    repeat(2) @(posedge clk);
    srst_n=1;
    repeat(30) @(posedge clk);
  end
endmodule
  