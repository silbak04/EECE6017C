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

    /* registers */
    reg clk, d;
    wire q_a, q_b, q_c;

    /* instantiate the device under test */
    top dut (
        .clk(clk),
        .d(d),
        .q_a(q_a),
        .q_b(q_b),
        .q_c(q_c)
    );

    /*--==========================================================--*/
    /*--==================== ALWAYS BLOCK ========================--*/
    /*--==========================================================--*/

    always 

        /* every 40 nano seconds invert the clock */
        #40 clk = ~clk;

    /*--==========================================================--*/
    /*--==================== INITIAL BLOCK =======================--*/
    /*--==========================================================--*/

    initial begin 

        /* display time when simulation first starts */
        $display ($time, " << starting simulation >> ");

        /* monitor inputs during each time frame */
        $monitor ($time, " d=%b, q_a=%b, q_b=%b, q_c=%b ", d, q_a, q_b, q_c);

        /* initialize inputs */
        clk = 1'b0;
        d = 0;

        /* match timing diagram in Figure 6 */
        #30 d = 1;
        #20 d = 0;
        #10 d = 1;
        #10 d = 0;
        #15 d = 1;
        #12 d = 0;
        #8  d = 1;
        #8  d = 0;
        #16 d = 1;
        #8  d = 0;
        #8  d = 1;
        #24 d = 0;

        #200;

        /* finish simulation */
        $stop;

    end

endmodule
