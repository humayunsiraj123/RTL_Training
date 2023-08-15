//algo pr =0 ,size [0:2**n-1];
//for i=n-1:to 0;
//   r={pr<<1,a_i}  ;
//  d=r-B;
//  if D<0 so qi =0 ;r =pr
    //else q=1 r=d;
// r= pr;

    
//PR partial remainder  
// module FA(
// 	input a,
// 	input b,
// 	input cin,
// 	output sum,
// 	output cout);
// assign {cout,sum} =a+b+cin;
// endmodule

//  module mux2to1 (
//  	input a,    // Clock
//  	input b, // Clock Enable
//  	input s,  // Asynchronous reset active low
//  	output res 
// );
 
//  assig res =s ? b :a ; 
//  endmodule

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
  
              
  
