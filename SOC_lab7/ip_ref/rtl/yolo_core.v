// ============================================================================
// Copyright (C) 2019 NARLabs TSRI. All rights reserved.
//
// Designer : Liu Yi-Jun
// Date     : 2019.08.20
// Ver      : 1.0
// Module   : yolo_core
// Func     : 
//            1.) Bypass 
// 
//
//
// ============================================================================

`timescale 1 ns / 1 ps

module yolo_core #(
        parameter TBITS = 32 ,
        parameter TBYTE = 4
) (

        //
        input  wire [TBITS-1:0] isif_data_dout ,  // {last,user,strb,data}
        input  wire [TBYTE-1:0] isif_strb_dout ,
        input  wire [1 - 1:0]   isif_last_dout ,  // eol
        input  wire [1 - 1:0]   isif_user_dout ,  // sof
        input  wire             isif_empty_n ,
        output wire             isif_read ,

        //
        output wire [TBITS-1:0] osif_data_din ,
        output wire [TBYTE-1:0] osif_strb_din ,
        output wire [1 - 1:0]   osif_last_din ,
        output wire [1 - 1:0]   osif_user_din ,
        input  wire             osif_full_n ,
        output wire             osif_write ,

        output wire [0:0] clk_check;

        //
        input  wire             rst ,
        input  wire             clk
);  // filter_core


// ============================================================================
// Parameter
//

// ============================================================================
// local signal
//
// ISIF
wire                    s_is_empty_n;
wire                    s_is_read;
wire                    s_is_xfer;

// OSIF
wire                    s_os_full_n;
wire                    s_os_xfer;
// ============================================================================
// Body
//


assign clk_check = clk;




wire                    xfer_en;

assign s_is_empty_n = isif_empty_n;
assign s_os_full_n = osif_full_n;
assign xfer_en = s_is_empty_n & s_os_full_n;
assign s_is_xfer = 0;
assign s_os_xfer = 0;

assign isif_read = xfer_en;

assign osif_write = xfer_en;

assign osif_data_din = isif_data_dout;
assign osif_strb_din = isif_strb_dout;
assign osif_last_din = isif_last_dout;
assign osif_user_din = isif_user_dout;

endmodule  // filter_rgb2y

