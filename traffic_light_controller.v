module traffic_light_controller(input clk,rst, output reg red, output reg green,output reg yellow, output reg [3:0] count);
parameter IDLE = 2'd00 ;
parameter STOP = 2'd01;
parameter WAIT = 2'd10;
parameter GO = 2'd11;
reg [1:0] light_mode;
always@(posedge clk or negedge rst) begin
if(!rst) begin
light_mode <= IDLE;
count <= 0;
{red,green,yellow} <= {1'b0,1'b0,1'b0};
end
else
begin
case(light_mode) 
IDLE:begin count <= 0; light_mode <= STOP;{red,green,yellow} <= {1'b1,1'b0,1'b0};end 
STOP:begin if(count < 4'd7)begin count <= count+1;end else begin light_mode <= WAIT; count<=0;{red,green,yellow} <= {1'b0,1'b0,1'b1};end end 
WAIT:begin if(count < 4'd7)begin count <= count+1;end else begin light_mode <= GO; count<=0;{red,green,yellow} <= {1'b0,1'b1,1'b0};end end 
GO:begin if(count < 4'd7)begin count <= count+1;end else begin light_mode <= STOP; count<=0;{red,green,yellow} <= {1'b1,1'b0,1'b0};end end
default:
{red,green,yellow} <= {1'b0,1'b0,1'b0};
endcase
end
end
endmodule