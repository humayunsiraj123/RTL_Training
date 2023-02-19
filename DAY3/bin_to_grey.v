// Code your design here

module bin_to_grey (
  input  [4:0] bin,
  output [4:0] grey
);
  assign grey[4] = bin[4]           ;
  assign grey[3] = grey[4] ^ bin[3] ;
  assign grey[2] = grey[3] ^ bin[2] ;
  assign grey[1] = grey[2] ^ bin[1] ;
  assign grey[0] = grey[1] ^ bin[0] ;
  
endmodule
  
