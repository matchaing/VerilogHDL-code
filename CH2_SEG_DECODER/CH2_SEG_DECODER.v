// CH2_SEG_DECODER.V

module CH2_SEG_DECODER(
 BCD,
 a, b, c, d, e, f, g
);

input [3:0] BCD;

output a, b, c, d, e, f, g;

reg [6:0] DECODE;

always @(BCD)
begin
	case(BCD)	
		 4'b0000 : DECODE = 7'b1111110; //0
		 4'b0001 : DECODE = 7'b0110000; //1
		 4'b0010 : DECODE = 7'b1101101; //2
		 4'b0011 : DECODE = 7'b1111001; //3
		 4'b0100 : DECODE = 7'b0110011; //4
		 4'b0101 : DECODE = 7'b1011011; //5
		 4'b0110 : DECODE = 7'b1011111; //6
		 4'b0111 : DECODE = 7'b1110000; //7
		 4'b1000 : DECODE = 7'b1111111; //8
		 4'b1001 : DECODE = 7'b1111011; //9
		 default : DECODE = 7'b0000000; //NULL
	endcase
end

assign {a, b, c, d, e, f, g} = DECODE;
endmodule