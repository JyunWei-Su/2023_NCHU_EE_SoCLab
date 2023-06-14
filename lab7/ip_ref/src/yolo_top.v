// ============================================================================
// Designer : Liu Yi-Jun
// Create   : 2019.8.20
// Ver      : 1.0
// Func     : Yolo Top with AXI_DMA
// Func     : AXIS I/O Stream interface for rate adaption
// ============================================================================

`timescale 1 ns / 1 ps

module yolo_top
#(
        parameter TBITS = 64 ,
        parameter TBYTE = 8
) (
        input  wire             S_AXIS_MM2S_TVALID,
        output wire             S_AXIS_MM2S_TREADY,
        input  wire [TBITS-1:0] S_AXIS_MM2S_TDATA,
        input  wire [TBYTE-1:0] S_AXIS_MM2S_TKEEP,
        input  wire [1-1:0]     S_AXIS_MM2S_TLAST,

        output wire             M_AXIS_S2MM_TVALID,
        input  wire             M_AXIS_S2MM_TREADY,
        output wire [TBITS-1:0] M_AXIS_S2MM_TDATA,
        output wire [TBYTE-1:0] M_AXIS_S2MM_TKEEP,
        output wire [1-1:0]     M_AXIS_S2MM_TLAST,  // EOL      
        
        output wire [TBITS-1:0] isif_data_dout,
        output wire [TBYTE-1:0] isif_strb_dout,
        output wire [1 - 1:0]   isif_last_dout,
        output wire [1 - 1:0]   isif_user_dout,
        output wire             isif_empty_n,
        output wire             isif_read,        
        
        output wire [TBITS-1:0] osif_data_din,
        output wire [TBYTE-1:0] osif_strb_din,
        output wire [1 - 1:0]   osif_last_din,
        output wire [1 - 1:0]   osif_user_din,
        output wire             osif_full_n,
        output wire             osif_write,   
        output wire             clk_check,             
        
        input  wire             S_AXIS_MM2S_ACLK,
        input  wire             M_AXIS_S2MM_ACLK,
        input  wire             aclk,
        input  wire             aresetn
);

parameter RESET_ACTIVE_LOW = 1;

//wire [TBITS - 1:0] isif_data_dout;
//wire [TBYTE - 1:0] isif_strb_dout;
//wire [1 - 1:0]     isif_last_dout;
//wire [1 - 1:0]     isif_user_dout;
//wire               isif_empty_n;
//wire               isif_read;

//wire [TBITS - 1:0] osif_data_din;
//wire [TBYTE - 1:0] osif_strb_din;
//wire               osif_full_n;
//wire               osif_write;
//wire [1 - 1:0]     osif_last_din;
//wire [1 - 1:0]     osif_user_din;

wire ap_rst;
assign clk_check = aclk;

// ============================================================================
// Instantiation
//

yolo_core
#(
        .TBITS (TBITS) ,
        .TBYTE (TBYTE)
)
yolo_core_U (
        
        //
        .isif_data_dout ( isif_data_dout ) ,
        .isif_strb_dout ( isif_strb_dout ) ,
        .isif_last_dout ( isif_last_dout ) ,
        .isif_user_dout ( isif_user_dout ) ,
        .isif_empty_n ( isif_empty_n ) ,
        .isif_read ( isif_read ) ,
        //
        .osif_data_din ( osif_data_din ) ,
        .osif_strb_din ( osif_strb_din ) ,
        .osif_last_din ( osif_last_din ) ,
        .osif_user_din ( osif_user_din ) ,
        .osif_full_n ( osif_full_n ) ,
        .osif_write ( osif_write ) ,

        //
        .rst ( ap_rst ) ,
        .clk ( aclk )
);  // yolo_core_U


INPUT_STREAM_if
#(
        .TBITS (TBITS) ,
        .TBYTE (TBYTE)
)
INPUT_STREAM_if_U (

        .ACLK ( S_AXIS_MM2S_ACLK ) ,
        .ARESETN ( aresetn ) ,
        .TVALID ( S_AXIS_MM2S_TVALID ) ,
        .TREADY ( S_AXIS_MM2S_TREADY ) ,
        .TDATA ( S_AXIS_MM2S_TDATA ) ,
        .TKEEP ( S_AXIS_MM2S_TKEEP ) ,
        .TLAST ( S_AXIS_MM2S_TLAST ) ,      
        .TUSER ( 1'b0 ) ,

        .isif_data_dout ( isif_data_dout ) ,
        .isif_strb_dout ( isif_strb_dout ) ,
        .isif_last_dout ( isif_last_dout ) ,
        .isif_user_dout ( isif_user_dout ) ,
        .isif_empty_n ( isif_empty_n ) ,
        .isif_read ( isif_read )
);  // input_stream_if_U

OUTPUT_STREAM_if
#(
        .TBITS (TBITS) ,
        .TBYTE (TBYTE)
)
OUTPUT_STREAM_if_U (

        .ACLK ( M_AXIS_S2MM_ACLK ) ,
        .ARESETN ( aresetn ) ,
        .TVALID ( M_AXIS_S2MM_TVALID ) ,
        .TREADY ( M_AXIS_S2MM_TREADY ) ,
        .TDATA ( M_AXIS_S2MM_TDATA ) ,
        .TKEEP ( M_AXIS_S2MM_TKEEP ) ,
        .TLAST ( M_AXIS_S2MM_TLAST ) ,      
        .TUSER (  ) ,

        .osif_data_din ( osif_data_din ) ,
        .osif_strb_din ( osif_strb_din ) ,
        .osif_last_din ( osif_last_din ) ,
        .osif_user_din ( osif_user_din ) ,
        .osif_full_n ( osif_full_n ) ,
        .osif_write ( osif_write )
);  // output_stream_if_U

yolo_rst_if #(
        .RESET_ACTIVE_LOW ( RESET_ACTIVE_LOW ) )
yolo_rst_if_U(
        .dout ( ap_rst ) ,
        .din ( aresetn ) );  // yolo_rst_if_U

endmodule  // yolo_top
