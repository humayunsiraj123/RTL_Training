module nbit_divider#( WIDTH=4)(
	input [WIDTH-1:0]A,
	input [WIDTH-1:0]B,
	output logic [WIDTH-1:0]Q
	);

logic [2**WIDTH -1 :0 ]n;
logic [WIDTH-1:0][WIDTH-1:0]pr;


always_comb begin : proc_
	for(int ii =WIDTH-1 ; ii>=0;ii--)
		if(ii==WIDTH-1)		
			for(int jj = WIDTH-1;jj>=0;jj--)
        if(jj==WIDTH-1)
						div_block db('b0,!b[jj],1'b1,n[(ii+1)*(jj+1)-1],pr[ii][jj] ;


 






 end 
endmodule : nbit_divider

module div_block(
  input r, // remainder from previpus divsion stage
  input b,// divisor
  input cin,//carry in
  input n, // partial out bit
  output logic pr, // partial remainder
  output logic cout);// sum result

logic d ;

always_comb begin : proc_
{cout,d} = r+b+cin;
pr = n ? r ? d;  
end

endmodule