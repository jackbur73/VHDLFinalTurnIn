library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Booth_Multiplier is
  Port (RegA : in std_logic_vector(7 downto 0); -- Reg A
        RegB : in std_logic_vector(7 downto 0); -- Reg B
        Clk: in std_logic; -- Clock for process
        LoadFlag : in std_logic; -- L flag
        EndFlag :inout std_logic; -- E Flag
        Regz : out std_logic_vector(15 downto 0)); -- output
end Booth_Multiplier;

architecture Behavioral of Booth_Multiplier is -- Calls the encoder
component Encoder
Port ( y : in std_logic_vector (2 downto 0);
           x : out std_logic_vector (2 downto 0));
end component;

component PP1 -- Calls the PP1 - PP4
Port (inP : in std_logic_vector(7 downto 0);
        encoder : in std_logic_vector(2 downto 0);
        outP : out std_logic_vector(15 downto 0));
end component;

component PP2
Port (inP : in std_logic_vector(7 downto 0);
        encoder : in std_logic_vector(2 downto 0);
        outP : out std_logic_vector(15 downto 0));
end component;

component PP3
Port  (inP : in std_logic_vector(7 downto 0);
        encoder : in std_logic_vector(2 downto 0);
        outP : out std_logic_vector(15 downto 0));
end component;

component PP4
Port (inP : in std_logic_vector(7 downto 0);
        encoder : in std_logic_vector(2 downto 0);
        outP : out std_logic_vector(15 downto 0));
end component;

component sixteenFullAdder -- Calls 16FullAdder to add together the 4 PPs to A
Port (x : in std_logic_vector(15 downto 0);
        y : in std_logic_vector(15 downto 0);
        Cin : in std_logic;
        output : out std_logic_vector(15 downto 0);
        Cout : out std_logic);
end component;


signal ret1, ret2, ret3, ret4 : std_logic_vector(2 downto 0); -- My returns of these decoder values
signal tempA, tempb : std_logic_vector(7 downto 0); -- Temps for reg a and b 
signal partTemp1, partTemp2, partTemp3, partTemp4 : std_logic_vector(15 downto 0); -- more temps for port map
signal decode1, decode2, decode3, decode4: std_logic_vector(2 downto 0); -- My variables to pass into the decoder
signal Cout: std_logic; -- cout
signal Final : std_logic_vector(15 downto 0); -- This is the final output which is saved into ZReg
signal FTemp1, Ftemp2 : std_logic_vector(15 downto 0); -- Temps for the adder


begin

process(Clk , LoadFlag) -- If clk then load regs
begin

    if(Clk'event and LoadFlag = '1') then
    TempB <= RegB;
    TempA <= RegA;
    
decode1(2 downto 1) <= TempB(1 downto 0);
decode1(0) <= '0';

decode2 <= TempB(3 downto 1);
decode3 <= TempB(5 downto 3);
decode4 <= TempB(7 downto 5);
end if;

end process; 

U1: Encoder port map(decode1, ret1);
U2: Encoder port map(decode2, ret2); -- encoders the PP
U3: Encoder port map(decode3, ret3);
U4: Encoder port map(decode4, ret4);

U5: PP1 port map(TempA, ret1, partTemp1);
U6:  PP2 port map(TempA, ret2, partTemp2); -- Creates the PPs
U7:  PP3 port map(TempA, ret3, partTemp3);
U8:  PP4 port map(TempA, ret4, partTemp4);

U9: sixteenFullAdder port map(partTemp1, partTemp2, '0', Ftemp1, Cout); -- Adds together the 4 PPs
U10: sixteenFullAdder port map(Ftemp1, partTemp3, '0', Ftemp2, Cout);
U11: sixteenFullAdder port map(Ftemp2, partTemp4, '0', Final, Cout);

process(Clk) -- If load == 0 then fill in RegZ
begin
    if(LoadFlag = '0') then
    EndFlag <= '1' ;
RegZ <= Final;
end if;
end process;
end Behavioral;