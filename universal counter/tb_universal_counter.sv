`define period 10;
module tb_universal_counter;
localparam k=8; 
wire [k-1:0]count;
wire max,min;
reg clk,reset,up,en,down,preset,load;
reg [k-1:0]l_data;



universal_counter#(.N(8)) DUT (clk,up,down,reset,en,preset,load,l_data,count,max,min);


initial clk=1'b0;

always begin
#5 clk=~clk;
end

initial begin
en=1'b1;
up=1'b1;
down=1'b0;
preset=1'b0;
load=1'b0;
reset=1'b0;
repeat(5) begin
repeat(10) @(posedge clk);
en=1'b1;
up=1'b1;
down=1'b0;
preset=1'b0;
load=1'b0;
reset=1'b0;
end
repeat(10) @(posedge clk);

block(1'b1,1'b1,1'b0,1'b0,1'b0,1'b0, 10,'d0);

block(1'b1,1'b1,1'b0,1'b0,1'b0,1'b0, 10,'d0);

block(1'b1,1'b0,1'b1,1'b0,1'b0,1'b0, 10,'d0);


block(1'b1,1'b0,1'b0,1'b0,1'b1,1'b0, 10,'d50);
block(1'b1,1'b0,1'b0,1'b0,1'b1,1'b0, 10,'d10);


block(1'b1,1'b0,1'b0,1'b1,1'b0,1'b0, 10,'d50);
block(1'b1,1'b1,1'b0,1'b0,1'b0,1'b0, 10,'d0);
#1000 $stop;
end




initial begin

$monitor( "en = %b up = %b down = %b preset = %b  load = %b reset = %b  load_data %d ,count %d    max =%b  min = %b ",en,up,down,preset,load,reset,l_data,count,max,min);
end
  
task block ;
	input  sen_s,up_s,down_s,load_s,preset_s,reset_s;
	input ticks;
	input  [7:0] l_data_s;
	 begin
	up=up_s;
	 down=down_s;
	 en=sen_s;
	 preset=preset_s;
	 reset=reset_s;
	 load=load_s;	
	repeat(ticks) @(posedge clk);
	end
endtask


endmodule



