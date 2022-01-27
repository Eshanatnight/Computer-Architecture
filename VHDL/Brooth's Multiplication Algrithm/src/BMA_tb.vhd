library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity testbench is
end testbench;

architecture tb of testbench is
component BMA
    port
    (
        mpcd   : in std_logic_vector(7 downto 0);
        mplr   : in std_logic_vector(7 downto 0);
        result : out std_logic_vector(15 downto 0)
    );
end component;

signal A   : std_logic_vector(7 downto 0) := "00000011";
signal B   : std_logic_vector(7 downto 0) := "00000100";
signal MUL : std_logic_vector(15 downto 0);
begin
    DUT : BMA port map(mpcd => A, mplr => B, result => MUL);
    process
    begin

        --Case 1--
        A <= "00000011";
        B <= "00000100";
        wait for 1 ns;

        --Case 2--
        A <= "00000110";
        B <= "00000111";
        wait for 1 ns;

        --Case 3--
        A <= "00001011";
        B <= "00000100";
        wait for 1 ns;

        wait;
    end process;
end tb;
