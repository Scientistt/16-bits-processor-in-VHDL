library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignalExtender_4x16 is
    Port (
			input : STD_LOGIC_VECTOR (3 downto 0);
			output : out STD_LOGIC_VECTOR (15 downto 0));
end SignalExtender_4x16;

architecture skeleton of SignalExtender_4x16 is
begin
	process(input) is
		begin
			
			for i in 3 downto 0 loop
				output(i) <= input(i);
			end loop;
			output(15 downto 4) <= "000000000000";
	end process;
end skeleton;