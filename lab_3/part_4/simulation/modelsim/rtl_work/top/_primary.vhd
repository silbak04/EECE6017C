library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        D               : in     vl_logic;
        q_a             : out    vl_logic;
        q_b             : out    vl_logic;
        q_c             : out    vl_logic
    );
end top;
