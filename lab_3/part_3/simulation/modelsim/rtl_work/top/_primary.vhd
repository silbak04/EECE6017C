library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        D               : in     vl_logic;
        q_output        : out    vl_logic
    );
end top;
