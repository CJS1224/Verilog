module encoder_4to2(IN, OUT, ENABLE) ;
    input ENABLE ;
    input [3:0] IN ;
    output reg [1:0] OUT ;
    always @ (IN)
    begin
        if(~ENABLE)
        begin
            case(IN)
                4'b1110 : OUT = 2'b00 ;
                4'b1101 : OUT = 2'b01 ;
                4'b1011 : OUT = 2'b10 ;
                4'b0111 : OUT = 2'b11 ;
            endcase
        end
    end
endmodule
