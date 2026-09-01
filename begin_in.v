module begin_in
#(parameter cnt_500ms_max=25'd24_999_999)
(input wire sys_clk,
input wire sys_rst_n,
output reg [5:0] sel,
output reg [7:0] seg);
reg [24:0] cnt_500ms;
reg cnt_flag;
reg [3:0] count_1;
always @ (posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n==1'b0)
cnt_500ms<=25'd0;
else if(cnt_500ms==cnt_500ms_max)
cnt_500ms<=25'd0;
else 
cnt_500ms<=cnt_500ms+25'd1;
always @ (posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n==1'b0)
cnt_flag<=1'b0;
else if(cnt_500ms==cnt_500ms_max-25'd1)
cnt_flag<=1'b1;
else 
cnt_flag<=1'b0;
always @ (posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n==1'b0)
count_1<=4'd0;
else if((count_1==4'd15)&&(cnt_flag==1'b1))
count_1<=4'd0;
else if(cnt_flag==1'b1)
count_1<=count_1+4'd1;
else count_1<=count_1;
always @ (posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n==1'b0)
seg<=8'hc0;
else case(count_1)
4'd0:seg<=8'hc0;
4'd1:seg<=8'hf9;
4'd2:seg<=8'ha4;
4'd3:seg<=8'hb0;
4'd4:seg<=8'h99;
4'd5:seg<=8'h92;
4'd6:seg<=8'h82;
4'd7:seg<=8'hf8;
4'd8:seg<=8'h80;
4'd9:seg<=8'h90;
4'd10:seg<=8'h88;
4'd11:seg<=8'h83;
4'd12:seg<=8'hc6;
4'd13:seg<=8'ha1;
4'd14:seg<=8'h86;
4'd15:seg<=8'h8e;
default:seg<=8'hc0;
endcase
always  @ (posedge sys_clk or negedge sys_rst_n)
if(sys_rst_n==1'b0)
sel<=6'b111_111;
else 
sel<=6'b000_000;
endmodule