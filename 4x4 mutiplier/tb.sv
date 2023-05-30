
// Code your testbench here
// or browse Examples
module tb;
  logic [3:0]A;
  logic [3:0]B;
  logic [7:0]M;
  
  multiply_4by4 m1(A,B,M);
  
  initial
    begin
    A=2;
      B=5;
      #10;
       $display("the value of A %d *  B %d  = %d  ",A,B,M);
       A=2;
      B=5;
      $display("the value of A %d *  B %d  = %d  ",A,B,M);
      #10;
       A=4;
      B=2;
      $display("the value of A %d *  B %d  = %d  ",A,B,M);
      #10;
       A=6;
      B=8;
      $display("the value of A %d *  B %d  = %d  ",A,B,M);
      #10;
       $display("the value of A %d *  B %d  = %d  ",A,B,M);
    end
endmodule
    
    