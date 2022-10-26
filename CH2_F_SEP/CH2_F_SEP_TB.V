// CH2_F_SEP_TB.V

`timescale 10ns / 1ps
module TestBench;

// input
reg CLK;

//output
wire [3:0] Q;

// Instantiate the U1
CH2_F_SEP U1(
 CLK,
 Q
);

// Specify input stimulus
initial begin
 CLK = 0;
end
always begin
 CLK = 0;
 #1;
 CLK = 1;
 #1;
end
endmodule