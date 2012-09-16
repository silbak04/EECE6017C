library verilog;
use verilog.vl_types.all;
entity fsm is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        w               : in     vl_logic;
        z               : out    vl_logic
    );
end fsm;
