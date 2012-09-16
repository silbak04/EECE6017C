/*--==========================================================================--*/
//--================================ VERILOG ===================================--
//--============================================================================--
//--                                                                            --
//-- FILE NAME: top.v                                                           --
//--                                                                            --
//-- DATE: 9/10/2012                                                            --
//--                                                                            --
//-- DESIGNER: Samir Silbak                                                     --
//--                                                                            --
//-- DESCRIPTION: instantiation of two 4 bit shift registers                    --
//--                                                                            --
//--============================================================================--
//--================================ VERILOG ===================================--
/*--===========================================================================--*/

module top (
    input clk, rst, w,
    output z
);

    wire [3:0] bit_shift_zeros;
    wire [3:0] bit_shift_ones;

    shift_register shift_zb (
        .clk(clk),
        .rst(rst),
        .d(w),
        .shift_reg(bit_shift_zeros)
    );

    shift_register shift_ob (
        .clk(clk),
        .rst(rst),
        .d(w),
        .shift_reg(bit_shift_ones)
    );
  
    assign z = (bit_shift_zeros == 4'b0000) || (bit_shift_ones == 4'b1111);

endmodule
