library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        w               : in     vl_logic;
        z               : out    vl_logic
    );
end top;
