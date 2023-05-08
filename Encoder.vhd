
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Encoder is
Port ( y : in STD_LOGIC_VECTOR (2 downto 0);
           x : out STD_LOGIC_VECTOR (2 downto 0));  -- Has 1 input and out both 3 bits long
end Encoder;

architecture Behavioral of Encoder is -- Uses these gates
component NOT2
    Port (A : in std_logic; 
    outP : out std_logic);
end component;

component AND3ins
    Port(A, B, C : in std_logic;
     outP : out std_logic);
end component;

component OR2
  Port (A, B : in std_logic; 
  C : out std_logic);
end component;  

component XOR2
  Port (A, B : in std_logic; 
  C : out std_logic);
end component;

signal y0, y1, y2 : std_logic;
signal temp1, temp2 : std_logic;
begin
x(0) <= y(2);  -- This is the negative Flag 
U1 : NOT2 port map(y(0), y0); 
U2 : NOT2 port map(y(1), y1);
U3 : NOT2 port map(y(2), y2);
U4 : AND3ins port map(y2, y(1), y(0), temp1);
U5 : AND3ins port map(y(2), y1, y0, temp2);
U6 : OR2 port map(temp1, temp2, x(1));
U7 : XOR2 port map(y(1), y(0), x(2));

-- The truth table was found in my research and is shown above
end Behavioral;
