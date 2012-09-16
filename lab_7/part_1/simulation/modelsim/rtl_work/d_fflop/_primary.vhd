library verilog;
use verilog.vl_types.all;
entity d_fflop is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        d               : in     vl_logic;
        q_out           : out    vl_logic
    );
end d_fflop;
