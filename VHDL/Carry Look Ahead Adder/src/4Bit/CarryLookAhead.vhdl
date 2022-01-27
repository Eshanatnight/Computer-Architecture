--- 4 Bit Carry Look Ahead Adder ---
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CLA is
    port
    (
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        cin : in std_logic;
        cout : out std_logic;
        sum: out std_logic_vector(3 downto 0)
    );
end CLA;

architecture behave of CLA is
    signal s_propagate : std_logic_vector(3 downto 0);
    signal s_generate : std_logic_vector(3 downto 0);
    signal s_C_Intermediates: std_logic_vector(4 downto 0);

    begin
        process(a, b, cin, s_propagate, s_generate, s_C_Intermediates)
        variable i : integer;
        begin
            s_C_Intermediates(0) <= cin;

            for i in 0 to 3 loop
                s_propagate(i) <= a(i) xor b(i);
                s_generate(i) <= a(i) and b(i);
                sum(i) <= s_propagate(i) xor s_generate(i);
                s_C_Intermediates(i + 1) <= s_generate(i) or (s_C_Intermediates(i) and s_propagate(i));
            end loop;

        cout <= s_C_Intermediates(4);

        end process;

end behave;