// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module xFGradientX3x3_0_0_s (
        ap_ready,
        t0_V,
        t2_V,
        m0_V,
        m2_V,
        b0_V,
        b2_V,
        ap_return
);


output   ap_ready;
input  [7:0] t0_V;
input  [7:0] t2_V;
input  [7:0] m0_V;
input  [7:0] m2_V;
input  [7:0] b0_V;
input  [7:0] b2_V;
output  [7:0] ap_return;

wire   [8:0] M00_fu_70_p3;
wire   [8:0] M01_fu_82_p3;
wire   [8:0] lhs_V_fu_94_p1;
wire   [8:0] rhs_V_fu_98_p1;
wire   [8:0] ret_V_fu_102_p2;
wire   [8:0] lhs_V_2_fu_112_p1;
wire   [8:0] rhs_V_2_fu_116_p1;
wire   [8:0] ret_V_2_fu_120_p2;
wire   [9:0] zext_ln69_fu_90_p1;
wire   [9:0] zext_ln68_fu_78_p1;
wire   [9:0] out_pix_7_fu_130_p2;
wire   [10:0] zext_ln70_fu_108_p1;
wire  signed [10:0] sext_ln74_fu_136_p1;
wire   [10:0] out_pix_8_fu_140_p2;
wire   [10:0] zext_ln71_fu_126_p1;
wire   [10:0] out_pix_fu_146_p2;
wire   [2:0] tmp_2_fu_164_p4;
wire   [0:0] tmp_fu_156_p3;
wire   [0:0] xor_ln82_fu_180_p2;
wire   [0:0] icmp_ln86_fu_174_p2;
wire   [0:0] or_ln82_fu_194_p2;
wire   [7:0] select_ln82_fu_186_p3;
wire   [7:0] g_x_V_fu_152_p1;

assign M00_fu_70_p3 = {{m0_V}, {1'd0}};

assign M01_fu_82_p3 = {{m2_V}, {1'd0}};

assign ap_ready = 1'b1;

assign ap_return = ((or_ln82_fu_194_p2[0:0] === 1'b1) ? select_ln82_fu_186_p3 : g_x_V_fu_152_p1);

assign g_x_V_fu_152_p1 = out_pix_fu_146_p2[7:0];

assign icmp_ln86_fu_174_p2 = (($signed(tmp_2_fu_164_p4) > $signed(3'd0)) ? 1'b1 : 1'b0);

assign lhs_V_2_fu_112_p1 = t0_V;

assign lhs_V_fu_94_p1 = t2_V;

assign or_ln82_fu_194_p2 = (tmp_fu_156_p3 | icmp_ln86_fu_174_p2);

assign out_pix_7_fu_130_p2 = (zext_ln69_fu_90_p1 - zext_ln68_fu_78_p1);

assign out_pix_8_fu_140_p2 = ($signed(zext_ln70_fu_108_p1) + $signed(sext_ln74_fu_136_p1));

assign out_pix_fu_146_p2 = (out_pix_8_fu_140_p2 - zext_ln71_fu_126_p1);

assign ret_V_2_fu_120_p2 = (lhs_V_2_fu_112_p1 + rhs_V_2_fu_116_p1);

assign ret_V_fu_102_p2 = (lhs_V_fu_94_p1 + rhs_V_fu_98_p1);

assign rhs_V_2_fu_116_p1 = b0_V;

assign rhs_V_fu_98_p1 = b2_V;

assign select_ln82_fu_186_p3 = ((xor_ln82_fu_180_p2[0:0] === 1'b1) ? 8'd255 : 8'd0);

assign sext_ln74_fu_136_p1 = $signed(out_pix_7_fu_130_p2);

assign tmp_2_fu_164_p4 = {{out_pix_fu_146_p2[10:8]}};

assign tmp_fu_156_p3 = out_pix_fu_146_p2[32'd10];

assign xor_ln82_fu_180_p2 = (tmp_fu_156_p3 ^ 1'd1);

assign zext_ln68_fu_78_p1 = M00_fu_70_p3;

assign zext_ln69_fu_90_p1 = M01_fu_82_p3;

assign zext_ln70_fu_108_p1 = ret_V_fu_102_p2;

assign zext_ln71_fu_126_p1 = ret_V_2_fu_120_p2;

endmodule //xFGradientX3x3_0_0_s
