// Code your design here

// module bin_to_grey (
//   input  [4:0] bin,
//   output [4:0] grey
// );
  
//   assign grey[4] = bin[4]           ;
//   assign grey[3] = grey[4] ^ bin[3] ;
//   assign grey[2] = grey[3] ^ bin[2] ;
//   assign grey[1] = grey[2] ^ bin[1] ;
//   assign grey[0] = grey[1] ^ bin[0] ;
// endmodule


module bin_to_grey_nbits#(paramter N=8) (
    input  [N-1:0] bin,
    output [N-1:0] grey
);

    reg [N-1:0] temp;
    
  genvar i
  generate
    for( i =N-1 ;i>=0;i=i-1)
      if(i ==N-1)
        grey[N-1] =bin[N-1];
    else 
      grey[i]=bin[i+1]^bin[i];
  endgenerate
  
endmodule
  
