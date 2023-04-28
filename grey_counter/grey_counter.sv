
// Code your design here
module grey_counter(
  input clk,
  input srst_n,
  output logic [2:0]count);
  
  logic [2:0]bin;

  always_ff @(posedge clk) begin
    if(~srst_n)
      bin<=0;
     else
      bin<=bin+'d1;
end 

assign count ={bin[2],bin[2]^bin[1],bin[1]^bin[0]};
//assign count =bin>>1 ^ bin;
	
endmodule


module grey_count#(parameter N=4)( 
input clk,
input srst_n,
output logic  [N-1:0] q
);

logic [N-1:0] bin;
always_ff @(posedge clk)
	if(~srst_n)
	bin<=0;
	else
	bin<=bin+1;

//assign q = bin ^ (bin>>1);
/*genvar i;
generate
 
for (i=N-1;i>=0;i=i-1)
if (i==N-1)
q[N-1] = bin[N-1];
else
q[i]=q[i+1]^ bin[i];
endgenerate
*/
always_comb
begin
q[N-1]=bin[N-1];
foreach(bin[i])
q[i-1]=bin[i]^bin[i-1];
	//bin[i] = ^ grey>>i;
end
	
endmodule
module grey_count_2#(parameter N=8)( input  clk,
				    input srst,
				    output logic [N-1:0] grey);
	logic [N-1:0] bin;
	logic [N-1:0] grey_next;
	logic [N-1:0] bin_next;
	always_ff @(posedge clk)
		if(srst)
			begin
			grey<=0;
			bin <=0;
			end
				else
			
					begin
						grey <= grey_next;
			bin <=grey_next;
					end
	always_comb 
		begin
			bin_next= bin!== {WIDTH{1'b1}}? bin +1 :0 ;
			grey_next= (bin_next>>1) ^ bin_next;
		end
	
endmodule
