`timescale 1ns / 1ps

module top_tb;

	// Inputs
	reg [7:0] a_in;
	reg start;
	reg rst;
	reg clk;

	// Outputs
	wire done;
	wire [7:0] cout;

	// Instantiate the Unit Under Test (UUT)
	p2p_matrix_multiplication uut (
		.a_in(a_in), 
		.start(start), 
		.rst(rst), 
		.clk(clk), 
		.done(done), 
		.cout(cout)
	);
always #10 clk = ~clk;
	initial begin
		// Initialize Inputs
		a_in = 0;
		start = 0;
		rst = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
		start = 1;
		a_in = 12;
		#20;
		a_in = 8'd13;
      #20;
		a_in = 8'd112;
      #20;
		a_in = 8'd143;
      #20;
		a_in = 8'd12;
      #20;
		a_in = 8'd1;
      #20;
		a_in = 8'd11;
      #20;
		a_in = 8'd17;
      #20;
		a_in = 8'd13;
      #20;
		a_in = 8'd18;
      #20;
		a_in = 8'd10;
		#20;
		a_in = 8'd15;
      #20;
		a_in = 8'd16;
      #20;
		a_in = 8'd17;
      #20;
		a_in = 8'd33;
      #20;
		a_in = 8'd23;
        
		// Add stimulus here

	end
      
endmodule

