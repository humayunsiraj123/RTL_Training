module seq_101_detect(
  input clk,
  input rst,
  input s_data,
  input out
);
  enum logic[1:0] {S[3]} next_state,curr_state;

  always_ff @(posedge clk)
    curr_state <= next_state;
  
  always_comb
    begin
      case(curr_state)
        S0: 
          begin
            if(s_data==1'b1)
              next_state = S1;
            else
              next_state= S0;
            
          end
        S1: 
          begin
            if(s_data==1'b0)
              next_state = S2;
            else
              next_state= S1;
          end
        S2: 
          begin
            if(s_data==1'b1)
              next_state = S1;
            else
              next_state= S0;
          end
        default :
          next_state =s0;
      endcase
    end
  out = S2? 1:0;
endmodule
      
      
      
  
