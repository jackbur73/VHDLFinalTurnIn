----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/23/2023 03:54:45 PM
-- Design Name: 
-- Module Name: multiplexer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexer is
  Port (x, y, sel : in std_logic;
        output : out std_logic);
end multiplexer;

architecture Behavioral of multiplexer is

component AND2
    Port(A, B : in std_logic;
         C : out std_logic);
end component;

component OR2
  Port (A, B: in std_logic; 
  C : out std_logic);
end component;

component NOT2
    Port (A : in std_logic; 
    outP : out std_logic);
end component;

signal temp1, temp2, temp3 : std_logic;
begin

U1: AND2 port map(sel, y, temp1);
U2: NOT2 port map(sel, temp2);
U3: AND2 port map(temp2, x, temp3);
U4: OR2 port map(temp1, temp3, output);

end Behavioral;
