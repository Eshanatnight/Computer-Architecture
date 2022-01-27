-- 4 bit Composite Adder Subtractor Testbench --

library IEEE;
use IEEE.std_logic_1164.all;


entity testbench is
end testbench;

architecture tb of testbench is

component rip is
port
(
    a : in std_logic_vector(3 downto 0);
    b : in std_logic_vector(3 downto 0);
    cin : in std_logic;
    cout : out std_logic;
    m : in std_logic;
    s: out std_logic_vector(3 downto 0)
);
end component;

signal A : std_logic_vector(3 downto 0);
signal B : std_logic_vector(3 downto 0);
signal CIN : std_logic;
signal COUT : std_logic;
signal M : std_logic;
signal S : std_logic_vector(3 downto 0);

begin
    DUT : rip port map(A, B, CIN, COUT, M, S);

    process
    begin
        A <= "01101100";
        B <= "11000110";
        CIN <= '1';
        M <= '0';
        wait for 5 ns;

        A <= "11110011";
        B <= "11001111";
        CIN <= '1';
        M <= '0';
        wait for 5 ns;

        A <= "01100111";
        B <= "01110110";
        CIN <= '1';
        M <= '1';
        wait for 5 ns;

        A <= "01110110";
        B <= "01101110";
        CIN <= '1';
        M <= '1';
        wait for 5 ns;

-- CLEAR --
        A <= "0000";
        B <= "0000";
        CIN <= '0';

assert false report "Tests Completed. Fails Not Noted. " severity note;

        wait;

    end process;

end tb;