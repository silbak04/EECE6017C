`timescale 1 ns / 100 ps

/*--==========================================================================--*/
//--=============================== TEST BENCH =================================--
//--============================================================================--
//--                                                                            --
//-- FILE NAME: fsm_tb.v                                                        --
//--                                                                            --
//-- DATE: 9/10/2012                                                            --
//--                                                                            --
//-- DESIGNER: Samir Silbak                                                     --
//--           silbak04@gmail.com                                               --
//--                                                                            --
//-- DESCRIPTION: tests finite state machine                                    --
//--                                                                            --
//--============================================================================--
//--=============================== TEST BENCH =================================--
/*--===========================================================================--*/

module fsm_tb();

    /* I/Os */
    reg clk, rst, w;
    wire z;

    /* instantiate the device under test */
    fsm dut (
        .clk(clk),
        .rst(rst),
        .w(w),
        .z(z)
    );

    /*--==========================================================--*/
    /*--==================== ALWAYS BLOCK ========================--*/
    /*--==========================================================--*/

    always 

        /* every 20 nano seconds invert the clock */
        #20 clk = ~clk;

    /*--==========================================================--*/
    /*--==================== INITIAL BLOCK =======================--*/
    /*--==========================================================--*/

    initial begin 

        /* display time when simulation first starts */
        $display ($time, " << starting simulation >> ");

        /* monitor inputs during each time frame */
        $monitor ($time, " w=%b, z=%b ", w, z);

        /* initialize inputs */
        clk = 0;
        w = 0;
        rst = 1;

        #10 rst = ~rst;

        /* replicate timing diagram in Figure 1 */
        #130 w = 1;
        #50 w = 0;
        #210 w = 1;
        #250 w = 0;

        /* finish simulation */
        $stop;

    end

endmodule
