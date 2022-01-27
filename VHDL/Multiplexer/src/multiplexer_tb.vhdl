library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is

end testbench;

architecture tb of testbench is
component MUX is
    port
    (
        selectionLine_0 : in std_logic;
        selectionLine_1 : in std_logic;
        selectionLine_2 : in std_logic;
        inputLine_0     : in std_logic;
        inputLine_1     : in std_logic;
        inputLine_2     : in std_logic;
        inputLine_3     : in std_logic;
        inputLine_4     : in std_logic;
        inputLine_5     : in std_logic;
        inputLine_6     : in std_logic;
        inputLine_7     : in std_logic;
        outputLine      : out std_logic
    );
end component;

signal SelectionLine_0, SelectionLine_1, SelectionLine_2, InputLine_0, InputLine_1,
InputLine_2, InputLine_3, InputLine_4, InputLine_5, InputLine_6, InputLine_7 : std_logic;

begin

DUT : MUX port map(SelectionLine_0, SelectionLine_1, SelectionLine_2,
        InputLine_0, InputLine_1, InputLine_2, InputLine_3, InputLine_4, InputLine_5, InputLine_6, InputLine_7);

    process
    begin

        SelectionLine_0 <= '0';
        SelectionLine_1 <= '0';
        SelectionLine_2 <= '0';
        InputLine_0     <= '1';
        InputLine_1     <= '0';
        InputLine_2     <= '1';
        InputLine_3     <= '0';
        InputLine_4     <= '1';
        InputLine_5     <= '1';
        InputLine_6     <= '0';
        InputLine_7     <= '0';
        wait for 100 ns;

        SelectionLine_0 <= '1';
        SelectionLine_1 <= '0';
        SelectionLine_2 <= '0';
        InputLine_0     <= '1';
        InputLine_1     <= '0';
        InputLine_2     <= '1';
        InputLine_3     <= '0';
        InputLine_4     <= '1';
        InputLine_5     <= '1';
        InputLine_6     <= '0';
        InputLine_7     <= '0';
        wait for 100 ns;

        SelectionLine_0 <= '0';
        SelectionLine_1 <= '1';
        SelectionLine_2 <= '0';
        InputLine_0     <= '1';
        InputLine_1     <= '1';
        InputLine_2     <= '1';
        InputLine_3     <= '1';
        InputLine_4     <= '1';
        InputLine_5     <= '1';
        InputLine_6     <= '0';
        InputLine_7     <= '0';
        wait for 100 ns;

        SelectionLine_0 <= '0';
        SelectionLine_1 <= '0';
        SelectionLine_2 <= '1';
        InputLine_0     <= '1';
        InputLine_1     <= '0';
        InputLine_2     <= '1';
        InputLine_3     <= '0';
        InputLine_4     <= '1';
        InputLine_5     <= '1';
        InputLine_6     <= '0';
        InputLine_7     <= '0';
        wait for 100 ns;

        assert false report "Tests Performed" severity note;
        wait;
    end process;
end tb;