
// Code your testbench here
// or browse Examples
module tb_LaneShift;

  // Define the signals for the testbench
  reg [15:0][0:15] input_registers ; // Input registers (16 lanes)
  wire [15:0] [0:15] output_registers; // Output registers (16 lanes)
  reg [3:0] start_lane; // Start lane (0 to 15)

  // Instantiate the LaneShift module
  LaneShift uut (
    .input_registers(input_registers),
    .start_lane(start_lane),
    .output_registers(output_registers)
  );

  // Stimulus generation
  initial begin
    // Initialize inputs
    start_lane = 3; // Start from lane 3

    // Apply data to input registers
    
    
    for(int i = 0 ; i<16;i++)
      begin
        input_registers[i] = $random;
      end
    //start_lane = $urandom_range(0,15);
    
    // ... (initialize other lanes as needed)

    // Display initial state
    $display("Input Registers:");
    for (int lane = 0; lane < 16; lane = lane + 1)
      $display("Lane %0d: %d", lane, input_registers[lane]);

    // Apply some delay
    #10;
//      for(int i = 0 ; i<16;i++)
//       begin
//         input_registers[i] = $random;
//       end
    start_lane = $urandom_range(0,15);

    // Display shifted output
    $display("\nstart %d :",start_lane);
    
    $display("\nOutput Registers:");
    
    for (int lane = 0; lane < 16; lane = lane + 1)
      $display("Lane %0d: %d", lane, output_registers[lane]);
 #10;
//      for(int i = 0 ; i<16;i++)
//       begin
//         input_registers[i] = $random;
//       end
    start_lane = $urandom_range(0,15);
     $display("\nstart %d :",start_lane);

    // Display shifted output
    $display("\nOutput Registers:");
    for (int lane = 0; lane < 16; lane = lane + 1)
      $display("Lane %0d: %d", lane, output_registers[lane]);
     #10;
//      for(int i = 0 ; i<16;i++)
//       begin
//         input_registers[i] = $random;
//       end
    start_lane = $urandom_range(0,15);
 $display("\nstart %d :",start_lane);
    // Display shifted output
    $display("\nOutput Registers:");
    for (int lane = 0; lane < 16; lane = lane + 1)
      $display("Lane %0d: %d", lane, output_registers[lane]);
    // Add additional test cases as needed

    // Finish simulation
    $stop;
  end

endmodule
