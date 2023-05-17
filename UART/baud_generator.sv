// Code your design here
module baud_generator#(parameter baud_rate=90)(
input clk,
output logic tick);


parameter FREQ =1000;//100Mhz
parameter BAUD =baud_rate;
parameter BAUD_RATE=FREQ/BAUD;
  reg [10:0] counter =0;


always_ff@(posedge clk)
  if(counter==BAUD_RATE+1)
    counter<=0;
  else
 	 counter<=counter+1;

always_comb
  tick = (counter==BAUD_RATE) ? 1:0;
endmodule

module tb;

logic clk =0;
logic tick ;
baud_generator#(90) dut(clk,tick);

always #1 clk=~clk;
 

  always @(posedge clk)
    if(tick)
      $display("%t tick =1",$time());
initial begin 
  $dumpfile("dump.vcd");
  $dumpvars(0,tb);

repeat(1000) @(posedge clk);
  
$stop();
end
endmodule
