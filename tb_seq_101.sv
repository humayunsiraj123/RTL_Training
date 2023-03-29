module tb_seq_101;
  logic clk;
  logic rst_n;
  logic data_in;
  logic out;
  
  
  seq_101_detect DUT(clk,rst_n,data_in,out);
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb_seq_101);
  rst_n=1'b0;
  repeat(25) @(posedge clk);
  rst_n=1'b1;
  repeat(5) @(posedge clk);
    repeat(100) begin 
    data_in =$random;
      if( out === 1)
        $display("the output is 1 at time %0t",$time);
      @(posedge clk);
    end
    $stop;
  end
endmodule
