`timescale 1 ns / 100 ps

/*--==========================================================================--*/
//--=============================== TEST BENCH =================================--
//--============================================================================--
//--                                                                            --
//-- FILE NAME: d_latch_tb.v                                                    --
//--                                                                            --
//-- DATE: 9/10/2012                                                            --
//--                                                                            --
//-- DESIGNER: Samir Silbak                                                     --
//--           silbak04@gmail.com                                               --
//--                                                                            --
//-- DESCRIPTION: tests d latch                                                 --
//--                                                                            --
//--============================================================================--
//--=============================== TEST BENCH =================================--
/*--===========================================================================--*/

module d_latch_tb();

    /* I/Os */
    reg clk, d;
    wire q_out;

    /* instantiate the device under test */
    d_latch dut (
        .clk(clk),
        .d(d),
        .q_out(q_out)
    );

    /*--==========================================================--*/
    /*--==================== ALWAYS BLOCK ========================--*/
    /*--==========================================================--*/

    always 

        /* every 30 nano seconds invert the clock */
        #30 clk = ~clk;

    /*--==========================================================--*/
    /*--==================== INITIAL BLOCK =======================--*/
    /*--==========================================================--*/

    initial begin 

        /* display time when simulation first starts */
        $display ($time, " << starting simulation >> ");

        /* monitor inputs during each time frame */
        $monitor ($time, " d=%b, q_out=%b ", d, q_out);

        /* initialize inputs */
        clk = 0;
        d = 0;

        @(negedge clk);
        d = ~d;

        #200;

        /* finish simulation */
        $stop;

    end

endmodule
