library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity twosComplement is
  port (
    a        : in  std_logic_vector(7 downto 0); -- Has inputs A 
    twoscomp : out std_logic_vector(7 downto 0)
  );
end entity twosComplement;

architecture structural of twosComplement is

component NOT2 is -- Basic not Gate
  Port (A : in std_logic; 
  outP  : out std_logic);
end component;

component FullAdder is
  Port (A, B, Cin : in std_logic;
        sum, Cout : out std_logic);
end component;

 
  signal outTemp      : std_logic_vector(7 downto 0); -- Used as temp sums
  signal Cout : std_logic_vector ( 7 downto 0);
  

begin

  U1: NOT2 port map(a(0) , outTemp(0));
   U2: NOT2 port map(a(1) , outTemp(1));
    U3: NOT2 port map(a(2) , outTemp(2)); -- 2s Comp is 8 nots with 1 added to the end
     U4: NOT2 port map(a(3) , outTemp(3));
      U5: NOT2 port map(a(4) , outTemp(4));
       U6: NOT2 port map(a(5) , outTemp(5));
        U7: NOT2 port map(a(6) , outTemp(6));
         U8: NOT2 port map(a(7) , outTemp(7));

U9 : FullAdder port map ( outTemp(0) , '1' , '0' , twoscomp(0) , Cout(0));
U10 : FullAdder port map ( outTemp(1) ,'0', Cout(0) , twoscomp(1) , Cout(1)); -- Nots with FAdder
U11 : FullAdder port map ( outTemp(2) , '0' , Cout(1) , twoscomp(2) , Cout(2));
U12 : FullAdder port map ( outTemp(3) , '0' , Cout(2) , twoscomp(3) , Cout(3));
U13 : FullAdder port map ( outTemp(4) , '0' , Cout(3) , twoscomp(4) , Cout(4));
U14 : FullAdder port map ( outTemp(5) , '0' , Cout(4) , twoscomp(5) , Cout(5));
U15 : FullAdder port map ( outTemp(6) , '0' , Cout(5) , twoscomp(6) , Cout(6));
U16 : FullAdder port map ( outTemp(7) , '0', Cout(6) , twoscomp(7) , Cout(7));

end architecture structural;
