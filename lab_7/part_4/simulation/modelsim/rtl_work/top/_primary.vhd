library verilog;
use verilog.vl_types.all;
entity top is
    generic(
        IDLE_STATE      : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        DOT_STATE       : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        DASH_STATE_1    : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        DASH_STATE_2    : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        DASH_STATE_3    : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        A               : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi0);
        B               : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        C               : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        D               : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        E               : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        F               : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        G               : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        H               : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        dot             : vl_logic := Hi1;
        dash            : vl_logic := Hi0
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        transmit        : in     vl_logic;
        letter          : in     vl_logic_vector(3 downto 0);
        led             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE_STATE : constant is 1;
    attribute mti_svvh_generic_type of DOT_STATE : constant is 1;
    attribute mti_svvh_generic_type of DASH_STATE_1 : constant is 1;
    attribute mti_svvh_generic_type of DASH_STATE_2 : constant is 1;
    attribute mti_svvh_generic_type of DASH_STATE_3 : constant is 1;
    attribute mti_svvh_generic_type of A : constant is 1;
    attribute mti_svvh_generic_type of B : constant is 1;
    attribute mti_svvh_generic_type of C : constant is 1;
    attribute mti_svvh_generic_type of D : constant is 1;
    attribute mti_svvh_generic_type of E : constant is 1;
    attribute mti_svvh_generic_type of F : constant is 1;
    attribute mti_svvh_generic_type of G : constant is 1;
    attribute mti_svvh_generic_type of H : constant is 1;
    attribute mti_svvh_generic_type of dot : constant is 1;
    attribute mti_svvh_generic_type of dash : constant is 1;
end top;
