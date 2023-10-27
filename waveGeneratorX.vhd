library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity waveGeneratorX is
	port (clkDiv     	: in std_logic;
			nrst			: in std_logic;
			note			: in std_logic_vector(12 downto 0);
			enab			: in std_logic_vector(1 downto 0);
			i_data 		: out unsigned(7 downto 0));
end waveGeneratorX;

architecture Behavioral of waveGeneratorX is


type sampleTimeArray is array (0 to 12) of unsigned(7 downto 0);
signal sampleTime : sampleTimeArray := ("01011111","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000","00000000");

--signals for square wave
signal x 					: integer;
signal noteX 				: integer;												--Correspond to which note is played
signal transition 		: unsigned(7 downto 0);			--transition for squarewave
signal i 					: unsigned(7 downto 0) := "00000000";	--counter

--signals for sawtooth wave
signal int_saw				: integer;
signal dec_saw				: integer;
signal sawCountInt		: integer := 0;
signal sawCountDec		: integer := 0;
signal decimal				: integer;
signal eightbit			: unsigned(8 downto 0) := "100000000"; 				--256
signal eightbitTimesHun	: unsigned(14 downto 0) := "110010000000000"; 	--25600

--signals for triangle wave
signal int_triangle		: integer;
signal dec_triangle		: integer;
signal triangleCountInt	: integer := 0;
signal triangleCountDec	: integer := 0;
signal y						: integer := 0;

Begin
	process(clkDiv,note,nrst,sampleTime,sawCountDec,sawCountInt)
	begin 
		if note = "1111111111110" then
			noteX <= 0;
			--Square Wave
			transition <= ('0' & sampleTime(0)(7 downto 1)); --divide by two
			
			--Saw Wave
			int_saw <= to_integer(eightbit/('0' & sampleTime(0)));					 --256/sampleTime	for the integervalue of the steps
			dec_saw <= to_integer(eightbitTimesHun/("0000000" & sampleTime(0)))-((to_integer(eightbit/('0' & sampleTime(0))))*100);			--decimal value of the steps
			
			--Triangle Wave
			int_triangle <= to_integer("1000000000"/('0' & sampleTime(0)));					 --256/sampleTime	for the integervalue of the steps
			dec_triangle <= to_integer(("1100100000000000")/("0000000" & sampleTime(0)))-((to_integer(("1000000000")/('0' & sampleTime(0))))*100);			--decimal value of the steps			
		end if;	

		
		if nrst = '0' then
			i_data <= "00000000";
		elsif rising_edge(clkDiv) then
		
			--SQUARE WAVE
			if enab = "01" then										
				if i < transition then
					--x <= 0;
					i_data <= "10000000";
				else
					--x <= 255;
					i_data <= "01111110";
				end if;	
				if i = sampleTime(noteX) then
					i <= "00000000";
				else	
					i <= i + "00000001";
				end if;
				--i_data <= std_logic_vector(to_unsigned(x,8));
				
			--SAW WAVE	
			elsif enab = "11" then									
			sawCountInt <= sawCountInt + int_saw;
			sawCountDec <= sawCountDec + dec_saw;
				if (sawCountDec + dec_saw) > 99 then
					sawCountDec <= sawCountDec - 100;
					sawCountInt <= sawCountInt + 1;
				end if;	
			i_data <= unsigned(to_unsigned((sawCountInt),8));
		
			--TRIANGLE WAVE
			elsif enab = "10" then
			y <= y + 1;			
				if y < (sampleTime(noteX)/4) then
				triangleCountInt <= triangleCountInt + int_triangle;
				triangleCountDec <= triangleCountDec + dec_triangle;
					if triangleCountDec + dec_triangle > 99 then
						triangleCountDec <= triangleCountDec - 100;
						triangleCountInt <= triangleCountInt + 1;
					end if;
				elsif y < (sampleTime(noteX)/4) and y > (sampleTime(noteX)/4)	then
				triangleCountInt <= triangleCountInt - int_triangle;
				triangleCountDec <= triangleCountDec - dec_triangle;
					if triangleCountDec + dec_triangle < -99 then
						triangleCountDec <= triangleCountDec + 100;
						triangleCountInt <= triangleCountInt + 1;
					end if;
				elsif y < ((sampleTime(noteX)/4)*4) and y > (sampleTime(noteX)/4) then
				triangleCountInt <= triangleCountInt + int_triangle;
				triangleCountDec <= triangleCountDec + dec_triangle;
					if triangleCountDec + dec_triangle > 99 then
						triangleCountDec <= triangleCountDec - 100;
						triangleCountInt <= triangleCountInt + 1;
					end if;					
				end if;
			i_data <= unsigned(to_unsigned(triangleCountInt,8));	
			end if;	
		end if;
			
	end process;
end architecture Behavioral;	
	