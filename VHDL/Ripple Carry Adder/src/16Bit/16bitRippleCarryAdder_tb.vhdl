library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end testbench;

architecture tb of testbench is

component RCA is
    port
    (
        input_1    : in std_logic_vector(15 downto 0);
        input_2    : in std_logic_vector(15 downto 0);
        cin        : in std_logic;
        cout       : out std_logic;
        sum_output : out std_logic_vector(15 downto 0)
    );
end component;

signal INPUT_1    : std_logic_vector(15 downto 0);
signal INPUT_2    : std_logic_vector(15 downto 0);
signal CIN        : std_logic;
signal COUT       : std_logic;
signal SUM_OUTPUT : std_logic_vector(15 downto 0);

begin
DUT: RCA port map(INPUT_1, INPUT_2, CIN, COUT, SUM_OUTPUT);

    process
    begin

        INPUT_1 <= "1110101010101110";
        INPUT_2 <= "1111010010100101";
        CIN <= '0';
        wait for 1 ns;

        INPUT_1 <= "0011001110011001";
        INPUT_2 <= "1111000011110000";
        CIN <= '1';
        wait for 1 ns;

        INPUT_1 <= "0011001110011001";
        INPUT_2 <= "0110011011001100";
        CIN <= '1';
        wait for 1 ns;

        INPUT_1 <= "0000000011111111";
        INPUT_2 <= "1111111100000000";
        CIN <= '0';
        wait for 1 ns;

        INPUT_1 <= "0000111111110000";
        INPUT_2 <= "1111000000001111";
        CIN <= '0';
        wait for 1 ns;

        --clear
        INPUT_1 <= "0000000000000000";
        INPUT_2 <= "0000000000000000";
        CIN <= '0';

        assert false report "Tests Completed" severity note;
        wait;

    end process;
end tb;