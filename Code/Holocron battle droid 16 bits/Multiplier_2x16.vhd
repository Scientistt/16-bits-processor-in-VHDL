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
		variable carry, current, prev: std_logic;
		
		function shifter (number : std_logic_vector(31 downto 0)) return std_logic_vector is
			  
			  variable TMP : std_logic_vector(31 downto 0);
		begin
			  for i in 30 downto 0 loop
				 TMP(i) := number(i + 1);
			  end loop; 
			  TMP(31) := number(31);
			  return TMP;
			  
		end shifter;
		
		
		
		begin
			helper:="0000000000000000" & input_B;
			carry:='0';
			
			--helper := input_A * input_B;
			
			current := '0';
			
			for i in 0 to 15 loop
			
			prev := current;
			current := helper(0);
			
			if(prev = '0') then
			
				if(current = '1')
					then
					
					helper(31 downto 16) := helper(31 downto 16) + not(input_A) + 1;
				
				end if;
			
			elsif(prev = '1') then
				
				
				if(current = '0') then
				
				helper(31 downto 16) := helper(31 downto 16) + input_A;
				
				end if;
				
			end if;
				
				helper := shifter(helper);
			
			end loop;
			
			outputHigh <= helper(31 downto 16);
			outputLow  <= helper(15 downto 0);
		
			carryOut	<= '0';
			
		end process;
		
end skeleton;