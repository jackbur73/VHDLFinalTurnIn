

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PP3 is
  Port (inP : in std_logic_vector(7 downto 0); -- has a 8 bit input and a 3 bit in
        encoder : in std_logic_vector(2 downto 0);
        outP : out std_logic_vector(15 downto 0)); -- 16 bit out
end PP3;

architecture Behavioral of PP3 is
component leftShift -- Functions it will call
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
U1: twosComplement port map(inP,  twosoutput); -- First 2 Comp then Shift
sign <= encoder(2);
U2: leftShift port map(twosoutput, encoder, shiftoutput);



outP(3 downto 0) <= ('0', '0','0', '0'); -- First 4 always zero because of shift left twice
outP(11 downto 4) <= shiftoutput;
outp(15 downto 12) <= (sign, sign, sign, sign); -- Fills based on sign

end Behavioral;
