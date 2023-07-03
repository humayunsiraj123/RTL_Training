module lfsr#(parameter WIDTH=8)
  (input clk,
    input srst,
   output logic [WIDTH-1:0]  out
  );

  logic [WIDTH-1:0]tmp=1;

  always @(posedge clk)
      if(srst)
        tmp<=1;
      else
        tmp <= { tmp[WIDTH-2:0],(tmp[5]^tmp[tmp[WIDTH-1]^tmp[3]^tmp[tmp[WIDTH-3])};
       
  assign out=tmp;
  endmodule
                                                                    
                                                                    
