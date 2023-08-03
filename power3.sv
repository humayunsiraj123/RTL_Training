module power3(
  input clk,
  input start,
  input [3:0] data_in,
  output done,
  output logic  [11:0] result );

  logic [3:0] cnt;
  initial begin
  result= 1;
  end

  always @(posedge clk)
    begin
      if(start)
        begin
        result<=1;        
        cnt<=0; 
        end
        end
  else if(!done)
    begin
    result<=result*data_in;
    cnt<=cnt+1;
    done<= cnt>3 ;
    end
endmodule

//pipelined based
module pip_power3(
  input clk,
  input [3:0] data_in,
  output logic  [11:0] result );

  //logic [3:0] cnt;
  logic [11:0] result1;
  logic [3:0] data_in_1;
  logic [11:0] result2;
  logic [3:0] data_in_2;
  logic [11:0] result3;
  
  initial begin
  result = 1;
  end

  always @(posedge clk)
    begin
    result1 <=data_in;
    data_in_1<=data_in;  
    result2 <=result2*data_int_1;
    data_in_2<=data_in_1;  
    result3 <= result2*data_in_2; 
    end 
  endmodule


//pipelined based
module ll_power3(
  input [3:0] data_in,
  output [11:0] result );

  //logic [3:0] cnt;

  
  initial begin
  result = 1;
  end
always_comb
  for(int i=0; i<3;i++)
    
  endmodule

    
    
  
  
