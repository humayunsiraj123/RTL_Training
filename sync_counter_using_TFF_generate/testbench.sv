// Testbench

module test;

  reg [9:0] SW;
  wire [9:0] LEDR;
  reg key;

  // Generate Block, Verilog-2001
  LAB3 DUT (SW,LEDR,key);

  

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
    #10;
    SW[9]=1'b0;
    SW[7]=1'b0;
    
    #10;
    SW[9]=1'b1;
    SW[7]=1'b0;
    #10;
    SW[9]=1'b0;
    SW[7]=1'b1;
    #10;
     SW[9]=1'b0;
     SW[7]=1'b1;
    
    #10;
   SW[9]=1'b0;
  SW[7]=1'b1;
    #10;
   SW[9]=1'b1;
   SW[7]=1'b1;
    
    
    $stop;
  end
  always #5 SW[8]=~SW[8];
endmodule