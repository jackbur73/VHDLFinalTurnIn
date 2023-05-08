library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sixteenFullAdder is
  Port (x : in std_logic_vector(15 downto 0);
        y : in std_logic_vector(15 downto 0);
        Cin : in std_logic;
        output : out std_logic_vector(15 downto 0);
        Cout : out std_logic);
end sixteenFullAdder;

architecture Behavioral of sixteenFullAdder is
component FullAdder is
  Port (A, B, Cin : in std_logic;
        sum, Cout : out std_logic);
end component;

signal C0 : std_logic_vector(15 downto 0);
begin

U1:  FullAdder port map(x(0), y(0), '0', output(0), C0(0)); 
U2:  FullAdder port map(x(1), y(1), C0(0), output(1), C0(1));
U3:  FullAdder port map(x(2), y(2), C0(1), output(2), C0(2));
U4:  FullAdder port map(x(3), y(3), C0(2), output(3), C0(3));
U5: FullAdder port map(x(4), y(4), C0(3), output(4), C0(4));
U6:  FullAdder port map(x(5), y(5), C0(4), output(5), C0(5));
U7:  FullAdder port map(x(6), y(6), C0(5), output(6), C0(6));
U8:  FullAdder port map(x(7), y(7), C0(6), output(7), C0(7));
U9:  FullAdder port map(x(8), y(8), C0(7), output(8), C0(8));
U10: FullAdder port map(x(9), y(9), C0(8), output(9), C0(9));
U11: FullAdder port map(x(10), y(10), C0(9), output(10), C0(10));
U12: FullAdder port map(x(11), y(11), C0(10), output(11), C0(11));
U13: FullAdder port map(x(12), y(12), C0(11), output(12), C0(12));
U14: FullAdder port map(x(13), y(13), C0(12), output(13), C0(13));
U15: FullAdder port map(x(14), y(14), C0(13), output(14), C0(14));
U16: FullAdder port map(x(15), y(15), C0(14), output(15), C0(15));

end Behavioral;
