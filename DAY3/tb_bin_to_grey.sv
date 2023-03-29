// Code your testbench here
// or browse Examples

module tb_bin_to_grey ;
  localparam N=8;
  reg  [4:0] bin  ;
  wire [4:0] grey ;
  reg  [N-1:0] bin_n  ;
  wire [N-1:0] grey_n ;
  
  bin_to_grey dut(.bin(bin),.grey(grey));
  bin_to_grey#(.N(N)) dut1(.bin(bin_n),.grey(grey_n));
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    #10				 ;
    bin = 5'b10110 ;
    result         ;
    #10
    bin = 5'b11111 ;
    result         ;
    #10			   ; 		
    bin = 5'b10000 ;
    result         ;
    #10			   ; 
    bin = $random  ;
    result         ;
    #10            ;
    bin = $random  ;
    result         ;
    
    repeat(10)
      begin
      	#10
          bin = $random  ;
          result         ;
        
      end
    repeat(10)
      begin
      	#10
          bin_n = $random  ;
          result_n         ;
        
      end
    
  end
  function result;
  $display ("The value of GREY CODE OF BIN %b  = %b",bin,grey);
  endfunction
  function result_n;
    $display ("The value of GREY CODE OF BIN %b  = %b",bin_n,grey_n);
  endfunction
endmodule   
