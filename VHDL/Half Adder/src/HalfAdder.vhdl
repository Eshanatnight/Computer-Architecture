library IEEE;
use IEEE.std_logic_1164.all;

entity halfAdder is
    port
    (
        a: in std_logic;
        b: in std_logic;
        s: out std_logic;
        c: out std_logic
    );

end halfAdder;

architecture rtl of halfAdder is
begin
    process(a,b) is
    begin
        c <= a and b;
        s <= a xor b;
    end process;

end rtl;