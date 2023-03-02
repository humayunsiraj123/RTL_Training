module tb;
  
  struct {
  logic write;
  logic read;
  logic [7:0] data_in;
  string driver;
   int test;
    byte symbol;
  }
  fifo_in;
  
  typedef struct {
  logic clk;
    logic arst;
    logic[2:0]control;
  } signal;
  
  signal signal1,signal2;

  typedef struct{
  logic write;
  logic read;
  logic [7:0] data_in;
  string driver;
   int test;
    byte symbol;  
  }
  fifo_struct;
  fifo_struct driver2,driver1 ;
  
  initial begin
     signal1='{1,0,3'd4};
  signal2='{0,1,3'd7};
  
    fifo_in = '{1,0,150,"test1",5,8'hff};
    $display("the struct is  %p",fifo_in);
 driver2 = '{0,1,50,"typdef2",8,8'hdd};
   driver1 = '{1,0,100,"typdef",10,8'haf};
    
    $display("..........................");
    $display("the struct typedef1 driver is  %p",driver1);
    $display("the struct with type def is  %p",driver2);
    $display("..........................");
    $display("the struct signal1  %p",signal1);
    $display("the struct signal2  %p",signal2);
    
  end
      
  endmodule
  