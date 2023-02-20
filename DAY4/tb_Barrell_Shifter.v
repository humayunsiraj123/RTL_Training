module tb ;
 wire [7:0] result ;
 reg  [7:0] data   ;
 reg  [2:0] shifter; 


Barrell_Shifter dut (.data(data) , .shifter(shifter), .result(result));

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
	$monitor("The input is %d and shift by %d Result =%d",data,shifter,result);
	end
 
endmodule
