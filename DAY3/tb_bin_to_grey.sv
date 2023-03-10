// Code your testbench here
// or browse Examples

module tb_bin_to_grey ;
  reg  [4:0] bin  ;
  wire [4:0] grey ;
  
  bin_to_grey dut(.bin(bin),.grey(grey));
  
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
    
  end
  function result;
  $display ("The value of GREY CODE OF BIN %b  = %b",bin,grey);
  endfunction
endmodule   
