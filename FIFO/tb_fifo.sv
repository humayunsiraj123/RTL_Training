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
  logic [WIDTH-1:0] data_out_m;
  logic [WIDTH-1:0] data_out_d; 
  logic write ;
  logic read;
  logic writ_m ;
  logic read_m;
  logic writ_m_d ;
  logic read_m_d;
  int count_fdata,count_tdata,count_ffull,count_fempty,count_tempty,count_tfull;
 
  always #5 clk=~clk;
  
   
  fifo fifo1(clk,rst_n,read,write,data_in,data_out,full,empty);
  fifo_model fm(clk,rst_n,write,data_in,data_out_m,full_m,empty_m);
  always_ff (posedge clk)
    begin
      data_out_d = data_out_m;
      write_m_d  = write_m;
      read_m_d   = read_m
    end
  
  
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
        delay(5);
        fork 
          repeat(100) begin driver_random(count_tdata,count_tfull,count_fempty,count_fdata,count_tful,count_fempty);
            delay(1);
          end
          forever begin
            monitor();
            delay(1)
          end
        join_any
        $display("Result");
        $display("count_tdata = %d,count_tfull %d ,count_fempty = %d ,count_fdata = %d,count_tful = %d,count_fempty =%d ",count_tdata,count_tfull,count_fempty,count_fdata,count_tful,count_fempty);
      end
    delay(5);
    $stop;
  end
  
  function void result();
    $display("Read  %b  Wriite %b  srst_n %b  data_in %b",read,write,rst_n,data_in);
    $display("empty    %b  full   %b             data_out   %b",empty,full,data_out); 
    $display("empty_m  %b  full_m %b             data_out_m %b",empty_m,full_m,data_out_m);
  endfunction
      task monitor (output int t_data,t_full,t_empty,f_data,f_full,f_empty);
        assert(data_out == data_out_m) begin ++t_data; $display("Succes match  expectecd  %h  obtained %h ",data_out_m,data_out);end
        else begin ++f_data;                           $display("Failed match  expectecd  %h  obtained %h ",data_out_m,data_out);end
        assert(empty == empty_f) begin ++t_full;        $display("Succes match  expectecd %h  obtained %h ",empty_m,empty);end
        else begin ++t_empty;                           $display("Failed match  expectecd %h  obtained %h ",empty_m,empty);end
        assert(data_out == data_out_m) begin ++t_full; $display("Succes match  expectecd  %h  obtained %h ",full_m,full);end
        else begin ++f_full;                           $display("Failed match  expectecd  %h  obtained %h ",full_m,full);end
      endtask
   task driver_random;
   rst_n=random();
   read=random();
   write =random();
   data_in=$urandom_range('h00,'hffff);
 endtask
  
  
  task driver(logic x,y,z,logic [WIDTH-1:0] data);
   rst_n=x;
   read=y;
   write =z;
   data_in=data;
 endtask
 
  
  
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
