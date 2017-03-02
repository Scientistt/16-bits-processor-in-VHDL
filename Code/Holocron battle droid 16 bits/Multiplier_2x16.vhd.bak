library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Multiplier_2x16 is
	Port (
			input_A, input_B : in STD_LOGIC_VECTOR (15 downto 0);
			outputLow, outputHigh : out STD_LOGIC_VECTOR (15 downto 0);
			carryOut : out STD_LOGIC);
end Multiplier_2x16;


architecture skeleton of Multiplier_2x16 is

	begin
	
		process(input_A, input_B)
		
		variable helper: std_logic_vector (31 downto 0);
		variable carry: std_logic;
		
		begin
			helper:="0000000000000000" & input_B;
			carry:='0';
			
			helper := input_A * input_B;
			
			outputHigh <= helper(31 downto 16);
			outputLow  <= helper(15 downto 0);
		
			carryOut	<= '0';
			
		end process;
		
end skeleton;