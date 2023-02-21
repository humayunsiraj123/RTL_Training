module tb_Adder ;

wire [31:0] sum;
wire [32:0] result;
wire [32:0] resultx;
wire 	    cout;
reg  [31:0] a;
reg  [31:0] b;
reg  	    cin;


wire  	    hsum;
wire        hcout;
reg 	    ha;
reg   	    hb;

wire  	       fh_sum;
wire           fh_cout;
reg 	       fh_a;
reg   	       fh_b;

wire  	[4:0]    fa_sum;
reg 	[3:0]    fa_a;
reg   	[3:0]    fa_b;


Adder adder(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout),.result(result),.resultx(resultx));
full_adder_nbit #(.N(4)) fa_NB(.in1(fa_a), .in2(fa_b),.sum(fa_sum));
full_adder_HA  faHA(.a(fh_a),.b(fh_b),.sum(fh_sum),.cout(fh_cout));


initial begin
random_value();
#100;
random_value();
#100;
random_value();
#100;
random_value();
#100;
random_value();
#100;
random_value();
#100;
random_value();
#100;
random_value();
#100;
random_value();
#100;
random_value();
#100;
random_value();
end






task random_value;
begin
a=$random;
b=$random;
cin=$random;
fh_a=$random;
fh_b=$random;
fa_a=$random;
fa_b=$random;
#1;
$display("the value of a = %b ,b =%b ,cin =%b ,sum = %b  cout=%b      %d + %d + %d = %d  , %d ,%d , %d",a,b,cin,sum,cout,a,b,cin,{cout,sum},a+b+cin,result,resultx);
$display("the value of fh_a = %b ,fh_b =%b   ,sum = %b  cout=%b   %d + %d      = %d  "   ,fh_a,fh_b,fh_sum, fh_cout,fh_a,fh_b,{fh_cout,fh_sum});
$display("the value of fa_a = %b ,fa_b =%b   ,sum = %b  cout=%b   %d + %d      = %d   ",fa_a,fa_b,fa_sum,fa_sum[4],fa_a,fa_b,fa_sum);
end
endtask
endmodule
