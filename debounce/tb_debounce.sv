
// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
 module tb_debounce;
   logic clk=0;
   logic btn;
   logic btn_out;
   
   debounce dut(clk,btn,btn_out);
   
   always clk =~ clk;
   
   initial begin
     $dumpfile("dump.vcd");
     $dumpvars(1,tb_debounce);
     repeat(100)
       begin
         btn=$random();
         @(posedge clk);
       end
     end
 endmodule

