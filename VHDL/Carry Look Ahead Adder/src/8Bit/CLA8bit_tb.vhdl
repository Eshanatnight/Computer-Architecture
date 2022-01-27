--- 8 Bit Carry Look Ahead Adder Testbench ---
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is

end testbench;

architecture tb of testbench is
component CLA is
    port
    (
        a : in std_logic_vector(7 downto 0);
        b : in std_logic_vector(7 downto 0);
        cin : in std_logic;
        cout : out std_logic;
        sum: out std_logic_vector(7 downto 0)
    );
end component;

signal A : std_logic_vector(7 downto 0);
signal B : std_logic_vector(7 downto 0);
signal CIN : std_logic;
signal COUT : std_logic;
signal SUM : std_logic_vector(7 downto 0);
signal res : integer;

begin
    DUT : CLA port map(A, B, CIN, COUT, SUM);

    process
    begin

        A <= "11001100";
        B <= "00111100";
        CIN <= '0';
        wait for 5 ns;

        A <= "11001100";
        B <= "00111100";
        CIN <= '1';
        wait for 5 ns;

        -- CLEAR --
        A <= "00000000";
        B <= "00000000";
        CIN <= '0';

        wait;
    end process;
end tb;
