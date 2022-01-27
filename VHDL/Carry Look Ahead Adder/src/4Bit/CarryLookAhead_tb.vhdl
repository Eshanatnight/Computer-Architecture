--- 4 Bit Carry Look Ahead Adder Testbench ---
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is

end testbench;

architecture tb of testbench is
component CLA is
    port
    (
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        cin : in std_logic;
        cout : out std_logic;
        sum: out std_logic_vector(3 downto 0)
    );
end component;

signal A : std_logic_vector(3 downto 0);
signal B : std_logic_vector(3 downto 0);
signal CIN : std_logic;
signal COUT : std_logic;
signal SUM : std_logic_vector(3 downto 0);

begin
    DUT : CLA port map(A, B, CIN, COUT, SUM);

    process
    begin

        A <= "1110";
        B <= "1010";
        CIN <= '0';
        wait for 5 ns;

        A <= "1100";
        B <= "0001";
        CIN <= '1';
        wait for 5 ns;

-- CLEAR --
        A <= "0000";
        B <= "0000";
        CIN <= '0';

        assert false report "Tests Completed. Fails Not Noted. " severity note;

        wait;
    end process;
end tb;
