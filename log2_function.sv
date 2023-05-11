function interger log2(
integer ip);
  if( ip !=0)
    while(ip>1)
      begin
        ip=ip>>1;
      log2+=1;
      end
  else
    log2 =0;
  endfunction
  
