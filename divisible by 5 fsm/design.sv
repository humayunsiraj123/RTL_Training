// Code your design here
module div_by_5(
  input clk,
  input rst_n,
  input data_in,
  output logic out);
  
  typedef enum int {A=0,B,C,D,E} STATE ;
  STATE nxt_state,cur_state;
  
  logic [31:0] reg_temp;
  logic [31:0] nxt_temp;
  logic [2:0] nxt_remain;
  logic [2:0] reg_remain;
  
  
  always_ff @(posedge clk)
    begin
      if(~rst_n)
        cur_state <=cur_state.first();
      else
        cur_state <= nxt_state;
    end
  
 always_ff @(posedge clk)
    begin
      if(~rst_n)
        reg_temp <=0;
      else
       reg_temp <=nxt_temp;
    end
 always_ff @(posedge clk)
    begin
      if(~rst_n)
        reg_remain <=0;
      else
       reg_remain <=nxt_remain;
    end
  
  
  always_comb
    begin
      case(cur_state)
        A : nxt_state = STATE'(reg_remain);
    	B : nxt_state = STATE'(reg_remain);
		C : nxt_state = STATE'(reg_remain);
		D : nxt_state = STATE'(reg_remain);
		E : nxt_state = STATE'(reg_remain);
      endcase
        end
  
 always_comb
    begin
      case(cur_state)
        A : out = (rst_n ==1'b0 && data_in === 1'bx) ? 1'b0 :1'b1;
    	B : out = 1'b0;
		C : out = 1'b0;
		D : out = 1'b0;
		E : out = 1'b0;
        default out = 1'b0;
      endcase
        end
  assign nxt_temp = {reg_temp[30:0],data_in};
  assign nxt_remain = reg_remain % 5;
  
endmodule





module div_by_5_simple(
  input clk,
  input rst_n,
  input data_in,
  output logic out);
  
 enum logic[2:0]{A,B,C,D,E} nxt_state,cur_state;

  
  
  always_ff @(posedge clk)
    begin
      if(~rst_n)
        cur_state <=cur_state.first();
      else
        cur_state <= nxt_state;
    end
  

  
  
  always_comb
    begin
      case(cur_state)
        A : begin
          if(data_in ==1'b1) 
          	nxt_state = B ;
       	 else
           nxt_state  = A;
        	end
    	B : begin
          if(data_in == 1'b0) 
          	nxt_state = C ;
       	 else
           nxt_state  = D;
        	end
        C : begin
          if(data_in ==1'b1) 
          	nxt_state = A ;
       	 else
           nxt_state  = E;
        	end
		D : begin
          if(data_in ==1'b1) 
          	nxt_state = C ;
       	 else
           nxt_state  = B;
        	end
		E : begin
          if(data_in ==1'b1) 
          	nxt_state = E ;
       	 else
           nxt_state  = D;
        	end
      endcase
        end
  
 always_comb
    begin
      case(cur_state)
        A : out = (rst_n ==1'b0 && data_in === 1'bx) ? 1'b0 :1'b1;
    	B : out =1'b0;
		C : out =1'b0;
		D : out =1'b0;
		E : out =1'b0;
        default out =1'b0;
      endcase
        end

  
endmodule

    
