

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PP2 is
  Port (inP : in std_logic_vector(7 downto 0);
        encoder : in std_logic_vector(2 downto 0); -- Gets an 8 bit input and a 3 bit in with a 16 bit out
        outP : out std_logic_vector(15 downto 0));
end PP2;

architecture Behavioral of PP2 is
component leftShift -- These are the functions used
Port (x : in std_logic_vector(7 downto 0);
        flag : in std_logic_vector(2 downto 0);
        y : out std_logic_vector(7 downto 0));
end component;

component twosComplement
port (
    a        : in  std_logic_vector(7 downto 0);
    twoscomp : out std_logic_vector(7 downto 0)
  );
end component;

signal twosoutput : std_logic_vector(7 downto 0);
signal shiftoutput : std_logic_vector(7 downto 0);
signal sign : std_logic;

begin

U1: twosComplement port map(inP, twosoutput); -- First it 2 comps then it shifts
sign <= encoder(2);
U2: leftShift port map(twosoutput, encoder, shiftoutput);


outP(1 downto 0) <= ('0', '0'); -- First 2 always 0
outP(9 downto 2) <= shiftoutput;
outP(15 downto 10) <= (sign, sign, sign, sign, sign, sign); -- Then it fills based on sign
end Behavioral;
