
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PP1 is
  Port (inP : in std_logic_vector(7 downto 0); -- takes in a 8 bit binary array
        encoder : in std_logic_vector(2 downto 0); -- decoder value
        outP : out std_logic_vector(15 downto 0)); -- spits out a shifter 
end PP1;

architecture Behavioral of PP1 is
component leftShift
Port (x : in std_logic_vector(7 downto 0);-- takes in a 8 bit binary array
       flag : in std_logic_vector(2 downto 0); -- Shifter value
        y : out std_logic_vector(7 downto 0));-- Spits out a 8 bit binary array
end component;

component twosComplement -- Calls these Functions
port (
    a : in  std_logic_vector(7 downto 0);
    twoscomp : out std_logic_vector(7 downto 0)
  );
end component;

signal twosoutput : std_logic_vector(7 downto 0); -- Temps 
signal shiftoutput : std_logic_vector(7 downto 0);
signal sign : std_logic;

begin

U1: twosComplement port map(inP, twosoutput); -- Calls 2 comp
sign <= encoder(2); -- Sign is the high bit which then fills the outP
U2: leftShift port map(twosoutput, encoder, shiftoutput); -- Then shifts


outP(7 downto 0) <= shiftoutput;
outP(15 downto 8) <= (sign, sign, sign, sign, sign, sign, sign, sign);

end Behavioral;
