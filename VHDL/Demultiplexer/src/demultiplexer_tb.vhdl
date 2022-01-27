library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is

    end testbench;

architecture tb of testbench is
component DEMUX is
    port
        (
            selectionLine_0 : in std_logic;
            selectionLine_1 : in std_logic;
            selectionLine_2 : in std_logic;
            inputLine       : in std_logic;
            outputLine_0    : out std_logic;
            outputLine_1    : out std_logic;
            outputLine_2    : out std_logic;
            outputLine_3    : out std_logic;
            outputLine_4    : out std_logic;
            outputLine_5    : out std_logic;
            outputLine_6    : out std_logic;
            outputLine_7    : out std_logic
        );
end component;

signal SelectionLine_0, SelectionLine_1, SelectionLine_2, InputLine : std_logic;

begin

        DUT : DEMUX port map(SelectionLine_0 => selectionLine_0, SelectionLine_1 => selectionLine_1,
                SelectionLine_2 => selectionLine_2, InputLine => inputLine);

        process
        begin

            SelectionLine_0 <= '0';
            SelectionLine_1 <= '0';
            SelectionLine_2 <= '0';
            InputLine       <= '1';
            wait for 100 ns;

            SelectionLine_0 <= '0';
            SelectionLine_1 <= '1';
            SelectionLine_2 <= '0';
            InputLine       <= '0';
            wait for 100 ns;

            SelectionLine_0 <= '1';
            SelectionLine_1 <= '0';
            SelectionLine_2 <= '1';
            InputLine       <= '1';
            wait for 100 ns;

            SelectionLine_0 <= '1';
            SelectionLine_1 <= '1';
            SelectionLine_2 <= '1';
            InputLine       <= '1';
            wait for 100 ns;

            SelectionLine_0 <= '0';
            SelectionLine_1 <= '1';
            SelectionLine_2 <= '0';
            InputLine       <= '1';
            wait for 100 ns;

            assert false report "Tests Performed" severity note;
            wait;
        end process;
end tb;