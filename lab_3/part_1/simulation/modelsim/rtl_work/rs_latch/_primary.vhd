library verilog;
use verilog.vl_types.all;
entity rs_latch is
    port(
        clk             : in     vl_logic;
        R               : in     vl_logic;
        S               : in     vl_logic;
        q_output        : out    vl_logic
    );
end rs_latch;
