library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArithmeticalLogicalLeftShifter_x16 is
    Port (
			input : STD_LOGIC_VECTOR (15 downto 0);
			output : out STD_LOGIC_VECTOR (15 downto 0));
end ArithmeticalLogicalLeftShifter_x16;

architecture skeleton of ArithmeticalLogicalLeftShifter_x16 is
begin
	process(input) is
		begin
			
			for i in 15 downto 1 loop
				output(i) <= input(i - 1);
			end loop;
			output(0) <= '0';
	end process;
end skeleton;