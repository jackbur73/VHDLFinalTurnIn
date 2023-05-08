

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PP4 is
  Port (inP : in std_logic_vector(7 downto 0);
        encoder: in std_logic_vector(2 downto 0);
        outp : out std_logic_vector(15 downto 0));
end PP4;

architecture Behavioral of PP4 is
component leftShift
Port (x : in std_logic_vector(7 downto 0); -- has a 8 bit in
        flag : in std_logic_vector(2 downto 0); -- 3 bit in
        y : out std_logic_vector(7 downto 0)); -- 16 bit out
end component;

component twosComplement -- functinos it will Call
port (
    a        : in  std_logic_vector(7 downto 0);
    twoscomp : out std_logic_vector(7 downto 0)
  );
end component;

signal twosoutput : std_logic_vector(7 downto 0);
signal shiftoutput : std_logic_vector(7 downto 0);
signal sign : std_logic;

begin
U1: twosComplement port map(inP,  twosoutput); -- first 2 comp then shift
sign <= encoder(2);
U2: leftShift port map(twosoutput, encoder, shiftoutput);



outP(5 downto 0) <= ('0', '0','0', '0','0', '0'); -- First 6 always zero

outP(13 downto 6) <= shiftoutput;
outP(15 downto 14) <= (sign, sign); -- Fill with Sign

end Behavioral;
