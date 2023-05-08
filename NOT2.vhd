

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT2 is -- Basic not Gate
  Port (A : in std_logic; 
  outP  : out std_logic);
end NOT2;

architecture Behavioral of NOT2 is
begin
    outP <= not(a);
end Behavioral;
