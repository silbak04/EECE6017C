`timescale 1 ns / 100 ps

/*--==========================================================================--*/
//--================================ TEST BENCH ================================--
//--============================================================================--
//--                                                                            --
//-- FILE NAME: morse_code_tb.v                                                 --
//--                                                                            --
//-- DATE: 9/10/2012                                                            --
//--                                                                            --
//-- DESIGNER: Samir Silbak                                                     --
//--           silbak04@gmail.com                                               --
//--                                                                            --
//-- DESCRIPTION: tests morse code encoder                                      --
//--                                                                            --
//--============================================================================--
//--================================ TEST BENCH ================================--
/*--===========================================================================--*/

module morse_code_tb();

    /* inputs */
    reg clk, rst, transmit;
    reg [3:0] letter;

    /* output */
    wire led;

    /* letters */
    parameter A = 4'b0000;
    parameter B = 4'b0001;
    parameter C = 4'b0010;
    parameter D = 4'b0011;
    parameter E = 4'b0100;
    parameter F = 4'b0101;
    parameter G = 4'b0110;
    parameter H = 4'b0111;

    /* instantiate the device under test */
    top dut (
        .clk(clk),
        .rst(rst),
        .letter(letter),
        .transmit(transmit),
        .led(led)
    );

    /*--==========================================================--*/
    /*--==================== ALWAYS BLOCK ========================--*/
    /*--==========================================================--*/

    always 

        /* every 1 nano second invert the clock */
        #1 clk = ~clk;

    /*--==========================================================--*/
    /*--==================== INITIAL BLOCK =======================--*/
    /*--==========================================================--*/

    initial begin 

        /* display time when simulation first starts */
        $display ($time, " << starting simulation >> ");

        /* monitor inputs during each time frame */
        $monitor ($time, " transmit=%b, led=%b, letter=%b ", transmit, led, letter);

        /* initialize inputs */
        clk = 0;
        rst = 1;
        transmit = 0;

        #50 rst = 0;

        /* load in each letter for testing */
        #50 letter = A;
        transmit = 1;
        #2 transmit = 0;

        #50 letter = B;
        transmit = 1;
        #2 transmit = 0;

        #50 letter = C;
        transmit = 1;
        #2 transmit = 0;

        #50 letter = D;
        transmit = 1;
        #2 transmit = 0;

        #50 letter = E;
        transmit = 1;
        #2 transmit = 0;

        #50 letter = F;
        transmit = 1;
        #2 transmit = 0;

        #50 letter = G;
        transmit = 1;
        #2 transmit = 0;

        #50 letter = H;
        transmit = 1;
        #2 transmit = 0;
        #50;

        /* finish simulation */
        $stop;

    end

endmodule
