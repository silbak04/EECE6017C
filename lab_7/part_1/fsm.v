`timescale 1 ns / 100 ps

/*--==========================================================================--*/
//--================================= VERILOG ==================================--
//--============================================================================--
//--                                                                            --
//-- FILE NAME: fsm.v                                                           --
//--                                                                            --
//-- DATE: 9/10/2012                                                            --
//--                                                                            --
//-- DESIGNER: Samir Silbak                                                     --
//--           silbak04@gmail.com                                               --
//--                                                                            --
//-- DESCRIPTION: finite state machine                                          --
//--                                                                            --
//--============================================================================--
//--================================= VERILOG ==================================--
/*--===========================================================================--*/

module fsm (
    input clk, w, rst,
    output z 
);
    /* output of each state machine */
    wire a_out, b_out, c_out, d_out, e_out,
         f_out, g_out, h_out, i_out;

    /* finite state machine */
    assign a_s = rst;
    assign b_s = (~w) & (a_out | f_out | g_out | h_out | i_out) & (~b_out);
    assign c_s = b_out & (~w) & ~c_out;
    assign d_s = c_out & (~w) & ~d_out;
    assign e_s = (d_out & (~w)) | (e_out & (~w));
    assign f_s = (w) & (a_out | b_out | c_out | d_out | e_out) & (~f_out);
    assign g_s = f_out & (w) & ~g_out;
    assign h_s = g_out & (w) & ~h_out;
    assign i_s = h_out & (w);

    assign z = e_out | i_out;

    /* instantiate d flip flops */
    d_fflop a (clk, 0, a_s, a_out);
    d_fflop b (clk, rst, b_s, b_out);
    d_fflop c (clk, rst, c_s, c_out);
    d_fflop d (clk, rst, d_s, d_out);
    d_fflop e (clk, rst, e_s, e_out);
    d_fflop f (clk, rst, f_s, f_out);
    d_fflop g (clk, rst, g_s, g_out);
    d_fflop h (clk, rst, h_s, h_out);
    d_fflop i (clk, rst, i_s, i_out);

endmodule
