
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LeftShift is
  Port (x : in std_logic_vector(7 downto 0); -- Takes in a 8 bit and spits out a 8 bit based on a 3 bit input
       flag : in std_logic_vector(2 downto 0);
        y : out std_logic_vector(7 downto 0));
end LeftShift;

architecture Behavioral of LeftShift is -- function call
component multiplexer
Port (x, y, sel : in std_logic;
        output : out std_logic);
end component;

signal temp : std_logic_vector(7 downto 0);
signal left_shift_flagt : std_logic_vector(2 downto 0);

begin

U1: multiplexer port map('0', x(0), flag(2), temp(0)); -- port mapping 
U2: multiplexer port map('0', x(1), flag(2), temp(1));
U3: multiplexer port map('0', x(2), flag(2), temp(2));
U4: multiplexer port map('0', x(3), flag(2), temp(3));
U5: multiplexer port map('0', x(4), flag(2), temp(4));
U6: multiplexer port map('0', x(5), flag(2), temp(5));
U7: multiplexer port map('0', x(6), flag(2), temp(6));
U8: multiplexer port map('0', x(7), flag(2), temp(7));


U9: multiplexer port map( temp(0), '0', flag(1), y(0));
U10: multiplexer port map(temp(1), x(0),flag(1), y(1));
U11: multiplexer port map(temp(2), x(1), flag(1), y(2));
U12: multiplexer port map(temp(3), x(2), flag(1), y(3));
U13: multiplexer port map(temp(4), x(3), flag(1), y(4));
U14: multiplexer port map(temp(5), x(4),flag(1), y(5));
U15: multiplexer port map(temp(6), x(5), flag(1), y(6));
U16: multiplexer port map(temp(7), x(6), flag(1), y(7));


end Behavioral;
