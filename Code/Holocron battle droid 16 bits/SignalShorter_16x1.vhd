library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignalShorter_16x1 is
    Port (
			input : in STD_LOGIC_VECTOR (15 downto 0);
			output : out STD_LOGIC);
end SignalShorter_16x1;

architecture skeleton of SignalShorter_16x1 is
begin
	process(input) is
	
	variable verifier : STD_LOGIC;
	
		begin
		
		verifier := '0';
			
			for i in 15 downto 0 loop
				if(input(i) = '1') then
					verifier := '1';
				end if;
			end loop;
			
			output <= verifier;
			
	end process;
	
	
end skeleton;