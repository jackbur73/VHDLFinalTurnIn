

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR2 is
  Port (A, B : in std_logic; 
  C : out std_logic);
end OR2;

architecture structural of OR2 is
begin
    C <= a or b ;
end structural;
