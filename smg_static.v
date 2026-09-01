module smg_static
(input wire sys_clk,
input wire sys_rst_n,
output wire ds,
output wire shcp,
output wire stcp,
output wire oe);
wire [5:0] sel;
wire [7:0] seg;//都是连线，都用wire
begin_in
#(.cnt_500ms_max(25'd24_999_999))
begin_in_inst
(.sys_clk(sys_clk),
.sys_rst_n(sys_rst_n),
.sel(sel),
.seg(seg));
final_in final_in_inst
(.sys_clk(sys_clk),
.sys_rst_n(sys_rst_n),
.sel(sel),
.seg(seg),
.ds(ds),
.shcp(shcp),
.stcp(stcp),
.oe(oe));
endmodule