// Code your testbench here
// or browse Examples
module tb_fifo;
  parameter WIDTH=8, DEPTH=64;
  logic clk=1'b0;
  logic rst_n;
  logic full ;
  logic empty;
  logic [WIDTH-1:0] data_in;
  logic [WIDTH-1:0] data_out;
  logic write ;
  logic read;
 
  always #5 clk=~clk;
  
   
  fifo fifo1(clk,rst_n,read,write,data_in,data_out,full,empty);
  initial begin  
     $dumpfile("dump.vcd");
    $dumpvars(1);
  rst_n=1'b0;
    delay(25);
   rst_n=1'b1;
    delay(5);
    read=1'b0;
    write=1'b1;
    data_in='hff;
    result();
    delay(2);
     data_in='haa;
    result();
    delay(2);
     data_in='hcc;
    result();
    delay(2);
     data_in='h11;
    result();
    delay(2);
     data_in='h1f;
    result();
    delay(2);
  	result();
    read=1'b1;
    delay(2);
  	result();
    delay(2);
  	result();
    delay(2);
  	result();
    delay(2);
  	result();
    repeat(10)
      begin
      delay(2);
      result();
    
      randomizer();
      end
    delay(5);
    $stop;
  end
  
  function void result();
    $display("Read  %b  Wriite %b  srst_n %b  data_in %b",read,write,rst_n,data_in);
    $display("empty  %b  full %b             data_out %b",empty,full,data_out); 
  endfunction
  
  task delay(int x);
    repeat(x) @(posedge clk);
    endtask
  task randomizer();    
    write=randomize();
    read=randomize();
    rst_n=randomize();
    data_in=$urandom_range('h00,'hff);
  endtask
  
  task driver(logic x,y,z,[WIDTH-1:0] data);
    write =x;
    read=y;
    rst_n=z;
    data_in=data;
  endtask
  
endmodule
