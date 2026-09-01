`timescale 1ns/1ns
module tb_smg_static();
reg sys_clk;
reg sys_rst_n;
wire ds;
wire shcp;
wire stcp;
wire oe;
initial 
begin
sys_clk=1'b1;
sys_rst_n<=1'b0;
#15
sys_rst_n<=1'b1;
end
always #10 sys_clk=~sys_clk;
defparam smg_static_inst.begin_in_inst.cnt_500ms_max=10;
//顶层模块实例化中的子模块实例化中的参数修改
smg_static smg_static_inst
(.sys_clk(sys_clk),
.sys_rst_n(sys_rst_n),
.ds(ds),
.shcp(shcp),
.stcp(stcp),
.oe(oe));
endmodule