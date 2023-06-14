// ============================================================================
// Copyright (C) 2019 NARLabs TSRI. All rights reserved.
//
// Designer : Liu Yi-Jun
// Date     : 2019.10.31
// Ver      : 1.2
// Module   : yolo_core
// Func     : 
//            1.) Bypass  
//            2.) adder: incoming every two operand, output one result
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
        input  wire [1 - 1:0]   isif_last_dout ,  // 
        input  wire [1 - 1:0]   isif_user_dout ,  // 
        input  wire             isif_empty_n ,
        output wire             isif_read ,

        //
        output wire [TBITS-1:0] osif_data_din ,
        output wire [TBYTE-1:0] osif_strb_din ,
        output wire [1 - 1:0]   osif_last_din ,
        output wire [1 - 1:0]   osif_user_din ,
        input  wire             osif_full_n ,
        output wire             osif_write ,

        //
        input  wire             rst ,
        input  wire             clk
);  // filter_core



// ============================================================================
// local signal
//
// 
// ============================================================================
// Body
//


reg  [0:0] cnt; 
wire [TBITS-1:0] opA;
reg  [TBITS-1:0] opB;
wire  [TBITS-1:0] result;
wire  xfer_en;

assign xfer_en = isif_empty_n & osif_full_n ;

assign opA = isif_data_dout ;

assign result = opA + opB ;

assign osif_data_din = result ;

assign osif_write = cnt[0] & xfer_en ;

assign isif_read =  xfer_en ;                     

assign osif_last_din =  isif_last_dout ;

assign osif_user_din = 0 ;

assign osif_strb_din = {TBYTE{1'b1}};
        
always @ (posedge clk)
    if(rst || isif_last_dout)
        opB <= 'h0 ;
    else 
        opB <= opA ;    


always @ (posedge clk)
    if(rst)
        cnt <= 0 ;
    else if (xfer_en)
        cnt <= cnt + 1 ;    
    else
        cnt <= cnt ;

endmodule  

