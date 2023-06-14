
`timescale 1ns/1ps

module yolo_rst_if
#(parameter
    RESET_ACTIVE_LOW = 0
)(
    input  wire din,
    output wire dout
);

assign dout = (RESET_ACTIVE_LOW == 1) ? ~din : din;

endmodule  // filter_rst_if

