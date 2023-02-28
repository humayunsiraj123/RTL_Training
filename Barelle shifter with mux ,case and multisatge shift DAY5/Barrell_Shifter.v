module Barrell_Shifter  # (parameter N=8) (
  	input  [N-1:0] data    ,
	input  [2  :0] shifter ,
	output [N-1:0] result
	);
	wire   [N-1:0] x , y  , w ;
// 4bit right shift ........................
mux_2to1 m1 (.z (x[7]) , .s(shifter[2]) , .a(data[7]) , .b(1'b0   ));
mux_2to1 m2 (.z (x[6]) , .s(shifter[2]) , .a(data[6]) , .b(1'b0   ));
mux_2to1 m3 (.z (x[5]) , .s(shifter[2]) , .a(data[5]) , .b(1'b0   ));
mux_2to1 m4 (.z (x[4]) , .s(shifter[2]) , .a(data[4]) , .b(1'b0   ));
mux_2to1 m5 (.z (x[3]) , .s(shifter[2]) , .a(data[3]) , .b(data[7]));
mux_2to1 m6 (.z (x[2]) , .s(shifter[2]) , .a(data[2]) , .b(data[6]));
mux_2to1 m7 (.z (x[1]) , .s(shifter[2]) , .a(data[1]) , .b(data[5]));
mux_2to1 m8 (.z (x[0]) , .s(shifter[2]) , .a(data[0]) , .b(data[4]));

// 2bit right shift .......................

mux_2to1 m9  (.z (y[7]) , .s(shifter[1]) , .a(x[7]) , .b(1'b0));
mux_2to1 m10 (.z (y[6]) , .s(shifter[1]) , .a(x[6]) , .b(1'b0));
mux_2to1 m11 (.z (y[5]) , .s(shifter[1]) , .a(x[5]) , .b(x[7]));
mux_2to1 m12 (.z (y[4]) , .s(shifter[1]) , .a(x[4]) , .b(x[6]));
mux_2to1 m13 (.z (y[3]) , .s(shifter[1]) , .a(x[3]) , .b(x[5]));
mux_2to1 m14 (.z (y[2]) , .s(shifter[1]) , .a(x[2]) , .b(x[4]));
mux_2to1 m15 (.z (y[1]) , .s(shifter[1]) , .a(x[1]) , .b(x[3]));
mux_2to1 m16 (.z (y[0]) , .s(shifter[1]) , .a(x[0]) , .b(x[2]));


// 1bit right shift .......................

mux_2to1 m17 (.z (w[7]) , .s(shifter[0]) , .a(y[7]) , .b(1'b0));
mux_2to1 m18 (.z (w[6]) , .s(shifter[0]) , .a(y[6]) , .b(y[7]));
mux_2to1 m19 (.z (w[5]) , .s(shifter[0]) , .a(y[5]) , .b(y[6]));
mux_2to1 m20 (.z (w[4]) , .s(shifter[0]) , .a(y[4]) , .b(y[5]));
mux_2to1 m21 (.z (w[3]) , .s(shifter[0]) , .a(y[3]) , .b(y[4]));
mux_2to1 m22 (.z (w[2]) , .s(shifter[0]) , .a(y[2]) , .b(y[3]));
mux_2to1 m23 (.z (w[1]) , .s(shifter[0]) , .a(y[1]) , .b(y[2]));
mux_2to1 m24 (.z (w[0]) , .s(shifter[0]) , .a(y[0]) , .b(y[1]));

assign result=w;

endmodule


module Barrell_Shifter_rotate  # (parameter N=8) (
  	input  [N-1:0] data    ,
	input  [2  :0] shifter ,
	output [N-1:0] result
	);
	wire   [N-1:0] x , y  , w ;
// 4bit right shift ........................
	mux_2to1 m1 (.z (x[7]) , .s(shifter[2]) , .a(data[7]) , .b(data[3]));
	mux_2to1 m2 (.z (x[6]) , .s(shifter[2]) , .a(data[6]) , .b(data[2]));
	mux_2to1 m3 (.z (x[5]) , .s(shifter[2]) , .a(data[5]) , .b(data[1]));
	mux_2to1 m4 (.z (x[4]) , .s(shifter[2]) , .a(data[4]) , .b(data[0]));
mux_2to1 m5 (.z (x[3]) , .s(shifter[2]) , .a(data[3]) , .b(data[7]));
mux_2to1 m6 (.z (x[2]) , .s(shifter[2]) , .a(data[2]) , .b(data[6]));
mux_2to1 m7 (.z (x[1]) , .s(shifter[2]) , .a(data[1]) , .b(data[5]));
mux_2to1 m8 (.z (x[0]) , .s(shifter[2]) , .a(data[0]) , .b(data[4]));

// 2bit right shift .......................

	mux_2to1 m9  (.z (y[7]) , .s(shifter[1]) , .a(x[7]) , .b(x[1]));
	mux_2to1 m10 (.z (y[6]) , .s(shifter[1]) , .a(x[6]) , .b(x[0]));
mux_2to1 m11 (.z (y[5]) , .s(shifter[1]) , .a(x[5]) , .b(x[7]));
mux_2to1 m12 (.z (y[4]) , .s(shifter[1]) , .a(x[4]) , .b(x[6]));
mux_2to1 m13 (.z (y[3]) , .s(shifter[1]) , .a(x[3]) , .b(x[5]));
mux_2to1 m14 (.z (y[2]) , .s(shifter[1]) , .a(x[2]) , .b(x[4]));
mux_2to1 m15 (.z (y[1]) , .s(shifter[1]) , .a(x[1]) , .b(x[3]));
mux_2to1 m16 (.z (y[0]) , .s(shifter[1]) , .a(x[0]) , .b(x[2]));


// 1bit right shift .......................

	mux_2to1 m17 (.z (w[7]) , .s(shifter[0]) , .a(y[7]) , .b(x[0]));
mux_2to1 m18 (.z (w[6]) , .s(shifter[0]) , .a(y[6]) , .b(y[7]));
mux_2to1 m19 (.z (w[5]) , .s(shifter[0]) , .a(y[5]) , .b(y[6]));
mux_2to1 m20 (.z (w[4]) , .s(shifter[0]) , .a(y[4]) , .b(y[5]));
mux_2to1 m21 (.z (w[3]) , .s(shifter[0]) , .a(y[3]) , .b(y[4]));
mux_2to1 m22 (.z (w[2]) , .s(shifter[0]) , .a(y[2]) , .b(y[3]));
mux_2to1 m23 (.z (w[1]) , .s(shifter[0]) , .a(y[1]) , .b(y[2]));
mux_2to1 m24 (.z (w[0]) , .s(shifter[0]) , .a(y[0]) , .b(y[1]));

assign result=w;

endmodule





module Barrell_shifter_case (
	input       [7:0] data    , 
	input       [2:0] control ,
	output  reg [7:0] result  
			     );
always @* begin
	case (control)
	3'd0  :  result = data;
	3'd1  :  result = {data[0]   , data[7:1]};
	3'd2  :  result = {data[1:0] , data[7:2]};
	3'd3  :  result = {data[2:0] , data[7:3]};
	3'd4  :  result = {data[3:0] , data[7:4]};
	3'd5  :  result = {data[4:0] , data[7:5]};
	3'd6  :  result = {data[5:0] , data[7:6]};
	3'd7  :  result = {data[6:0] , data[7]  };
	default : result = data ; 
	endcase 
	end
endmodule

module barrel_shifter_multi_stage (
	input  [7:0] data    ,
     	input  [2:0] select  ,
	output [7:0] out     ,
	output [7:0] s1      ,
	output [7:0] s2      ,
	output [7:0] s3      	
 	);

	assign s1 = select[0] ? ({data[0],data[7:1]})  :data;
assign s2 = select[1] ? ({data[1:0],data[7:2]})  :s1  ;
	assign s3 = select[2] ? ({data[3:0]  ,data[7:4]})  :s2  ;
assign out= s3;

endmodule
 	


module mux_2to1 (
	input  a ,
	input  b ,
	input  s ,
	output z
	);
assign z=s ? b : a ;
endmodule


module tb_barrell_shifter ;
 wire [7:0] result ;
 wire [7:0] resultC;
 wire [7:0] stage1 ;
 wire [7:0] stage2 ;
 wire [7:0] stage3 ;
 wire [7:0] out	   ;
 reg  [7:0] data   ;
 reg  [2:0] shifter; 
 


Barrell_Shifter            dut  (.data(data) , .shifter(shifter) , .result(result)                                      );
barrel_shifter_multi_stage dut1 (.data(data) , .select (shifter) ,  .out(out) , .s1(stage1) ,.s2(stage2) ,.s3(stage3));
Barrell_shifter_case       dut2 (.data(data) , .control(shifter) , .result(resultC)                                      );

initial begin
	data    = 8'd16;
	shifter = 3'd4  ;
	
	#100;
	data    = 8'd0 ;
	shifter = 3'd8  ;

	#100;
	data    = 8'd128;
	shifter = 3'd2   ;	
	
	#100;
	data    = 8'd32 ;
	shifter = 3'd8  ;
	
	repeat(5) begin
	#100;
	data    = $random  ;
	shifter = $random  ;
	end
	end
	initial begin
	$monitor("The input is %d and shift by %d Result =%d Case Result =%d  Multisatge result %d ",data,shifter,result,resultC,out);
	end
 
endmodule
	
