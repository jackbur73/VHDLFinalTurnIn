
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity AND3ins is -- This is an And gate with 3 inputs
    Port(A, B, C : in std_logic; outP : out std_logic);
end AND3ins;

architecture Behavioral of AND3ins is 
begin
    outP <= (a and (b and c));
end Behavioral;
