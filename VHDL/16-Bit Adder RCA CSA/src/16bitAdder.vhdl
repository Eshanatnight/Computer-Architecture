library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity Adder is
    port
    (
        input_1 : in std_logic_vector(15 downto 0);
        input_2 : in std_logic_vector(15 downto 0);
        cin         : in std_logic;
        cout        : out std_logic;
        sum_output  : out std_logic_vector(15 downto 0)
    );
end Adder;

architecture behave of Adder is

    signal c            : std_logic_vector(16 downto 0);
    signal s_propagate  : std_logic_vector(7 downto 0);
    signal s_generate   : std_logic_vector(7 downto 0);

    begin
        process(input_1, input_2, cin , s_propagate, s_generate, c)
        variable i : integer;
            begin
                c(0) <= cin;

                -- CLA for the first 4 bits of data--
                for i in 0 to 3 loop
                    s_propagate(i) <= input_1(i) xor input_2(i);
                    s_generate(i) <= input_1(i) and input_2(i);
                    sum_output(i) <= s_propagate(i) xor s_generate(i);
                    c(i + 1) <= s_generate(i) or (c(i) and s_propagate(i));
                end loop;
                c(5) <= c(4);

                -- CLA for the second 4 bits of data--
                for i in 4 to 7 loop
                    s_propagate(i) <= input_1(i) xor input_2(i);
                    s_generate(i) <= input_1(i) and input_2(i);
                    sum_output(i) <= s_propagate(i) xor s_generate(i);
                    c(i + 1) <= s_generate(i) or (c(i) and s_propagate(i));
                end loop;
                c(9) <= c(8);

                -- RCA for the third 4 bits of data--
                for i in 8 to 11 loop
                    sum_output(i) <= input_1(i) xor input_2(i) xor c(i);
                    c(i+1) <= (input_1(i) and input_2(i)) or (input_2(i) and c(i)) or (c(i) and input_1(i));
                end loop;
                c(13) <= c(12);

                -- RCA for the final 4 bits of data--
                for i in 12 to 15 loop
                    sum_output(i) <= input_1(i) xor input_2(i) xor c(i);
                    c(i+1) <= (input_1(i) and input_2(i)) or (input_2(i) and c(i)) or (c(i) and input_1(i));
                end loop;
                cout <= c(16);

    end process;
end behave;