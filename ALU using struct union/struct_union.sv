
typedef enum {add,sub,mul,div,sl,sr} opcode_t;
typedef enum {sign,unsign} operand_type_t;

typedef union packed{ 
logic [31:0] u_data;
bit signed [31:0] s_data;
} data_t;
typedef union packed{ 
logic [63:0] u_data;
bit signed [63:0] s_data;
} l_data_t;

typedef struct packed {
opcode_t opc;
operand_type_t op_type;
data_t op_a;
data_t op_b;
} instr_t;


module struct_union(input instr_t IW,output l_data_t alu_out);
always@(IW) begin
if(IW.op_type==sign)begin
case(IW.opc)
add : alu_out.s_data=IW.op_a.s_data + IW.op_b.s_data;
sub : alu_out.s_data=IW.op_a.s_data - IW.op_b.s_data;
div : alu_out.s_data=IW.op_a.s_data / IW.op_b.s_data; 
mul : alu_out.s_data=IW.op_a.s_data * IW.op_b.s_data;
sl  : alu_out.s_data=IW.op_a.s_data<<<1 		    ;
sr  : alu_out.s_data=IW.op_a.s_data>>>1 		    ;
endcase 
end
if(IW.op_type==unsign)begin
case(IW.opc)
add : alu_out.u_data=IW.op_a.u_data + IW.op_b.u_data;
sub : alu_out.u_data=IW.op_a.u_data - IW.op_b.u_data;
div : alu_out.u_data=IW.op_a.u_data / IW.op_b.u_data; 
mul : alu_out.u_data=IW.op_a.u_data * IW.op_b.u_data;
sl  : alu_out.u_data=IW.op_a.u_data<<1  	    ;
sr  : alu_out.u_data=IW.op_a.u_data>>1 	;
endcase 
end
end
endmodule;