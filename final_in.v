module final_in
(input wire sys_clk,
input wire sys_rst_n,
input wire [5:0] sel,
input wire [7:0] seg,
output reg ds,
output reg shcp,
output reg stcp,
output wire oe);
reg [1:0] divide_4;
reg [4:0] count_2;
always @ (posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n==1'b0)
divide_4<=2'd0;
else if(divide_4==2'd3)
divide_4<=2'd0;
else 
divide_4<=divide_4+2'd1;
always  @ (posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n==1'b0)
shcp<=1'b0;
else if(divide_4==2'd1)
shcp<=1'b1;
else if(divide_4==2'd3)
shcp<=1'b0;
else 
shcp<=shcp;
always @ (negedge shcp or negedge sys_rst_n)
if(sys_rst_n==1'b0)
count_2<=4'd0;
else if(count_2==4'd13)
count_2<=4'd0;
else 
count_2<=count_2+4'd1;
always  @ (posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n==1'b0)
ds<=1'b0;
else case(count_2)
4'd6:ds<=seg[0];
4'd7:ds<=seg[1];
4'd8:ds<=seg[2];
4'd9:ds<=seg[3];
4'd10:ds<=seg[4];
4'd11:ds<=seg[5];
4'd12:ds<=seg[6];
4'd13:ds<=seg[7];
4'd0:ds<=sel[5];
4'd1:ds<=sel[4];
4'd2:ds<=sel[3];
4'd3:ds<=sel[2];
4'd4:ds<=sel[1];
4'd5:ds<=sel[0];
default ds<=1'b0;
endcase
always @ (negedge sys_clk or negedge sys_rst_n)
if(sys_rst_n==1'b0)
stcp<=1'b0;
else if((shcp==1'b1)&&(ds==seg[0]))
stcp<=1'b1;
else 
stcp<=1'b0;
assign oe=1'b0;
endmodule