`timescale 1ns / 1ps

module button_inpt(
input b1,b2,b3,b4,b5,
input clock,
output s
    );
    wire a1,a2,a3,a4,a5;
    wire c;
   reg [10:0] code ;
    button bt1(clock,b1,a1);
    button bt2(clock,b2,a2);
    button bt3(clock,b3,a3);
    button bt4(clock,b4,a4);
    button bt5(clock,b5,a5);
    
    always @(*)
   begin
     case({a5,a4,a3,a2,a1})
    5'b00001 : code=11'b11000000111;
    5'b00010 : code=11'b11000000111;
    5'b00100 : code=11'b11000000100;
    5'b01000 : code=11'b11000000000;
    5'b10000 : code=11'b00000000000;
    default : code=11'b00000000000;
    endcase
    end
    
    assign c=a1||a2||a3||a4||a5;
    manchester m(c,clock,code,s);
endmodule

