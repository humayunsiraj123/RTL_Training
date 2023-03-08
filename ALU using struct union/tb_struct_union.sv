module tb_struct_union;

typedef enum bit[2:0] {add,sub,mul,div,sl,sr} opcode_t;
typedef  enum {sign,unsign} operand_type_t;

typedef union packed{
logic [31:0] u_data;
bit signed[31:0] s_data;
}data_t;

typedef union packed{ 
logic [63:0] u_data;
bit signed [63:0] s_data;
} l_data_t;
typedef struct packed{
opcode_t opr;
operand_type_t opr_type;
data_t opr_a;
data_t opr_b;
}instr_t;
instr_t IW;
l_data_t result;

struct_union alu1(IW,result);


initial begin
#5;
IW.opr_a='h10;
IW.opr_b='h20;
IW.opr_type=sign;
IW.opr=add;
display();
#100;
IW.opr=IW.opr.next();
display();
#100;
IW.opr=IW.opr.next();
display();
#100;
IW.opr=IW.opr.next();
display();
#100;
IW.opr=IW.opr.next();
display();
#100;
IW.opr=IW.opr.next();

#100;
IW.opr=IW.opr.next();
display();
#100;
IW.opr=IW.opr.next();
display();
repeat(10) 
begin
#100;
randomizer();

end
end
task display();
$display("A= %d  B = %d  operation %s datatype  $s   result = %p",IW.opr_a,IW.opr_b,IW.opr.name(),IW.opr_type.name(),result);
endtask

task randomizer();
IW.opr_a=$random();
IW.opr_b=$random();
IW.opr_type=sign;
IW.opr=IW.opr.next();
display();
endtask

endmodule
 