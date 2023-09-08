
// Code your design here
module LaneShift (
  input wire [15:0][0:15] input_registers, // Input registers (16 lanes)
  input wire [3:0] start_lane,              // Start lane (0 to 15)
  output reg [15:0] [0:15]output_registers  // Output registers (16 lanes)
);

  integer lane;

  always @(*) begin
    // Initialize all output registers to 0
    for (lane = 0; lane < 16; lane = lane + 1) begin
      output_registers[lane] = 0;
    end

    // Shift the input data to the output registers
    for (lane = 0; lane < 16; lane = lane + 1) begin
      // Calculate the output lane index by subtracting start_lane
      
      if(lane+start_lane<16)
        output_registers[lane] = input_registers[lane+start_lane];
      else
        output_registers[lane] ='0;// input_registers[lane+start_lane];
        
      // Assign data from the input lane to the output lane
     
    end
  end

endmodule
