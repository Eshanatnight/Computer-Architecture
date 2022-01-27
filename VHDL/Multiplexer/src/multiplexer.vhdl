---8x1 MUX--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MUX is
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
end MUX;

architecture behave of MUX is
begin
process(selectionLine_0, selectionLine_1, selectionLine_2, inputLine_0, inputLine_1,
            inputLine_2, inputLine_3,inputLine_4, inputLine_5, inputLine_6, inputLine_7)
begin

    if selectionLine_0 = '0' and selectionLine_1 = '0' and selectionLine_2 = '0' then
        outputLine <= inputLine_0;

    elsif selectionLine_0 = '1' and selectionLine_1 = '0' and selectionLine_2 = '0' then
        outputLine <= inputLine_1;

    elsif selectionLine_0 = '0' and selectionLine_1 = '1' and selectionLine_2 = '0' then
        outputLine <= inputLine_2;

    elsif selectionLine_0 = '1' and selectionLine_1 = '1' and selectionLine_2 = '0' then
        outputLine <= inputLine_3;

    elsif selectionLine_0 = '0' and selectionLine_1 = '0' and selectionLine_2 = '1' then
        outputLine <= inputLine_4;

    elsif selectionLine_0 = '1' and selectionLine_1 = '0' and selectionLine_2 = '1' then
        outputLine <= inputLine_5;

    elsif selectionLine_0 = '0' and selectionLine_1 = '1' and selectionLine_2 = '1' then
        outputLine <= inputLine_6;

    elsif selectionLine_0 = '1' and selectionLine_1 = '1' and selectionLine_2 = '1' then
        outputLine <= inputLine_7;

    end if;
end process;
end behave;