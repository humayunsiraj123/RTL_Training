
// Code your design here
module multiply_4by4(
  input [3:0]A,
  input [3:0]B,
  output  [7:0]M);
  logic p0,p1,p2,p3,p4,p5,p6,p7;
logic  c0,c1,c2,c3,c4,c5,c6; 
  
  assign M={p7,p6,p5,p4,p3,p2,p1,p0};
  
  always_comb
    begin
      p0=A[0]&B[0];
      //FA fa1(A[1]&B[0] 
      {c0,p1}=(A[1]&&B[0]) +(A[0]&&B[1]);
      {c1,p2}=(A[2]&&B[0]) +(A[1]&&B[1]) +(A[0]&&B[2])+c0;
      {c2,p3}=(A[3]&&B[0]) +(A[2]&&B[1]) +(A[1]&&B[2])+	(A[0]&&B[3])+c1;
      {c3,p4}=(A[3]&&B[1]) +(A[2]&&B[2]) +(A[1]&&B[3])+c2;
      {c4,p5}=(A[3]&&B[2]) +(A[2]&&B[3])+ c3;
      {p7,p6}=(A[3]&&B[3])+c4;
    end
      
      
endmodule
  
  module FA(input a,b,ci,output s,co);
    assign s= a^b^ci;
    assign co= ((a^b)&&ci) || (a&&b);
  endmodule