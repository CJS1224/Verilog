module M81(iData, iSelect, oData);
	input [7:0]iData;
	input [2:0]iSelect;
	output oData;
	eight_to_1(iData, oData, iSelect);
endmodule
 
module eight_to_1(iData, oData, iSelect);
	input [7:0]iData;
	input [2:0]iSelect;
 
	output reg oData;
	always@(iSelect)
	begin
		case(iSelect)
			3'b000: oData=iData[0];
			3'b001: oData=iData[1];
			3'b010: oData=iData[2];
			3'b011: oData=1'b0;
			3'b100: oData=1'b0;
			3'b101: oData=iData[5];
			3'b110: oData=1'b0;
			3'b111: oData=1'b0;
			default: oData=1'b0;
		endcase
	end
 
endmodule
