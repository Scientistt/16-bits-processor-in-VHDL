library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignalExtender_11x16 is
    Port (
			input : STD_LOGIC_VECTOR (10 downto 0);
			output : out STD_LOGIC_VECTOR (15 downto 0));
end SignalExtender_11x16;

architecture skeleton of SignalExtender_11x16 is
begin
	process(input) is
		begin
			
			for i in 10 downto 0 loop
				output(i) <= input(i);
			end loop;
			
			for i in 15 downto 10 loop
				output(i) <= input(10);
			end loop;
	end process;
end skeleton;