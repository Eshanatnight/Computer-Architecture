library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FullAdder is
port
(
    a: in std_logic;
    b: in std_logic;
    cin: in std_logic;
    s: out std_logic;
    cout: out std_logic
);
end FullAdder;

architecture rtl of FullAdder is

begin
    s <= a xor b xor cin ;
    cout <= (a and b) OR (cin and a) OR (cin and b) ;

end rtl;