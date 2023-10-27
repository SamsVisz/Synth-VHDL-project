LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

entity clockDiv is
	port(clk		:	in std_logic;
		  nrst	: 	in std_logic;
		  clkDiv :	out std_logic);
end clockDiv;

architecture Behavioral of clockDiv is
	 signal temp	  : std_logic_vector(9 downto 0) := "0000000000";
	 signal newClock : std_logic := '0';
begin

clock_divider_to_2500Hz:
	process(clk, nrst)
	begin
		if nrst = '0' then
			temp <= "0000000000";
		elsif rising_edge(clk) then
			if temp = "1111101000" then
				newClock <= not newClock;
				temp <= "0000000000";
			else
				temp <= temp + '1';
			end if;
		end if;
	end process;
clkDiv <= newClock;	
end Behavioral;	