`timescale 1ns / 1ps

module t_manchester;
reg a,clk;
reg [10:0] code;
wire dout;
manchester m_1 (a,clk,code,dout);
always #5 clk=~clk;
initial begin
code=11'b11001101010;
end

initial begin
clk=1'b0;
end
initial fork
a=0;
#1000 a=1;
#30000000 a=0;
#50000000 a=1;
#100000000 a=0; 
#110000000 a=1;
join

endmodule

