

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity AND2 is
  Port (A, B : in std_logic;
        C : out std_logic);
end AND2;

architecture Behavioral of AND2 is

begin

C <= A and B;
end Behavioral;
