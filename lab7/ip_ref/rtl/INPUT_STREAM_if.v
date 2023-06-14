// ============================================================================
// Designer : Cheng Chunwen
// Create   : 2014.05.03
// Ver      : 1.0
// Func     : Sobel Filter AXI STREAM Interafce
//
// History  :
//   2016.03.30 v1.1 by cwcheng
// ============================================================================

`timescale 1ns/1ps

module INPUT_STREAM_if
#(
    parameter TBITS = 32 ,
    parameter TBYTE = 4
)(
    // AXI4-Stream singals
    input  wire             ACLK,
    input  wire             ARESETN,
    input  wire             TVALID,
    output wire             TREADY,
    input  wire [TBITS-1:0] TDATA,
    input  wire [TBYTE-1:0] TKEEP,
    input  wire [1-1:0]     TLAST,
    input  wire [1-1:0]     TUSER,

    // User signals
    output wire [TBITS-1:0] isif_data_dout,
    output wire [TBYTE-1:0] isif_strb_dout,
    output wire [1-1:0]     isif_last_dout,
    output wire [1-1:0]     isif_user_dout,
    output wire             isif_empty_n,
    input  wire             isif_read
);


//------------------------Local signal-------------------
// FIFO
wire             fifo_write;
wire             fifo_full_n;
wire [TBITS+TBYTE+2-1:0] isif_din;
wire [TBITS+TBYTE+2-1:0] isif_dout;
// register slice
wire          s_valid;
wire          s_ready;
wire [TBITS+TBYTE+2-1:0] s_data;  //32+4+1+1
wire          m_valid;
wire          m_ready;
wire [TBITS+TBYTE+2-1:0] m_data;

//------------------------Instantiation------------------
// rs
INPUT_STREAM_reg_slice #(
    .N       ( TBITS+TBYTE+2 )
) rs (
    .clk     ( ACLK ),
    .rstn    ( ARESETN ),
    .s_data  ( s_data ),
    .s_valid ( s_valid ),
    .s_ready ( s_ready ),
    .m_data  ( m_data ),
    .m_valid ( m_valid ),
    .m_ready ( m_ready )
);

// isif_fifo
INPUT_STREAM_fifo #(
    .DATA_BITS  ( TBITS+TBYTE+2 ),
    .DEPTH_BITS ( 4 )
) isif_fifo (
    .clk        ( ACLK ),
    .rstn       ( ARESETN ),
    .empty_n    ( isif_empty_n ),
    .full_n     ( fifo_full_n ),
    .read       ( isif_read ),
    .write      ( fifo_write ),
    .dout       ( isif_dout ),
    .din        ( isif_din )
);

//------------------------Body---------------------------
//++++++++++++++++++++++++AXI4-Stream++++++++++++++++++++
assign TREADY = s_ready;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++Reigister Slice++++++++++++++++
assign s_valid = TVALID;
assign m_ready = fifo_full_n;
assign s_data  = {TUSER, TLAST, TKEEP, TDATA};

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

//++++++++++++++++++++++++FIFO+++++++++++++++++++++++++++
assign fifo_write     = fifo_full_n & m_valid;
assign isif_din       = m_data;
assign isif_data_dout = isif_dout[TBITS-1:0];
assign isif_strb_dout = isif_dout[TBITS+TBYTE-1:TBITS];
assign isif_last_dout = isif_dout[TBITS+TBYTE:TBITS+TBYTE];
assign isif_user_dout = isif_dout[TBITS+TBYTE+1:TBITS+TBYTE+1];

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

endmodule  // INPUT_STREAM_if


`timescale 1ns/1ps

module INPUT_STREAM_fifo
#(parameter
    DATA_BITS  = 8,
    DEPTH_BITS = 4
)(
    input  wire                 clk,
    input  wire                 rstn,
    output wire                 empty_n,
    output wire                 full_n,
    input  wire                 read,
    input  wire                 write,
    output wire [DATA_BITS-1:0] dout,
    input  wire [DATA_BITS-1:0] din
);
//------------------------Parameter----------------------
localparam
    DEPTH = 1 << DEPTH_BITS;
