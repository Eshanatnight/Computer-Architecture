library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture tb of testbench is

component rip is
    port
    (
        a: in std_logic_vector(3 downto 0);
        b: in std_logic_vector(3 downto 0);
        cin: in std_logic;
        cout: out std_logic;
        s: out std_logic_vector(3 downto 0)
    );
end component;

signal A: std_logic_vector(3 downto 0);
signal B: std_logic_vector(3 downto 0);
signal Cin: std_logic;
signal S: std_logic_vector(3 downto 0);
signal Cout: std_logic;

begin
DUT: rip port map(A, B, Cin, Cout, S);

    process
    begin

        A <= "0110";
        B <= "1100";
        Cin <= '1';
        wait for 1 ns;

        A <= "1111";
        B <= "1100";
        Cin <= '0';
        wait for 1 ns;

        A <= "0110";
        B <= "0111";
        Cin <= '1';
        wait for 1 ns;

        A <= "0000";
        B <= "0000";
        Cin <= '0';
        wait for 1 ns;


        --clear
        A <= "0000";
        B <= "0000";
        Cin <= '0';

        assert false report "Tests Completed" severity note;
        wait;

    end process;


end tb;