library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DEMUX is
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
end DEMUX;

architecture behave of DEMUX is
    begin
        process(selectionLine_0, selectionLine_1, selectionLine_2, inputLine)
        begin

            outputLine_0 <= (not selectionLine_2) and (not selectionLine_1) and (not selectionLine_0) and inputLine;
            outputLine_1 <= (not selectionLine_2) and (not selectionLine_1) and      selectionLine_0  and inputLine;
            outputLine_2 <= (not selectionLine_2) and      selectionLine_1  and (not selectionLine_0) and inputLine;
            outputLine_3 <= (not selectionLine_2) and      selectionLine_1  and      selectionLine_0  and inputLine;
            outputLine_4 <=      selectionLine_2  and (not selectionLine_1) and (not selectionLine_0) and inputLine;
            outputLine_5 <=      selectionLine_2  and (not selectionLine_1) and      selectionLine_0  and inputLine;
            outputLine_6 <=      selectionLine_2  and      selectionLine_1  and (not selectionLine_0) and inputLine;
            outputLine_7 <=      selectionLine_2  and      selectionLine_1  and      selectionLine_0  and inputLine;

        end process;
end behave;