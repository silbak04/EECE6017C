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
//--                                                                            --
//-- DESCRIPTION: finite state machine test bench                               --
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
        rst = 1;
        w = 0;

        #100 rst = ~rst;

        /* replicate timing diagram in Figure 1 */
        #100 w = 1'b1;
        #40 w = 1'b0;
        #150 w = 1'b1;
        #190 w = 1'b0;

        /* finish simulation */
        $stop;

    end

endmodule
