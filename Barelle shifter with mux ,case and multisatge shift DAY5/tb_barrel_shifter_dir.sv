module tb_barrell_shifter_dir;

  // Parameters for the module
  parameter NUM_STAGE = 4; // Change this value to your desired number of stages

  // Signals to connect to the module
  reg [NUM_STAGE-1:0] cntrl;
  reg [2**NUM_STAGE-1:0] data_in;
  reg [1:0] dir;
  wire [2**NUM_STAGE-1:0] data_out;

  // Instantiate the module
  barrell_shifter_dir #(NUM_STAGE) uut (
    .cntrl(cntrl),
    .data_in(data_in),
    .dir(dir),
    .data_out(data_out)
  );

  // Clock generation (if needed)
  reg clock = 0;
  always begin
    #5 clock = ~clock;
  end

  // Constraint block for input values (same as before)

  // Create an instance of the constraint block
  //input_constraint input_c;

  // Randomize inputs based on the constraints
  initial begin
    // Create a random seed for repeatability (optional)
    //$time(seed);

    // Randomize inputs
    //input_c = new;
    //input_c.randomize(); // Randomize inputs based on constraints

    // Assign randomized values to module inputs
    cntrl =5;  //input_c.cntrl;
    data_in ='d128; // input_c.data_in;
    dir =00; //input_c.dir;
	#10;
    
    // Display the randomized inputs (optional)
    $display("Randomized Inputs:");
    $display("cntrl = %b", cntrl);
    $display("data_in = %d", data_in);
    $display("data_out = %d", data_out);
    
    $display("dir = %b", dir);
    
     cntrl ='b1111;  //input_c.cntrl;
    data_in ='d128; // input_c.data_in;
    dir = 'b01; //input_c.dir;
	#10;
    
    // Display the randomized inputs (optional)
    $display("Randomized Inputs:");
    $display("cntrl = %b", cntrl);
    $display("data_in = %h", data_in);
    $display("dir = %b", dir);
    
    $display("data_out = %d", data_out);
    for(int i  =0 ; i<100 ;i++ )
    	begin
      #10
          cntrl =$random ;//'b1111;  //input_beginc.cntrl;
    data_in ='d128; // input_c.data_in;
    dir = $random; //input_c.dir;
	#10;
	$display("Randomized Inputs:");
    $display("cntrl = %b", cntrl);
    $display("data_in = %h", data_in);
    $display("dir = %b", dir);
    $display("data_out = %d", data_out);
        end
    
    // Add more simulation code here as needed, such as applying inputs and checking outputs

    // Dump variables to a VCD (Value Change Dump) file
    $dumpfile("simulation.vcd"); // Specify the dump file name
    $dumpvars(0, tb_barrell_shifter_dir); // Dump all variables in the module

    // End simulation
    $finish;
  end

  // Clock driver (if needed)
  always begin
    #5 clock = ~clock;
  end

endmodule
