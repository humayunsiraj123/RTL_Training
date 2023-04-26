//Code your design here

// Code your design here
module mux_univ_one#(parameter N=8,W=8)(output logic [W-1:0] out,input  [W-1:0]one_hot,input  [W-1:0]in[N]);
  
always_comb
  begin
    out='z;
  for(int i=0;i<N;i++)
    if(one_hot==(1<<i))
     out = in[i] ;
  end
    endmodule


/*
module mux_univ#(parameter N=8,W=8)(output logic [W-1:0]out,input [W-1:0] sel,input [W-1:0]in[N]);
  genvar i;

   
    for(i=0; i<N;i++)
      if(i==sel)
       assign out=in[i];
      
endmodule

*/
