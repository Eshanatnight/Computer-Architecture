library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity testbench is
end testbench;

architecture behave of testbench is

component FullAdder is
port
(
    a: in std_logic;
    b: in std_logic;
    cin: in std_logic;
    s: out std_logic;
    cout: out std_logic
);
end component;

signal a, b, cin, s, cout : std_logic;

begin
    DUT: FullAdder port map(a, b, cin, s, cout);

    process
    begin

        a <= '1';
        b <= '0';
        cin <= '0';
        wait for 1 ns;

        a <= '0';
        b <= '1';
        cin <= '0';
        wait for 1 ns;

        a <= '1';
        b <= '1';
        cin <= '0';
        wait for 1 ns;

        a <= '0';
        b <= '0';
        cin <= '1';
        wait for 1 ns;

        a <= '1';
        b <= '0';
        cin <= '1';
        wait for 1 ns;

        a <= '0';
        b <= '1';
        cin <= '1';
        wait for 1 ns;

        a <= '1';
        b <= '1';
        cin <= '1';
        wait for 1 ns;


        assert false report "Test Completed" severity note;
        wait;


    end process;
end behave;