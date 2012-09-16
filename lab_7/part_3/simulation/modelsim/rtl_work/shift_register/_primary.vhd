library verilog;
use verilog.vl_types.all;
entity shift_register is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        d               : in     vl_logic;
        shift_reg       : out    vl_logic_vector(3 downto 0)
    );
end shift_register;
