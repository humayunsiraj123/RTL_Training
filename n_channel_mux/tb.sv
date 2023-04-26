// Code your testbench here
// or browse Examples


module tb;
  logic[7:0]in[8]='{'haa,'hbb,'hcc,'hdd,'hee,'hff,'h11,'h22};
  logic [7:0]out;
  logic [7:0]out_one_hot;
  logic [7:0]one_hot;
  logic [7:0]sel;
  
 // mux_univ DUT(out,sel,in);
  mux_univ_one DUT_onehot(out_one_hot,one_hot,in);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  #10;
    one_hot='b00000010;
    sel ='h2;
    $display("out %b   one_hot %b",out,out_one_hot);
  #10;
    one_hot='b00000001;
    sel ='h1;
    $display("out %b   one_hot %b",out,out_one_hot);
  #10;
    one_hot='b00000100;
    sel ='h4;
    $display("out %b   one_hot %b",out,out_one_hot);
  #10;
    one_hot='b00100000;
    sel ='h32;
    $display("out %b   one_hot %b",out,out_one_hot);
      #10;
    one_hot='b00000001;
    sel ='h1;
    $display("out %b   one_hot %b",out,out_one_hot);
  #10;
    one_hot='b00000100;
    sel ='h4;
    $display("out %b   one_hot %b",out,out_one_hot);
  #10;
    one_hot='b00100000;
    sel ='h32;
    $display("out %b   one_hot %b",out,out_one_hot);
    
  end
endmodule
