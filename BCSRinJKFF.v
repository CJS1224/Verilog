module JK_FF(J, K, Q, _Q, CLK) ; // positive edge
    input J, K ;
    input CLK ;
    output reg Q, _Q ;
    always @ (posedge CLK)
    begin
        if(J == 0 & K == 1) Q = 0 ;
        if(J == 1 & K == 0) Q = 1 ;
        if(J == 1 & K == 1) Q = ~Q ;
        _Q = ~Q ;
    end
endmodule

module BCSR(pre, IN, LED, CLK) ;
    input pre ;
    input CLK ;
    input [3:0] IN ;
    output [3:0] LED ;
    wire [3:0] Q ;
    wire [3:0] _Q ;
    reg[3:0] temp ;
    always @ (negedge CLK)
    begin
        temp = Q ;
        if(pre) temp = IN ;
    end
    JK_FF JK0(temp[3], ~temp[3], Q[0], _Q[0], CLK) ;
    JK_FF JK1(temp[0], ~temp[0], Q[1], _Q[1], CLK) ;
    JK_FF JK2(temp[1], ~temp[1], Q[2], _Q[2], CLK) ;
    JK_FF JK3(temp[2], ~temp[2], Q[3], _Q[3], CLK) ;
    assign LED = temp ;
endmodule
