library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

entity sequencer is
    Port ( clk					: in std_logic;
			  nrst				: in std_logic;
			  sequence_enab	: in std_logic_vector(1 downto 0);
			  input				: in std_logic_vector(6 downto 0);
			  BPM					: in std_logic_vector(26 downto 0);
			  reset_BPM			: in std_logic;
			  note				: out std_logic_vector(12 downto 0));
end sequencer;

architecture Behavioral of sequencer is
	signal reset	: std_logic := reset_BPM;
	signal reset2	: std_logic_vector(1 downto 0) := sequence_enab;
	signal temp 	: std_logic_vector(12 downto 0) := "1111111000000";
	signal counter : std_logic_vector(26 downto 0) := "000000000000000000000000000";
begin	
reset <= reset_BPM;
reset2 <= sequence_enab;
--generate sequence		
	process (clk, reset_BPM,sequence_enab,counter) 
   begin
		if reset = not reset_BPM then
			counter <= "000000000000000000000000000";	
		elsif reset2 = not sequence_enab then
			counter <= "000000000000000000000000000";	
		elsif rising_edge(clk) then	
			if sequence_enab = "00" then 								--no sequence
					temp(0) <= input(0);
					temp(1) <= input(1);
					temp(2) <= input(2);
					temp(3) <= input(3);
					temp(4) <= input(4);
					temp(5) <= input(5);
					temp(6) <= '1';
					temp(7) <= '1';
					temp(8) <= '1';
					temp(9) <= '1';
					temp(10) <= '1';
					temp(11) <= '1';
					temp(12) <= '1';
			elsif sequence_enab = "01" then							--sequence up in steps of 2
				if counter >= "000000000000000000000000000" and counter < bpm then
										temp(0) <= input(0);
										temp(1) <= input(1);
										temp(2) <= input(2);
										temp(3) <= input(3);
										temp(4) <= input(4);
										temp(5) <= input(5);
										temp(6) <= '1';
										temp(7) <= '1';
										temp(8) <= '1';
										temp(9) <= '1';
										temp(10) <= '1';
										temp(11) <= '1';
										temp(12) <= '1';										
										counter <= counter + 1;			
				elsif counter >= bpm and counter < bpm + bpm then									--when counter is at BPM
										temp(0) <= '1';
										temp(1) <= '1';
										temp(2) <= input(0);
										temp(3) <= input(1);
										temp(4) <= input(2);
										temp(5) <= input(3);
										temp(6) <= input(4);
										temp(7) <= input(5);
										temp(8) <= '1';
										temp(9) <= '1';
										temp(10) <= '1';
										temp(11) <= '1';
										temp(12) <= '1';									
										counter <= counter + 1;										
				elsif counter >= bpm + bpm and counter < bpm + bpm + bpm then							--when counter is at BPM + BPM
										temp(0) <= '1';
										temp(1) <= '1';
										temp(2) <= '1';
										temp(3) <= '1';
										temp(4) <= input(0);
										temp(5) <= input(1);
										temp(6) <= input(2);
										temp(7) <= input(3);
										temp(8) <= input(4);
										temp(9) <= input(5);
										temp(10) <= '1';
										temp(11) <= '1';
										temp(12) <= '1';
										counter <= counter + 1;		
				elsif counter >= bpm + bpm + bpm and counter < bpm + bpm + bpm + bpm then					--when counter is at BPM + BPM + BPM
										temp(0) <= '1';
										temp(1) <= '1';
										temp(2) <= '1';
										temp(3) <= '1';
										temp(4) <= '1';
										temp(5) <= '1';
										temp(6) <= input(0);
										temp(7) <= input(1);
										temp(8) <= input(2);
										temp(9) <= input(3);
										temp(10) <= input(4);
										temp(11) <= input(5);
										temp(12) <= '1';
										counter <= counter + 1;											
				elsif counter = bpm + bpm + bpm + bpm then			--when counter is at BPM + BPM + BPM + BPM
										counter <= "000000000000000000000000000";				
				else
										counter <= counter + 1;
				end if;
			elsif sequence_enab = "10" then							--sequence down in steps of 2
				if counter >= "000000000000000000000000000" and counter < bpm then
										temp(0) <= '1';
										temp(1) <= '1';
										temp(2) <= '1';
										temp(3) <= '1';
										temp(4) <= '1';
										temp(5) <= '1';
										temp(6) <= input(0);
										temp(7) <= input(1);
										temp(8) <= input(2);
										temp(9) <= input(3);
										temp(10) <= input(4);
										temp(11) <= input(5);
										temp(12) <= '1';
										counter <= counter + 1;			
				elsif counter >= bpm and counter < bpm + bpm then									--when counter is at BPM
										temp(0) <= '1';
										temp(1) <= '1';
										temp(2) <= '1';
										temp(3) <= '1';
										temp(4) <= input(0);
										temp(5) <= input(1);
										temp(6) <= input(2);
										temp(7) <= input(3);
										temp(8) <= input(4);
										temp(9) <= input(5);
										temp(10) <= '1';
										temp(11) <= '1';
										temp(12) <= '1';
										counter <= counter + 1;										
				elsif counter >= bpm + bpm and counter < bpm + bpm + bpm then							--when counter is at BPM + BPM
										temp(0) <= '1';
										temp(1) <= '1';
										temp(2) <= input(0);
										temp(3) <= input(1);
										temp(4) <= input(2);
										temp(5) <= input(3);
										temp(6) <= input(4);
										temp(7) <= input(5);
										temp(8) <= '1';
										temp(9) <= '1';
										temp(10) <= '1';
										temp(11) <= '1';
										temp(12) <= '1';									
										counter <= counter + 1;		
				elsif counter >= bpm + bpm + bpm and counter < bpm + bpm + bpm + bpm then					--when counter is at BPM + BPM + BPM
										temp(0) <= input(0);
										temp(1) <= input(1);
										temp(2) <= input(2);
										temp(3) <= input(3);
										temp(4) <= input(4);
										temp(5) <= input(5);
										temp(6) <= '1';
										temp(7) <= '1';
										temp(8) <= '1';
										temp(9) <= '1';
										temp(10) <= '1';
										temp(11) <= '1';
										temp(12) <= '1';										
										counter <= counter + 1;											
				elsif counter = bpm + bpm + bpm + bpm then			--when counter is at BPM + BPM + BPM + BPM
										counter <= "000000000000000000000000000";														
										
				else
										counter <= counter + 1;
				end if;
			elsif sequence_enab = "11" then							--no sequence	
				if counter >= "000000000000000000000000000" and counter < bpm then
										temp(0) <= input(0);
										temp(1) <= input(1);
										temp(2) <= input(2);
										temp(3) <= input(3);
										temp(4) <= input(4);
										temp(5) <= input(5);
										temp(6) <= '1';
										temp(7) <= '1';
										temp(8) <= '1';
										temp(9) <= '1';
										temp(10) <= '1';
										temp(11) <= '1';
										temp(12) <= '1';										
										counter <= counter + 1;
				elsif counter >= bpm and counter < bpm + bpm then									--when counter is at BPM + BPM
										temp(0) <= '1';
										temp(1) <= '1';
										temp(2) <= '1';
										temp(3) <= '1';
										temp(4) <= input(0);
										temp(5) <= input(1);
										temp(6) <= input(2);
										temp(7) <= input(3);
										temp(8) <= input(4);
										temp(9) <= input(5);
										temp(10) <= '1';
										temp(11) <= '1';
										temp(12) <= '1';
										counter <= counter + 1;
				elsif counter >= bpm + bpm and counter < bpm + bpm + bpm then							--when counter is at BPM + BPM
										temp(0) <= '1';
										temp(1) <= '1';
										temp(2) <= input(0);
										temp(3) <= input(1);
										temp(4) <= input(2);
										temp(5) <= input(3);
										temp(6) <= input(4);
										temp(7) <= input(5);
										temp(8) <= '1';
										temp(9) <= '1';
										temp(10) <= '1';
										temp(11) <= '1';
										temp(12) <= '1';									
										counter <= counter + 1;
				elsif counter >= bpm + bpm + bpm and counter < bpm + bpm + bpm + bpm then						--when counter is at BPM + BPM + BPM
										temp(0) <= '1';
										temp(1) <= '1';
										temp(2) <= '1';
										temp(3) <= '1';
										temp(4) <= '1';
										temp(5) <= '1';
										temp(6) <= input(0);
										temp(7) <= input(1);
										temp(8) <= input(2);
										temp(9) <= input(3);
										temp(10) <= input(4);
										temp(11) <= input(5);
										temp(12) <= '1';
										counter <= counter + 1;											
				elsif counter = bpm + bpm + bpm + bpm then			--when counter is at BPM + BPM + BPM + BPM
										counter <= "000000000000000000000000000";	
				end if;						
			end if;
		end if;
   end process;
	note <= temp;
end Behavioral;