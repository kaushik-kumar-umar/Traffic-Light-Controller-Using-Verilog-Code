`timescale 1ns/1ps
module tb_traffic_light_controller;

reg clk1;
reg rst;
wire red;
wire yellow;
wire green;
wire [3:0] count;
traffic_light_controller dut(.clk(clk1),.rst(rst),.red(red),.yellow(yellow),.green(green),.count(count));
always #5 clk1=~clk1;

initial
begin
$monitor("time=%0t red=%b green=%b yellow=%b count=%4b",
          $time, red, green, yellow, count);
clk1 = 0;
rst = 0;
#10 rst = 1;
#400;
$finish;
end
endmodule
