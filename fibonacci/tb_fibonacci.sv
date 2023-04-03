
module tb_fibonacci;
 logic  clk =1'b0;
logic rst ;
logic [4:0] in;
logic start;
logic ready;
logic done;
logic[9:0]fib;

fibonacci#(.N(10)) fibs(clk,rst,in,start,ready,done ,fib);


always #5 clk= ~clk;

initial begin 
 $dumpfile("dump.vcd");
$dumpvars(0,tb_fibonacci);
rst=1'b1;
repeat(25)@(posedge clk);
rst=1'b0;

in =$urandom_range('h1,'hff);
start = 1'b1;
repeat(1)@(posedge clk);

repeat(100)  begin

//in =$urandom_range('h1,'hff);

start =$urandom_range('h0,'h1);

$display("the value of fibonacci sum is  %d " ,fib);
repeat(1)@(posedge clk);
end

$stop;

end

endmodule