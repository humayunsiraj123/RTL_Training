
module tb;
  int sum_arr;
  int sum_que;
  bit arry[];
 
  bit queue[$];
  initial begin
  arry = new[1];
  
  arry[arry.size() - 1]= 1'b1;
  queue.push_front(1'b1);
  arry = new[arry.size() + 1](arry);
  arry[arry.size() - 1]= 1'b1;
  queue.push_front(1'b1);
  arry = new[arry.size() + 1](arry);
  arry[arry.size() - 1]= 1'b0;
  queue.push_front(1'b0);
  sum_arr = arry.sum()  with (int'(item));
  sum_que = queue.sum() with (int'(item));
  
    $display("the sum of arry %d ",sum_arr);
    $display("the sum of queue %d ",sum_que);
 
  arry = new[arry.size() + 1](arry);
  arry[arry.size() - 1]= 1'b1;
  queue.push_front(1'b1);
  sum_arr = arry.sum()  with (int'(item));
  sum_que = queue.sum() with (int'(item));
  
    $display("the sum of arry %d ",sum_arr);
    $display("the sum of queue %d ",sum_que);
    
    repeat(10) begin
    
  arry = new[arry.size() + 1](arry);
      arry[arry.size() - 1]= $random%2;
  queue.push_front($random%2);
  sum_arr = arry.sum()  with (int'(item));
  sum_que = queue.sum() with (int'(item));
  
    $display("the sum of arry %d ",sum_arr);
    $display("the sum of queue %d ",sum_que);
    
    end
 
  $display("the  arry %p ",arry);
  $display("the queue %p ",queue);
    queue.reverse();
    arry.reverse();
  $display("the reverse queue %p ",queue);
   $display("the  reverse arry %p ",arry);
  
  end   
endmodule
