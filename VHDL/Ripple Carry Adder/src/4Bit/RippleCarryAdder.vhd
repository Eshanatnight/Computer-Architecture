library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity rip is
    port
    (
        a: in  std_logic_vector(3 downto 0);
        b: in std_logic_vector(3 downto 0);
        cin: in std_logic;
        cout: out std_logic;
        s: out std_logic_vector(3 downto 0)
    );
end rip;

architecture Behavioral of rip is

signal c: std_logic_vector(4 downto 0);

begin
    process(a, b, cin, c)
    variable i: integer;
    begin
    c(0) <= cin;
    for i in 0 to 3 loop
        s(i) <= a(i) xor b(i) xor c(i);
        c(i+1) <= (a(i) and b(i)) or (b(i) and c(i)) or (c(i) and a(i));
    end loop;
    cout <= c(4);

    end process;

end Behavioral;