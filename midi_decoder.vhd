library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity midi_decoder is

PORT ( midi	: in std_logic;
		 C		: out std_logic;
		 clk	: in std_logic;
		 nrst	: in std_logic);
end midi_decoder;

architecture Behavioural of midi_decoder is
	signal counter : integer := 0;
	signal start_bit : std_logic;	
begin
	process(clk,counter,midi)
	begin
--decode the sequence	
	if rising_edge(clk) then
		if midi = '1' then
			if counter = 0 then
				start_bit <= '1';
			end if;
		end if;
		if start_bit = '1' then	
			counter <= counter + 1;
		else
			counter <= counter + 0;
		end if;		

		if counter = 8165 then
			if midi = '0' then
			C <= '0';
			else 
			C <= '1';
			end if;
		elsif counter = 50000 then
			counter <= 0;
			start_bit <= '0';
		elsif midi = '1' then
			if counter = 0 then
				start_bit <= '1';
			end if;
		end if;	
	end if;	
	end process;
	
end architecture;