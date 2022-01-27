-- 8 Bit Composite Adder And Subtractor --
library IEEE;
use IEEE.std_logic_1164.all;

entity rip is
port
(
    a : in std_logic_vector(7 downto 0);
    b : in std_logic_vector(7 downto 0);
    cin : in std_logic;
    cout : out std_logic;
    m : in std_logic;
    s: out std_logic_vector(7 downto 0)
);
end rip;

architecture behave of rip is
    signal c : std_logic_vector (8 downto 0);

begin
    process (a, b, cin, c, m)
    variable i : integer;
    begin
    if m = '0' then
        c(0) <= cin;

    else
        c(0) <= m;
    end if;

    for i in 0 to 7 loop
        s(i) <= a(i) xor (b(i) xor m) xor c(i);
        c(i + 1) <= (a(i) and (b(i) xor m)) or ((b(i) xor m) and c(i)) or (c(i) and a(i));
    end loop;

    cout <= c(8);
    end process;

end behave;