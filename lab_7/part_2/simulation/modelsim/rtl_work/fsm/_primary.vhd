library verilog;
use verilog.vl_types.all;
entity fsm is
    generic(
        a               : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        b               : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        c               : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        d               : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        e               : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        f               : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        g               : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        h               : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        i               : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        w               : in     vl_logic;
        z               : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of a : constant is 1;
    attribute mti_svvh_generic_type of b : constant is 1;
    attribute mti_svvh_generic_type of c : constant is 1;
    attribute mti_svvh_generic_type of d : constant is 1;
    attribute mti_svvh_generic_type of e : constant is 1;
    attribute mti_svvh_generic_type of f : constant is 1;
    attribute mti_svvh_generic_type of g : constant is 1;
    attribute mti_svvh_generic_type of h : constant is 1;
    attribute mti_svvh_generic_type of i : constant is 1;
end fsm;
