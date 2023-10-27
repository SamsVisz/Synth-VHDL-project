library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adjust_BPM is
     Port (speed_up			: in std_logic;
			  BPM					: out std_logic_vector(26 downto 0);
			  reset_BPM			: out std_logic;
			  BPM_dis			: out std_logic_vector(8 downto 0));
end adjust_BPM;

architecture Behavioral of adjust_BPM is
	signal speed 	: integer := 12500000;
	signal reset	: std_logic := '0';
	signal countSig: std_logic_vector(2 downto 0) := "011";
begin
	
adjust_speed_signal:
	process(speed_up)
	begin
		if speed_up = '0' then
					countSig <= countSig + "001";
		end if;
	end process;
	
adjust_BPM:
	process(countSig)
	begin
		case countSig is
			when "000" => speed <= 7500000;  BPM_dis <= "011001000"; reset <= not reset;
			when "001" => speed <= 37500000; BPM_dis <= "000101000"; reset <= not reset;
			when "010" => speed <= 18750000; BPM_dis <= "001010000"; reset <= not reset;
			when "011" => speed <= 12500000; BPM_dis <= "001111000"; reset <= not reset;
			when "100" => speed <= 9375000;  BPM_dis <= "010100000"; reset <= not reset;
			when "101" => speed <= 7500000;  BPM_dis <= "011001000"; reset <= not reset;
			when "110" => speed <= 7500000;  BPM_dis <= "011001000"; reset <= not reset;
			when others => speed <= 7500000;  BPM_dis <= "011001000"; reset <= not reset;
		end case; 
	end process;	
reset_BPM <= reset;	
bpm <= std_logic_vector( to_unsigned( speed,27));	
end Behavioral;