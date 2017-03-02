library ieee;
use ieee.std_logic_1164.all;

entity ProgramCounterRegister_x16 is 
	port (
	clock : in STD_LOGIC;
	input: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	output: out STD_LOGIC_VECTOR(15 DOWNTO 0));
end ProgramCounterRegister_x16;
	
architecture skeleton of ProgramCounterRegister_x16 is 
	begin
	process (clock, input) is
	begin
		if (clock'event AND clock = '1') then
			output <= input;
		end if;
	end process;
end skeleton;