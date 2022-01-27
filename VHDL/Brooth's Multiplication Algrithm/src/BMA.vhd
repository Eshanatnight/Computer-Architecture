library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity BMA is
    port
    (
        mpcd   : in std_logic_vector(7 downto 0);
        mplr   : in std_logic_vector(7 downto 0);
        result : out std_logic_vector(15 downto 0)
    );
end BMA;

architecture behave of BMA is
begin
    process(mpcd, mplr) is
        variable nbr, br : std_logic_vector(7 downto 0);
        variable aqur : std_logic_vector(15 downto 0);
        variable qn1 : std_logic;
        variable i : integer;
        begin
            aqur(15 downto 8) := (others => '0');
            aqur(7 downto 0) := mplr;
            br := mpcd;
            nbr := (not mpcd) + '1';
            qn1 := '0';

            for i in 7 downto 0 loop
                if (aqur(0) = '0' and qn1 = '1') then
                    aqur(15 downto 8) := aqur(15 downto 8) + br;
                elsif (aqur(0) = '1' and qn1 = '0') then
                    aqur(15 downto 8) := aqur(15 downto 8) + nbr;
                end if;
                qn1 := aqur(0);
                aqur(14 downto 0) := aqur(15 downto 1);
            end loop;
            result <= aqur;
        end process;
    end behave;
