// CH3_PIEZO_EX.V
module CH3_PIEZO_EX(
 RESETN, CLK,
 KEY,
 PIEZO
);

input RESETN, CLK;
input [7:0] KEY;
output PIEZO;

reg BUFF;
integer CNT_SOUND;
integer LIMIT;

wire PIEZO;

always @(KEY)
begin
	case (KEY)
	 8'b10000000 : LIMIT = 190; // DO
	 8'b01000000 : LIMIT = 169; // RAE
	 8'b00100000 : LIMIT = 151; // MI
	 8'b00010000 : LIMIT = 142; // FA
	 8'b00001000 : LIMIT = 127; // SOL
	 8'b00000100 : LIMIT = 113; // RA
	 8'b00000010 : LIMIT = 100; // SI
	 8'b00000001 : LIMIT = 95; // High DO
	 default : LIMIT = 0;
	endcase
end

always @(posedge CLK)
begin
	 if (~RESETN)
		begin
			BUFF = 1'b0;
			CNT_SOUND = 0;
		end
	 else
		 begin
			if (CNT_SOUND >= LIMIT)
				begin
				 CNT_SOUND = 0;
				 BUFF = ~ BUFF;
				end
			else
				CNT_SOUND = CNT_SOUND + 1;
	    end
end

assign PIEZO = BUFF;

endmodule