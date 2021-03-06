/*--==========================================================================--*/
//--================================ VERILOG ===================================--
//--============================================================================--
//--                                                                            --
//-- FILE NAME: top.v                                                           --
//--                                                                            --
//-- DATE: 9/10/2012                                                            --
//--                                                                            --
//-- DESIGNER: Samir Silbak                                                     --
//--           silbak04@gmail.com                                               --
//--                                                                            --
//-- DESCRIPTION: instantiates two d latches                                    --
//--                                                                            --
//--============================================================================--
//--================================ VERILOG ===================================--
/*--===========================================================================--*/

module top (
    input clk, d,
    output q_out
);

    wire q_master;

    /* master d_latch */
    d_latch master(
        .clk(~clk),
        .d(d),
        .q_out(q_master)
    );

    /* slave d_latch */
    d_latch slave(
        .clk(clk),
        .d(q_master),
        .q_out(q_out)
    );

endmodule
