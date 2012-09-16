/*--==========================================================================--*/
//--================================ VERILOG ===================================--
//--============================================================================--
//--                                                                            --
//-- FILE NAME: d_latch.v                                                       --
//--                                                                            --
//-- DATE: 9/10/2012                                                            --
//--                                                                            --
//-- DESIGNER: Samir Silbak                                                     --
//--           silbak04@gmail.com                                               --
//--                                                                            --
//-- DESCRIPTION: d latch                                                       --
//--                                                                            --
//--============================================================================--
//--================================ VERILOG ===================================--
/*--===========================================================================--*/

module d_latch (
    input clk, d,
    output reg q_out
);
    
    always @ (clk, d) 
        q_out = d;

endmodule