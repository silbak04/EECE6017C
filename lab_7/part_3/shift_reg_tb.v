`timescale 1 ns / 100 ps

/*--==========================================================================--*/
//--================================ TEST BENCH ================================--
//--============================================================================--
//--                                                                            --
//-- FILE NAME: shift_reg_tb.v                                                  --
//--                                                                            --
//-- DATE: 9/10/2012                                                            --
//--                                                                            --
//-- DESIGNER: Samir Silbak                                                     --
//--           silbak04@gmail.com                                               --
//--                                                                            --
//-- DESCRIPTION: two 4 bit shift registers                                     --
//--                                                                            --
//--============================================================================--
//--================================ TEST BENCH ================================--
/*--===========================================================================--*/

module shift_reg_tb();

    /* I/Os */
    reg clk, rst, w;
    wire z;

    /* instantiate the device under test */
    top dut (
        .clk(clk),
        .rst(rst),
        .w(w),
        .z(z)
    );

    /*--==========================================================--*/
    /*--==================== ALWAYS BLOCK ========================--*/
    /*--==========================================================--*/

    always 

        #5 clk = ~clk;

    /*--==========================================================--*/
    /*--==================== INITIAL BLOCK =======================--*/
    /*--==========================================================--*/

    initial begin 

        /* display time when simulation first starts */
        $display ($time, " << starting simulation >> ");

        /* monitor I/Os during each time frame */
        $monitor ($time, " w=%b, z=%b ", w, z);

        /* initialize inputs */
        clk = 0;
        rst = 1;
        w = 0;

        #100 rst = ~rst;

        /* replicate timing diagram in Figure 1 */
        #20 w = 1;
        #10 w = 0;
        #36 w = 1;
        #50 w = 0;

        #100;

        /* finish simulation */
        $stop;

    end

endmodule
