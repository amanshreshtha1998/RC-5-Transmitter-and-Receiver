`timescale 1ns / 1ps

module shift_register(
input clk,reset,load,
input [27:0] din,
output reg dout
    );
wire clk_div;
reg [27:0] data;
clkdiv2 c1 (clk_div,clk,reset);
always@(posedge(clk_div),posedge(reset),posedge(load))
begin
if(reset)
dout<=1'b0;
else if(load)
data<=din;
else
begin
dout<=data[27];
data<={data[26:0],1'b0};
end
end

endmodule

