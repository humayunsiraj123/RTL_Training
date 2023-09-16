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

endmodule