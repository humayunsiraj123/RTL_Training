// Code your testbench here
// or browse Exa



module tb_counter;
  logic clk=1'b0;
  
  
  always #5 clk=~clk;
  counter_if c_if(clk);
  counter DUT(.clk(c_if.clk),
                   .srst_n(c_if.srst_n),
                   .load(c_if.load),
                   .down(c_if.down),
                   .up(c_if.up),
                   .data(c_if.data),
                   .rollover(c_if.rollover),
                   .count(c_if.count)
                  );
  
  
  
  always @(posedge clk)
  $display(" srst_n %d up %d  down %b , load %b data %h rollover %b count %d ",c_if.srst_n,c_if.up,c_if.down,c_if.load,c_if.data,c_if.rollover, c_if.count);
  
  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(0,tb_counter);
  	c_if.srst_n=0;
    repeat(10)@ (posedge clk);
    c_if.srst_n=1;
    repeat(2)@ (posedge clk);
    c_if.up=1;
    repeat(10)@ (posedge clk);
 	c_if.up= 0;
    c_if.down=1;
    repeat(5)@ (posedge clk);
    c_if.up= 0;
    c_if.down=0;
    c_if.load=1;
    c_if.load='haa;
    repeat(2)@ (posedge clk);
    c_if.up= 0;
    c_if.down=0;
    c_if.load=1;
    c_if.load='haa;
    
    repeat($urandom_range(1,20))@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.load=$random();
    c_if.load=$random();
     repeat($urandom_range(1,20))@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.load=$random();
    c_if.load=$random();
     repeat($urandom_range(1,20))@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.load=$random();
    c_if.load=$random();
  $stop();
  end
  
  
endmodule
  
 
