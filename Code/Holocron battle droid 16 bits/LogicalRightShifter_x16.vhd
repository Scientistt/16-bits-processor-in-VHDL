library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LogicalRightShifter_x16 is
    Port (
			input : STD_LOGIC_VECTOR (15 downto 0);
			output : out STD_LOGIC_VECTOR (15 downto 0));
end LogicalRightShifter_x16;

architecture skeleton of LogicalRightShifter_x16 is
begin
	process(input) is
		begin
			
			for i in 14 downto 0 loop
				output(i) <= input(i + 1);
			end loop;
			output(15) <= '0';
	end process;
end skeleton;