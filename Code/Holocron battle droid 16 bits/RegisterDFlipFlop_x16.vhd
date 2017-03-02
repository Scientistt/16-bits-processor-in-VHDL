library ieee;
use ieee.std_logic_1164.all;

entity RegisterDFlipFlop_x16 is 
	port (
	clock, reset, enable: in STD_LOGIC;
	input: in STD_LOGIC_VECTOR(15 DOWNTO 0);
	output: out STD_LOGIC_VECTOR(15 DOWNTO 0));
end RegisterDFlipFlop_x16;
	
architecture skeleton of RegisterDFlipFlop_x16 is 
	begin
	process (clock, reset, enable, input) is
	begin
		if(reset = '1') then
			output <= "0000000000000000";
		elsif (clock'event AND clock = '1') then
			if(enable = '1') then
				output <= input;
			end if;
		end if;
	end process;
end skeleton;