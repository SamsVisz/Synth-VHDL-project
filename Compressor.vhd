--  Library Declaration
LIBRARY ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;


--  Entity Declaration
entity Compressor is
	port
	(
		Sine	: in std_logic_Vector(8 downto 0);
		enab	: in std_logic;
		Output : out std_logic_vector(8 downto 0)
	);

end Compressor;


--  Architecture Body
architecture ARCHNAME of Compressor is
--signal can be declared at this position
signal temp : unsigned(8 downto 0);

BEGIN
	Compressor: 
	process( Sine , enab) -- processname is optional
	begin
	if sine > "010101010" then 
	temp <= ((unsigned(sine) -"010101010") /2) + "010101010"; --010101... is treshold 
	
	
	elsif sine < "001010000" then
	temp <= "001010000"-(( "001010000" - unsigned(sine)) /2) ;
	else
	temp <= unsigned(sine); 
	end if ;	
	
	if enab = '0' then
	Output <= std_logic_vector(temp);
	else
	output <= sine;
	end if;
	end process;
	

end architecture;
