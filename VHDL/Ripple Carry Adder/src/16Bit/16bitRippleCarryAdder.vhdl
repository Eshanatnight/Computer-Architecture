library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RCA is
port
    (
        input_1    : in std_logic_vector(15 downto 0);
        input_2    : in std_logic_vector(15 downto 0);
        cin        : in std_logic;
        cout       : out std_logic;
        sum_output : out std_logic_vector(15 downto 0)
    );
end RCA;

architecture behave of RCA is

signal c: std_logic_vector(16 downto 0);
-- signal s: std_logic_vector(16 downto 0);

begin
    process (input_1, input_2, cin, c)

    variable i : integer;
    begin
        c(0)<= cin;

-- for the first 4 bits of data--
        for i in 0 to 3 loop
            sum_output(i) <= input_1(i) xor input_2(i) xor c(i);
            c(i+1) <= (input_1(i) and input_2(i)) or (input_2(i) and c(i)) or (c(i) and input_1(i));
        end loop;

        c(5) <= c(4);

-- for the second 4 bits of data--
        for i in 4 to 7 loop
            sum_output(i) <= input_1(i) xor input_2(i) xor c(i);
            c(i+1) <= (input_1(i) and input_2(i)) or (input_2(i) and c(i)) or (c(i) and input_1(i));
        end loop;

        c(9) <= c(8);

-- for the third 4 bits of data--
        for i in 8 to 11 loop
            sum_output(i) <= input_1(i) xor input_2(i) xor c(i);
            c(i+1) <= (input_1(i) and input_2(i)) or (input_2(i) and c(i)) or (c(i) and input_1(i));
        end loop;

        c(13) <= c(12);

-- for the final 4 bits of data--
        for i in 12 to 15 loop
            sum_output(i) <= input_1(i) xor input_2(i) xor c(i);
            c(i+1) <= (input_1(i) and input_2(i)) or (input_2(i) and c(i)) or (c(i) and input_1(i));
        end loop;

        cout <= c(16);

    end process;

end behave;

