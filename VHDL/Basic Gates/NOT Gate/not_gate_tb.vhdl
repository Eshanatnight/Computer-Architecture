library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- DUT component
component not_gate is
port(
    a: in std_logic;
    q: out std_logic);
end component;

signal a_in, q_out: std_logic;

begin

-- Connect DUT
    DUT: not_gate port map(a_in, q_out);

    process
    begin

        a_in <= '0';
        wait for 1 ns;

        a_in <= '1';
        wait for 1 ns;

-- Clear inputs
        a_in <= '0';
        assert false report "Test done." severity note;
        wait;
    end process;
end tb;