

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;


entity FullAdder is
  Port (A, B, Cin : in std_logic; -- 3 inputs with 2 outs being Sum and carry
        sum, Cout : out std_logic); -- Basic full Adder from lab 1
end FullAdder;

architecture Behavioral of FullAdder is

component XOR2 -- Gates it will call
  Port (A, B : in std_logic; 
  C : out std_logic);
end component;

component OR2
  Port (A , B : in std_logic; 
  C : out std_logic);
end component;

component AND2
    Port(A , B : in std_logic;
         C : out std_logic);
end component;
  
  signal stemp1, ctemp1, ctemp2, ctmep3 : std_logic; -- Temps

begin
U1 : XOR2 port map(a, b, stemp1); -- This equation is from Lab 1
U2 : XOR2 port map(stemp1, cin, sum);
U3 : AND2 port map(a, b, ctemp1);
U4 : AND2 port map(stemp1, cin, ctemp2);
U5 : XOR2 port map(ctemp1, ctemp2, cout);

end Behavioral;
