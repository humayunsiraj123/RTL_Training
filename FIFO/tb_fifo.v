module tb_fifo;
reg clk,wr,rd,reset;
reg [7:0] data_in;
wire [7:0] data_out;
wire fifo_full,fifo_empty,fifo_thresh,fifo_overflow,fifo_underflow;




FiFo dut (data_out,data_in,fifo_full,fifo_empty,fifo_thresh,fifo_overflow,fifo_underflow,clk,reset,wr,rd);

always
begin 
#5 clk=1'b1;
#5 clk=1'b0;
end

initial begin

data_in=8'd128;
wr=1;
reset=0;
rd=0;

#100;
data_in=8'd128;
wr=0;
reset=0;
rd=1;
#100;
data_in=8'd255;
wr=1;
reset=0;
rd=0;
#100;
data_in=8'd128;
wr=0;
reset=1;
rd=1;
#100;
data_in=8'd128;
wr=0;
reset=0;
rd=1;
#100;
repeat(5) 
begin
data_in=$random;
wr=$random;
reset=0;
rd=~wr;
#100;
end

end

initial begin
$monitor ("data_in %d   wr =%b rd =%b reset =%b  Data_out = %d  overflow %b  underflow %b full %b empty %b threshold %b " ,data_in,wr,rd,reset,data_out,fifo_overflow,fifo_underflow,fifo_full,fifo_empty,fifo_thresh );
end
endmodule
