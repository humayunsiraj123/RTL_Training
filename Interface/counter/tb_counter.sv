// Code your testbench here
// or browse Exa



module tb_counter;
  logic clk=1'b0;
  
  
  always #5 clk=~clk;
  counter_if c_if(clk);
  _if.srst_n=c_if.srst_n;
  _if.load=c_if.load;
  _if.up=c_if.up;
  _if.down=c_if.down;
  _if.data=c_if.data;
  
  
  
  
  
counter_if _if(clk);
/ counter DUT(.clk(_if.clk),
                   .srst_n(_if.srst_n),
              .load(_if.load),
                   .down(_if.down),
                   .up(_if.up),
                   .data(_if.data),
                   .rollover(_if.rollover),
                   .count(_if.count)
                  );

counter_wif dut_wif(c_if);
  
  
  
  always @(posedge clk)
  $display(" srst_n %d up %d  down %b , load %b data %h rollover %b count %d ",c_if.srst_n,c_if.up,c_if.down,c_if.load,c_if.data,c_if.rollover, c_if.count);
  
  initial begin
    $dumpfile("testbench.vcd");
    $dumpvars(1,tb_counter);
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
    c_if.data='haa;
    repeat(2)@ (posedge clk);
    c_if.up= 0;
    c_if.down=0;
    c_if.load=1;
    c_if.data='haa;
    
    repeat(20)@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.load=$random();
    c_if.data=$random();
     repeat(20)@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.load=$random();
    c_if.data=$random();
      repeat(20)@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.data=$random();
    c_if.load=$random();
  repeat(20)@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.data=$random();
    c_if.load=$random();
      repeat(20)@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.load=$random();
    c_if.load=$random();
      repeat(20)@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.data=$random();
    c_if.load=$random();
  repeat(20)@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.load=$random();
    c_if.data=$random();
     repeat(20)@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.load=$random();
    c_if.data=$random();
      repeat(20)@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.load=$random();
    c_if.data=$random();
  repeat(20)@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.load=$random();
    c_if.data=$random();
      repeat(20)@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.load=$random();
    c_if.data=$random();
      repeat(20)@ (posedge clk);
    c_if.up=$random();
    c_if.down=$random();
    c_if.load=$random();
    c_if.data=$random();
  $stop();
  end
  
  
endmodule
  
 
