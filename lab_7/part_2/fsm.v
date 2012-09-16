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
    input clk, rst, w,
    output reg z  
);

    /* defined parameters for each state */
    parameter a = 4'b0000,
              b = 4'b0001,
              c = 4'b0010,
              d = 4'b0011,
              e = 4'b0100,
              f = 4'b0101,
              g = 4'b0110,
              h = 4'b0111,
              i = 4'b1000;

    /* current and next state */
    reg [3:0] c_state = a;
    reg [3:0] n_state;
  
    always @ (posedge clk) begin
        if(rst)
            c_state = a;
        else begin
            case (c_state)

                /* if w is high go to state f 
                    otherwise go to next state */
                a: 
                    if(w)
                        n_state = f;
                    else
                        n_state = b;
                b:
                    if(w)
                        n_state = f;
                    else
                        n_state = c;
                c:
                    if(w)
                        n_state = f;
                    else
                        n_state = d;
                d:
                    if(w)
                        n_state = f;
                    else
                        n_state = e;

                /* stays in same state unless
                    w is set */
                e:
                    if(w)
                        n_state = f;
                f:
                    if(w)
                        n_state = g;
                    else
                        n_state = b;
                g: 
                    if(w)
                        n_state = h;
                    else
                        n_state = b;
                h:
                    if(w)
                        n_state = i;
                    else
                        n_state = b;

                /* stays in same state unless
                    w is not set */
                i:
                    if(!w)
                        n_state = b;

                /* defaults to first state */
                default:
                    n_state = a;
            endcase

            c_state = n_state;
            z = (c_state == i) || (c_state == e);

        end
    end

endmodule
