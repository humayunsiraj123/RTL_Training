module barrell_shifter_dir#(parameter NUM_STAGE)(
	input cntrl[NUM_STAGE-1:0],
	input [2**NUM_STAGE-1:0]data_in,
	input [1:0]dir,
	output logic [2**NUM_STAGE-1:0]data_out);

logic[NUM_STAGE-1:0][2**NUM_STAGE-1:0] stage;


always_comb
begin
	case(dir)
		'b00:// logic left shift
		begin
			for(int i=0; i<NUM_STAGE;i++)
				if(i==0)
					stage[i] = cntrl[i]? data_in<<2**i:data_in;
				else
					stage[i] = cntrl[i]? stage[i-1]<<2**i:stage[i-1];
		end

		'b01:// logic right shift
		begin
			for(int i=0; i<NUM_STAGE;i++)
				if(i==0)
					stage[i] = cntrl[i]? data_in>>2**i:data_in;
				else
					stage[i] = cntrl[i]? stage[i-1]>>2**i:stage[i-1];
		end

		'b10:// arthimetic right shift
		begin
			for(int i=0; i<NUM_STAGE;i++)
				if(i==0)
					stage[i] = cntrl[i]? data_in>>>2**i:data_in;
				else
					stage[i] = cntrl[i]? stage[i-1]>>>2**i:stage[i-1];
		end
		'b11:// arithematic left shift
		begin
			for(int i=0; i<NUM_STAGE;i++)
				if(i==0)
					stage[i] = cntrl[i]? data_in<<<2**i:data_in;
				else
					stage[i] = cntrl[i]? stage[i-1]<<<2**i:stage[i-1];
		endcase // dir
data_out = stage[NUM_STAGE-1];
end
endmodule

module barrell_shifter_mux#(parameter NUM_STAGE)(
	input cntrl[NUM_STAGE-1:0],
	input [2**NUM_STAGE-1:0]data_in,
	input [1:0]dir,
	output logic [2**NUM_STAGE-1:0]data_out);

logic[NUM_STAGE-1:0][2**NUM_STAGE-1:0] stage;



genvar ii,jj;
generate
	for(ii=0;ii<NUM_STAGE;ii++) 
		if(ii==0)begin
			for(jj=2**NUM_STAGE-1 ;jj>=0;jj++)
				if(2**NUM_STAGE-1 - jj<2**ii)
					assign stage[ii][jj] = ? data[jj]:1'b0;
				else
					assign stage[ii][jj] = ? data[jj]:data[jj-];
						 
			
		end

endgenerate


mux_2to1 m1 (.z (x[7]) , .s(shifter[2]) , .a(data[7]) , .b(1'b0   ));
mux_2to1 m2 (.z (x[6]) , .s(shifter[2]) , .a(data[6]) , .b(1'b0   ));
mux_2to1 m3 (.z (x[5]) , .s(shifter[2]) , .a(data[5]) , .b(1'b0   ));
mux_2to1 m4 (.z (x[4]) , .s(shifter[2]) , .a(data[4]) , .b(1'b0   ));
mux_2to1 m5 (.z (x[3]) , .s(shifter[2]) , .a(data[3]) , .b(data[7]));
mux_2to1 m6 (.z (x[2]) , .s(shifter[2]) , .a(data[2]) , .b(data[6]));
mux_2to1 m7 (.z (x[1]) , .s(shifter[2]) , .a(data[1]) , .b(data[5]));
mux_2to1 m8 (.z (x[0]) , .s(shifter[2]) , .a(data[0]) , .b(data[4]));

// 2bit right shift .......................

mux_2to1 m9  (.z (y[7]) , .s(shifter[1]) , .a(x[7]) , .b(1'b0));
mux_2to1 m10 (.z (y[6]) , .s(shifter[1]) , .a(x[6]) , .b(1'b0));
mux_2to1 m11 (.z (y[5]) , .s(shifter[1]) , .a(x[5]) , .b(x[7]));
mux_2to1 m12 (.z (y[4]) , .s(shifter[1]) , .a(x[4]) , .b(x[6]));
mux_2to1 m13 (.z (y[3]) , .s(shifter[1]) , .a(x[3]) , .b(x[5]));
mux_2to1 m14 (.z (y[2]) , .s(shifter[1]) , .a(x[2]) , .b(x[4]));
mux_2to1 m15 (.z (y[1]) , .s(shifter[1]) , .a(x[1]) , .b(x[3]));
mux_2to1 m16 (.z (y[0]) , .s(shifter[1]) , .a(x[0]) , .b(x[2]));


// 1bit right shift .......................

mux_2to1 m17 (.z (w[7]) , .s(shifter[0]) , .a(y[7]) , .b(1'b0));
mux_2to1 m18 (.z (w[6]) , .s(shifter[0]) , .a(y[6]) , .b(y[7]));
mux_2to1 m19 (.z (w[5]) , .s(shifter[0]) , .a(y[5]) , .b(y[6]));
mux_2to1 m20 (.z (w[4]) , .s(shifter[0]) , .a(y[4]) , .b(y[5]));
mux_2to1 m21 (.z (w[3]) , .s(shifter[0]) , .a(y[3]) , .b(y[4]));
mux_2to1 m22 (.z (w[2]) , .s(shifter[0]) , .a(y[2]) , .b(y[3]));
mux_2to1 m23 (.z (w[1]) , .s(shifter[0]) , .a(y[1]) , .b(y[2]));
mux_2to1 m24 (.z (w[0]) , .s(shifter[0]) , .a(y[0]) , .b(y[1]));
endmodule