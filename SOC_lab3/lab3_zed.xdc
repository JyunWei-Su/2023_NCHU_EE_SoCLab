############################
# On-board LED             #
############################
set_property PACKAGE_PIN T22 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property PACKAGE_PIN T21 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property PACKAGE_PIN U22 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property PACKAGE_PIN U21 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property PACKAGE_PIN V22 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
set_property PACKAGE_PIN W22 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
set_property PACKAGE_PIN U19 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
set_property PACKAGE_PIN U14 [get_ports {LED[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[7]}]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 4 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER true [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list system_i/processing_system7_0/inst/FCLK_CLK0]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {system_i/led_ip_LED[0]} {system_i/led_ip_LED[1]} {system_i/led_ip_LED[2]} {system_i/led_ip_LED[3]} {system_i/led_ip_LED[4]} {system_i/led_ip_LED[5]} {system_i/led_ip_LED[6]} {system_i/led_ip_LED[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[0]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[1]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[2]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[3]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[4]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[5]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[6]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[7]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[8]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[9]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[10]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[11]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[12]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[13]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[14]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[15]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[16]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[17]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[18]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[19]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[20]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[21]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[22]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[23]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[24]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[25]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[26]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[27]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[28]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[29]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[30]} {system_i/ps7_0_axi_periph_M02_AXI_AWADDR[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {system_i/switches_GPIO_TRI_I[0]} {system_i/switches_GPIO_TRI_I[1]} {system_i/switches_GPIO_TRI_I[2]} {system_i/switches_GPIO_TRI_I[3]} {system_i/switches_GPIO_TRI_I[4]} {system_i/switches_GPIO_TRI_I[5]} {system_i/switches_GPIO_TRI_I[6]} {system_i/switches_GPIO_TRI_I[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 4 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {system_i/ps7_0_axi_periph_M02_AXI_WSTRB[0]} {system_i/ps7_0_axi_periph_M02_AXI_WSTRB[1]} {system_i/ps7_0_axi_periph_M02_AXI_WSTRB[2]} {system_i/ps7_0_axi_periph_M02_AXI_WSTRB[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 2 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {system_i/ps7_0_axi_periph_M00_AXI_BRESP[0]} {system_i/ps7_0_axi_periph_M00_AXI_BRESP[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[0]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[1]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[2]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[3]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[4]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[5]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[6]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[7]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[8]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[9]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[10]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[11]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[12]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[13]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[14]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[15]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[16]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[17]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[18]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[19]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[20]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[21]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[22]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[23]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[24]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[25]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[26]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[27]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[28]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[29]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[30]} {system_i/ps7_0_axi_periph_M00_AXI_ARADDR[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 32 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[0]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[1]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[2]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[3]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[4]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[5]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[6]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[7]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[8]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[9]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[10]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[11]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[12]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[13]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[14]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[15]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[16]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[17]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[18]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[19]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[20]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[21]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[22]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[23]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[24]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[25]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[26]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[27]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[28]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[29]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[30]} {system_i/ps7_0_axi_periph_M02_AXI_ARADDR[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {system_i/ps7_0_axi_periph_M02_AXI_WDATA[0]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[1]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[2]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[3]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[4]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[5]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[6]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[7]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[8]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[9]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[10]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[11]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[12]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[13]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[14]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[15]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[16]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[17]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[18]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[19]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[20]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[21]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[22]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[23]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[24]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[25]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[26]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[27]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[28]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[29]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[30]} {system_i/ps7_0_axi_periph_M02_AXI_WDATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 32 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {system_i/ps7_0_axi_periph_M00_AXI_RDATA[0]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[1]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[2]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[3]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[4]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[5]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[6]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[7]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[8]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[9]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[10]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[11]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[12]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[13]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[14]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[15]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[16]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[17]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[18]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[19]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[20]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[21]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[22]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[23]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[24]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[25]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[26]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[27]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[28]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[29]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[30]} {system_i/ps7_0_axi_periph_M00_AXI_RDATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 3 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {system_i/ps7_0_axi_periph_M02_AXI_AWPROT[0]} {system_i/ps7_0_axi_periph_M02_AXI_AWPROT[1]} {system_i/ps7_0_axi_periph_M02_AXI_AWPROT[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 4 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {system_i/ps7_0_axi_periph_M00_AXI_WSTRB[0]} {system_i/ps7_0_axi_periph_M00_AXI_WSTRB[1]} {system_i/ps7_0_axi_periph_M00_AXI_WSTRB[2]} {system_i/ps7_0_axi_periph_M00_AXI_WSTRB[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 2 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {system_i/ps7_0_axi_periph_M02_AXI_BRESP[0]} {system_i/ps7_0_axi_periph_M02_AXI_BRESP[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 32 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {system_i/ps7_0_axi_periph_M00_AXI_WDATA[0]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[1]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[2]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[3]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[4]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[5]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[6]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[7]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[8]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[9]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[10]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[11]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[12]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[13]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[14]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[15]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[16]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[17]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[18]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[19]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[20]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[21]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[22]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[23]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[24]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[25]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[26]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[27]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[28]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[29]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[30]} {system_i/ps7_0_axi_periph_M00_AXI_WDATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 2 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {system_i/ps7_0_axi_periph_M00_AXI_RRESP[0]} {system_i/ps7_0_axi_periph_M00_AXI_RRESP[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 32 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {system_i/ps7_0_axi_periph_M02_AXI_RDATA[0]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[1]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[2]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[3]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[4]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[5]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[6]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[7]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[8]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[9]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[10]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[11]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[12]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[13]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[14]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[15]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[16]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[17]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[18]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[19]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[20]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[21]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[22]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[23]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[24]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[25]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[26]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[27]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[28]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[29]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[30]} {system_i/ps7_0_axi_periph_M02_AXI_RDATA[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 2 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {system_i/ps7_0_axi_periph_M02_AXI_RRESP[0]} {system_i/ps7_0_axi_periph_M02_AXI_RRESP[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 32 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[0]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[1]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[2]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[3]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[4]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[5]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[6]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[7]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[8]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[9]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[10]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[11]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[12]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[13]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[14]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[15]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[16]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[17]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[18]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[19]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[20]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[21]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[22]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[23]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[24]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[25]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[26]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[27]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[28]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[29]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[30]} {system_i/ps7_0_axi_periph_M00_AXI_AWADDR[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 3 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {system_i/ps7_0_axi_periph_M02_AXI_ARPROT[0]} {system_i/ps7_0_axi_periph_M02_AXI_ARPROT[1]} {system_i/ps7_0_axi_periph_M02_AXI_ARPROT[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list system_i/ps7_0_axi_periph_M00_AXI_ARREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list system_i/ps7_0_axi_periph_M00_AXI_ARVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list system_i/ps7_0_axi_periph_M00_AXI_AWREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list system_i/ps7_0_axi_periph_M00_AXI_AWVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list system_i/ps7_0_axi_periph_M00_AXI_BREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list system_i/ps7_0_axi_periph_M00_AXI_BVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list system_i/ps7_0_axi_periph_M00_AXI_RREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list system_i/ps7_0_axi_periph_M00_AXI_RVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list system_i/ps7_0_axi_periph_M00_AXI_WREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list system_i/ps7_0_axi_periph_M00_AXI_WVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list system_i/ps7_0_axi_periph_M02_AXI_ARREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list system_i/ps7_0_axi_periph_M02_AXI_ARVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list system_i/ps7_0_axi_periph_M02_AXI_AWREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list system_i/ps7_0_axi_periph_M02_AXI_AWVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list system_i/ps7_0_axi_periph_M02_AXI_BREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list system_i/ps7_0_axi_periph_M02_AXI_BVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list system_i/ps7_0_axi_periph_M02_AXI_RREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list system_i/ps7_0_axi_periph_M02_AXI_RVALID]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list system_i/ps7_0_axi_periph_M02_AXI_WREADY]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 1 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list system_i/ps7_0_axi_periph_M02_AXI_WVALID]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_FCLK_CLK0]
