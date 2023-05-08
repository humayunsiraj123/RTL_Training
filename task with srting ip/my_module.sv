
module my_module;

  task display_message(string message);
    $display("Message: %s", message);
  endtask

  initial begin
    // Call the task with a string argument
    display_message("Hello, world!");
  end

endmodule