//------------------------Local signal-------------------
reg                   empty;
reg                   full;
reg  [DEPTH_BITS-1:0] index;
reg  [DATA_BITS-1:0]  mem[0:DEPTH-1];
//------------------------Body---------------------------
assign empty_n = ~empty;
assign full_n  = ~full;
assign dout    = mem[index];

// empty
always @(posedge clk or negedge rstn) begin
    if (~rstn)
        empty <= 1'b1;
    else if (empty & write & ~read)
        empty <= 1'b0;
    else if (~empty & ~write & read & (index==1'b0))
        empty <= 1'b1;
end

// full
always @(posedge clk or negedge rstn) begin
    if (~rstn)
        full <= 1'b0;
    else if (full & read & ~write)
        full <= 1'b0;
    else if (~full & ~read & write & (index==DEPTH-2'd2))
        full <= 1'b1;
end

// index
always @(posedge clk or negedge rstn) begin
    if (~rstn)
        index <= {DEPTH_BITS{1'b1}};
    else if (~empty & ~write & read)
        index <= index - 1'b1;
    else if (~full & ~read & write)
        index <= index + 1'b1;
end

// mem
always @(posedge clk) begin
    if (~full & write) mem[0] <= din;
end

genvar i;
generate
    for (i = 1; i < DEPTH; i = i + 1) begin : gen_sr
        always @(posedge clk) begin
            if (~full & write) mem[i] <= mem[i-1];
        end
    end
endgenerate

endmodule  // INPUT_STREAM_fifo



`timescale 1ns/1ps

module INPUT_STREAM_reg_slice
#(parameter
    N = 8   // data width
) (
    // system signals
    input  wire         clk,
    input  wire         rstn,
    // slave side
    input  wire [N-1:0] s_data,
    input  wire         s_valid,
    output wire         s_ready,
    // master side
    output wire [N-1:0] m_data,
    output wire         m_valid,
    input  wire         m_ready
);
//------------------------Parameter----------------------
// state
localparam [1:0]
    ZERO = 2'b10,
    ONE  = 2'b11,
    TWO  = 2'b01;
//------------------------Local signal-------------------
reg  [N-1:0] data_p1;
reg  [N-1:0] data_p2;
wire         load_p1;
wire         load_p2;
wire         load_p1_from_p2;
reg          s_ready_t;
reg  [1:0]   state;
reg  [1:0]   next;
//------------------------Body---------------------------
assign s_ready = s_ready_t;
assign m_data  = data_p1;
assign m_valid = state[0];

assign load_p1 = (state == ZERO && s_valid) ||
                 (state == ONE && s_valid && m_ready) ||
                 (state == TWO && m_ready);
assign load_p2 = s_valid & s_ready;
assign load_p1_from_p2 = (state == TWO);

// data_p1
always @(posedge clk) begin
    if (load_p1) begin
        if (load_p1_from_p2)
            data_p1 <= data_p2;
        else
            data_p1 <= s_data;
    end
end

// data_p2
always @(posedge clk) begin
    if (load_p2) data_p2 <= s_data;
end

// s_ready_t
always @(posedge clk) begin
    if (~rstn)
        s_ready_t <= 1'b0;
    else if (state == ZERO)
        s_ready_t <= 1'b1;
    else if (state == ONE && next == TWO)
        s_ready_t <= 1'b0;
    else if (state == TWO && next == ONE)
        s_ready_t <= 1'b1;
end

// state
always @(posedge clk) begin
    if (~rstn)
        state <= ZERO;
    else
        state <= next;
end

// next
always @(*) begin
    case (state)
        ZERO:
            if (s_valid & s_ready)
                next = ONE;
            else
                next = ZERO;
        ONE:
            if (~s_valid & m_ready)
                next = ZERO;
            else if (s_valid & ~m_ready)
                next = TWO;
            else
                next = ONE;
        TWO:
            if (m_ready)
                next = ONE;
            else
                next = TWO;
        default:
            next = ZERO;
    endcase
end

endmodule  // INPUT_STREAM_reg_slice