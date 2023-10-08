module regfile(
	input clk,
	input srst,
	input [31:0] addr_w,
	input  write_en,
	input [31:0] data_in,
	input read_en,
	input [31:0] data_out);


localparam OPERATING_SYS_IO_OP = 32'hC0000000;                    		
localparam DYNAMIC_DATA        = 32'h00000000;             		
localparam TEXT                = 32'h00008000;     		
localparam EXCEPTION_HANDLER   = 32'h00000000;                 		
localparam GLOBAL_DATA         = 32'h00000000;            		

 

logic [31:0]memory[0:2**30]; //2 power32 i.e as range varies from 0

logic sel_line_operating_sys_io_op;
logic sel_line_dynamic_data;
logic sel_line_text;
logic sel_line_exception_handler;
logic sel_line_global_data;


// select lines...
assign sel_line_operating_sys_io_op = addr_w[31:2] == OPERATING_SYS_IO_OP ;                               	
assign sel_line_dynamic_data        = addr_w[31:2] == DYNAMIC_DATA ;                       	
assign sel_line_text                = addr_w[31:2] == TEXT ;               	
assign sel_line_exception_handler   = addr_w[31:2] == EXCEPTION_HANDLER ;                            	
assign sel_line_global_data         = addr_w[31:2] == GLOBAL_DATA ;         

             	



endmodule