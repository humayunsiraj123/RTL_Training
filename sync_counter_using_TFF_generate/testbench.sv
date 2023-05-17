// Testbench

module test;

  reg [9:0] SW;
  wire [9:0] LEDR;
  reg key;
	reg clk=0;
assign SW[9]=clk;

always #5 clk=~clk;

  // Generate Block, Verilog-2001
  LAB3 DUT (SW,LEDR,key);
	
always @(posedge clk)
$display("the value of counter %h", LEDR[7:0]);
  

  initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
   SW[8]=1;
	SW[7]=0;
 repeat(10) @(posedge clk);
SW[8]=0;
 repeat(10) @(posedge clk);
SW[7]=1;
repeat(100) @(posedge clk);
    $stop;
  end
 // always #5 SW[8]=~SW[8];
endmodule