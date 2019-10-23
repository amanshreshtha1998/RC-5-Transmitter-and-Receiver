`timescale 1ns / 1ps

module manchester(
input a,clk,
input [10:0] code,
output dout
);
parameter p=28'b0101010101010101010101010101;
localparam c=100;
reg rst;
reg [6:0] count=7'b0000000 ;
 genvar i;
wire [27:0] mcod;
wire load;
wire [27:0] mcode_final;
wire load_in;
wire [13:0] c_code ;
reg t=1'b0;

assign c_code={1'b1,1'b1,t,code};

for(i=0;i<14;i=i+1) begin
assign mcod[2*i]=c_code[i];
assign mcod[2*i+1]=c_code[i];
end
assign mcode_final=~(p^mcod);
always @(negedge a)
begin
// count<=7'b0000000; 
  t=~t;
// rst=1'b1;
end
always @(posedge clk,negedge a)
begin
if(a==0)
rst<=1'b1;
else if(a==1) begin
rst<=1'b0;
end
end
  assign load_in = a && load;
load_clock lk(load,clk,rst);
shift_register sr_1 (clk,rst,load_in,mcode_final,dout);
endmodule

