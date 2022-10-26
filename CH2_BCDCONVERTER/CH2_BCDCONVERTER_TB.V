// CH2_BCDCONVERTER_TB.V
`timescale 10ns / 1ps
module TestBench;
// input
reg [3:0] ONE, TEN;
//output
wire [6:0] BIN;
// Instantiate the U1
CH2_BCDCONVERTER U1(
 ONE, TEN,
 BIN
);
// Specify input stimulus
initial begin
	 TEN = 4'b0000; ONE = 4'b0000;
	 #20 TEN = 4'b0111; ONE = 4'b0110;
	 #20 TEN = 4'b0001; ONE = 4'b0010;
	 #20 TEN = 4'b1001; ONE = 4'b1001;
end
endmodule