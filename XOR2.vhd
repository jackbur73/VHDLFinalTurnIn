
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR2 is
  Port (A, B : in std_logic; 
  C : out std_logic); -- Basic Xor Gate
end XOR2;

architecture structural of XOR2 is
begin
  C <= a xor b;
end structural;
