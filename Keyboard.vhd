LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

entity Keyboard is
    Port ( C	 : in STD_LOGIC;
			  D    : in STD_LOGIC;
			  E    : in STD_LOGIC;
			  F	 : in STD_LOGIC;
			  G	 : in STD_LOGIC;
			  A	 : in std_logic;
           input : out  STD_LOGIC_VECTOR(6 downto 0));
end Keyboard;

architecture Behavioral of Keyboard is 
	signal outp_bus : std_LOGIC_VECTOR(6 downto 0) := "1111111"; --set the output so that the notes wont be played when turning on the system
	signal B			 : std_logic;
begin
	process (C ,D ,E, F, G, A, outp_bus)
   begin
		--output bus
		outp_bus(0) <= C;
		outp_bus(1) <= D;
		outp_bus(2) <= E;
		outp_bus(3) <= F;
		outp_bus(4) <= G;
		outp_bus(5) <= A;
   end process; 
input <= outp_bus;
end Behavioral;