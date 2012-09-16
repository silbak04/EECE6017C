/*--==========================================================================--*/
//--================================= VERILOG ==================================--
//--============================================================================--
//--                                                                            --
//-- FILE NAME: top.v                                                           --
//--                                                                            --
//-- DATE: 9/10/2012                                                            --
//--                                                                            --
//-- DESIGNER: Samir Silbak                                                     --
//--           silbak04@gmail.com                                               --
//--                                                                            --
//-- DESCRIPTION: morse code encoder                                            --
//--                                                                            --
//--============================================================================--
//--================================= VERILOG ==================================--
/*--===========================================================================--*/

module top (
    input clk, rst, transmit,
    input [3:0] letter,
    output reg led
);

            /* FSM states */
    /* dot = 0.5s or 1 clock cycle */
    /* dash = 1.5s or 3 clock cycles */
    parameter IDLE_STATE = 3'b000; 
    parameter DOT_STATE = 3'b001; 
    parameter DASH_STATE_1 = 3'b010;
    parameter DASH_STATE_2 = 3'b011;
    parameter DASH_STATE_3 = 3'b100;

    /* current and next state */
    reg [2:0] c_state = IDLE_STATE;
    reg [2:0] n_state;
    
    /* letters encoding */
    parameter A = 4'b0000;
    parameter B = 4'b0001;
    parameter C = 4'b0010;
    parameter D = 4'b0011;
    parameter E = 4'b0100;
    parameter F = 4'b0101;
    parameter G = 4'b0110;
    parameter H = 4'b0111;
    
    /* dot = high, dash = low */
    parameter dot = 1'b1;
    parameter dash = 1'b0;

    /* keep track of how many bits we have transmitted */
    reg [3:0] bit_pos = 0;

    /* Morse code look up table */
    /* 8 letters (A-H) of size 4 bits */
    reg [3:0] morse_code [7:0];

    /* dot = 1 */
    /* dash = 0 */
    /* padding = z */
    initial begin
        morse_code[A] <= 4'bzz01;
        morse_code[B] <= 4'b1110;
        morse_code[C] <= 4'b1010;
        morse_code[D] <= 4'bz110;
        morse_code[E] <= 4'bzzz1;
        morse_code[F] <= 4'b1011;
        morse_code[G] <= 4'bz100;
        morse_code[H] <= 4'b1111;
    end

    always @ (c_state, transmit) begin

        case (c_state)

            /* handle idle state first */
            IDLE_STATE: begin
                led <= 0;

                if (transmit) bit_pos = 0;

                /* if bit pos is less than 4,
                handle each state appropriately */
                if (bit_pos < 4) begin
                    case (morse_code[letter][bit_pos])          // morse_code [0000][0000] -- first bit position of A [0][0]
                        dot:                                    // morse_code [0000][0001] -- second bit posotion of A [0][1]
                            n_state <= DOT_STATE;               // morse_code [0000][0010] -- third bit position of A [0][2]
                        dash:                                   // morse_code [0000][0011] -- fourth bit position of A [0][3]
                            n_state <= DASH_STATE_1;            
                        default:                                // morse_code [0001][0000] -- first bit posotion of B [1][0]
                            n_state <= IDLE_STATE;              // morse_code [0001][0001] -- second bit position of B [1][1]
                    endcase                                     // morse_code [0001][0010] -- third bit position of B [1][2]
                                                                // morse_code [0001][0011] -- fourth bit position of B [1][3]
                    /* increment the bit position */
                    bit_pos <= bit_pos + 1'b0001;

            end

            /* stay on for 1 clock cycle
            go back to idle state */
            DOT_STATE: begin
                led <= 1;
                n_state <= IDLE_STATE;
            end

            /* stay on for 3 clock cycles
            go to next state */
            DASH_STATE_1: begin
                led <= 1;
                n_state <= DASH_STATE_2;
            end

            DASH_STATE_2: 
                n_state <= DASH_STATE_3;

            DASH_STATE_3:
                n_state <= IDLE_STATE;
            default: 
                n_state <= IDLE_STATE;
        endcase
    end

    always @(posedge clk) begin 
        if (rst)
            c_state <= IDLE_STATE;
        else
            c_state <= n_state;
    end

endmodule
