`timescale 1ns / 1ps
module p2p_matrix_multiplication(
input [7:0] a_in,
input start, rst, clk,
output reg done,
output reg [7:0] cout
);
integer i;
reg we;
parameter size = 16;
// rom
reg [7:0] ROM[0:size-1];
initial begin
$readmemh("hexFile.mem", ROM);
end
// ram
reg [7:0] RAM [0:size-1];

always@(posedge clk)
begin
if (rst)begin
done <= 0;
i <= 0;
we <= 1;
end
else begin
if(start)begin
	if(i<size)begin
		if (we) begin
			RAM[i] <= a_in;
			i <= i+1;end
// if !we
		else begin 
			cout <= RAM[i]*ROM[i];
			i <= i+1;
		if (i==size-1) done <= 1;end
		end
// greater than 16 reset i
	else begin
		if(!done)begin
			we <= 0;
			i <= 0;end
		end
end
end
end
endmodule
