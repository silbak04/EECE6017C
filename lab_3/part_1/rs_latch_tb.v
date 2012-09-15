`timescale 1 ns / 100 ps

/*--==========================================================================--*/
//--=============================== TEST BENCH =================================--
//--============================================================================--
//--                                                                            --
//-- FILE NAME: rs_latch_tb.v                                                   --
//--                                                                            --
//-- DATE: 9/10/2012                                                            --
//--                                                                            --
//-- DESIGNER: Samir Silbak                                                     --
//--           silbak04@gmail.com                                               --
//--                                                                            --
//-- DESCRIPTION: tests rs latch                                                --
//--                                                                            --
//--============================================================================--
//--=============================== TEST BENCH =================================--
/*--===========================================================================--*/

module rs_latch_tb();

    /* I/Os */
    reg clk, R, S;
    wire q_out;

    /* instantiate the device under test */
    rs_latch dut (
        .clk(clk),
        .R(R),
        .S(S),
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
        $monitor ($time, " R=%b, S=%b, q_out=%b ", R, S, q_out);

        /* initialize inputs */
        clk = 0;
        R = 0;
        S = 0;

        @(negedge clk);
        R = 1'b0;
        S = 1'b0;

        @(negedge clk);
        R = 1'b1;
        S = 1'b0;

        @(negedge clk);
        R = 1'b0;
        S = 1'b1;

        #200;

        /* finish simulation */
        $stop;

    end

endmodule
