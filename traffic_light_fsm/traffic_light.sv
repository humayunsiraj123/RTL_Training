// Code your design here
// Code your design here
 enum logic [2:0] {A='b001,B='b011,C='b100,D='b110} next_state,pre_state;
typedef	enum bit{RED,YELLOW,GREEN} result;

module traffic_light(input clk,rst_n,output result out);
  logic [3:0]count;
  
  always_ff @(posedge clk)begin
    if(~rst_n)
      begin
        count<=0;
        next_state<=next_state.first();
        pre_state<=pre_state.first();
      end
  		else begin
          case(count)
            'd0 :pre_state <=A;
            'd4 :pre_state <=B;
            'd5:pre_state <=C;
            'd12:pre_state <=D;
            default :pre_state <=A;
          endcase
  		count<=count+1;
        end
  end 
  always_ff @(posedge clk)
    next_state <=pre_state;
  
  always_comb 
    begin
      case(next_state)
        A : begin
          out.RED=1'b1;
           out.YELLOW=1'b0;
           out.GREEN=1'b0;
        end
        B: begin
          out.RED=1'b1;
           out.YELLOW=1'b1;
           out.GREEN=1'b0;
        end
        C:begin
          out.RED=1'b0;
           out.YELLOW=1'b0;
           out.GREEN=1'b1;
        end
	D:begin
          out.RED=1'b1;
           out.YELLOW=1'b1;
           out.RED=1'b1;
        end
    end
        endmodule
              
  
  
  
  



