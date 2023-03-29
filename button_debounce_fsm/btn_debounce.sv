// Code your design here
module btn_debounce(
  input clk,
input reset,
input btn,
output  logic out);
  localparam  [2:0] zero = 3'b000,
  		w1_1 = 3'b001,
  		w1_2 = 3'b010,
  		w1_3 = 3'b011,
 		one  = 3'b100,
  		w0_1 = 3'b101,
  		w0_2 = 3'b110,
  		w0_3 = 3'b111;
  
  
  localparam N=2;
  
  reg [N-1:0] q_reg =0;
  reg [N-1:0] q_next ;
  wire tick;
  reg [2:0] nxt_state,cur_state;
  
  
  
  always@(posedge clk)
    q_reg<=q_next;
  	
  assign q_next=q_reg+1;
  assign tick = (q_reg===0) ? 1:0;
  
  
  always@(posedge clk)
    if(reset)
    	cur_state<=zero;
  	else
      cur_state<=nxt_state;
  always @(*)
    begin
  nxt_state=cur_state;
      case(cur_state)
        zero :
          if(btn) 
            nxt_state = w1_1;
          else
            nxt_state=cur_state;
            
        w1_1 :
          if(~btn) 
            nxt_state = zero;
          else if(tick && btn)
            nxt_state=w1_2;
        w1_2 :
          if(~btn) 
            nxt_state = zero;
          else if(tick && btn)
            nxt_state=w1_3;
        w1_3 :
          if(~btn) 
            nxt_state = zero;
          else if(tick && btn)
            nxt_state=one;
       one :
         if(~btn) begin
            nxt_state = w0_1;
           out =1'b1; 
         end
           else
            nxt_state=one;
        w0_1 :
          if(btn) begin
            nxt_state = one;
        	out =1'b1;
          end
        else if(tick && ~btn)
            nxt_state=w0_2;
        w0_2 :
          if(btn) begin
            nxt_state = one;
        	out =1'b1; 
          end
        	else if(tick && ~btn)
            nxt_state=w0_3;
        w0_3 :
          if(btn) begin
            nxt_state = one;
        	out =1'b1;
          end
       	 else if(tick && ~btn)
            nxt_state=zero;
      endcase          
    end

endmodule
 
  
