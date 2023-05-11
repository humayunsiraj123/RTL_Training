// Code your design here
module bin2bcd(
  input[7:0]bin,
  output logic [11:0]bcd
);
int i;
  
 always_comb
  begin
    bcd=0;
    for(i=0;i<8;i++)begin
  
    bcd = {bcd,bin[7-i]};
      if(i<7)begin
    bcd[3:0] =bcd[3:0]>=5?bcd[3:0]+3'd3: bcd[3:0];
    bcd[7:4] =bcd[7:4]>=5?bcd[7:4]+3'd3: bcd[7:4];
    bcd[11:8] =bcd[11:8]>=5?bcd[11:8]+3'd3: bcd[11:8];
      end
   
    
  end
  end
endmodule

module  tb_bin2bcd;
  
  logic [7:0]bin;
  logic [11:0]bcd;


  bin2bcd dut(bin,bcd);

  
  initial begin
  #10;
    bin='b11111111;
    
    #10;
    $display("the bin %d is and BCD %d  ",bin,bcd);
  #10;
    bin=$random();
    $display("the bin %d is and BCD %d  ",bin,bcd);
 #10;
    bin=$random();
    $display("the bin %d is and BCD %d ",bin,bcd);
  #10;
    bin=$random();
    $display("the bin %d is and BCD %d ",bin,bcd);
  #10;
    bin=$random();
    $display("the bin %d is and BCD %d ",bin,bcd);
    $display("********************88"); 
    #10;
    $display("the bin %d is and BCD %d ",bin,bcd);
    $display("********************"); 
    #10;
    
    for (int i=0; i<256;i++)
     begin
  	#10;
    bin=i;
    $display("the bin %d is and BCD %d ",bin,bcd);
 	 end
  end
endmodule
