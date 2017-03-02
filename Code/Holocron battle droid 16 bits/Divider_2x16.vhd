library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Divider_2x16 is
	Port (
			input_A, input_B : in STD_LOGIC_VECTOR (15 downto 0);
			outputLow, outputHigh : out STD_LOGIC_VECTOR (15 downto 0);
			carryOut : out STD_LOGIC);
end Divider_2x16;





		
		
architecture skeleton of Divider_2x16 is

	begin
	
	
		process(input_A, input_B)
		
		variable inte, rest, howMuch : std_logic_vector (15 downto 0);
		variable carry: std_logic;
		
		
		function shiter (number : std_logic_vector(15 downto 0)) return std_logic_vector is
			  
			  variable TMP : std_logic_vector(15 downto 0);
		begin
			  for i in 14 downto 0 loop
				 TMP(i + 1) := number(i);
			  end loop; 
			  TMP(0) := '0';
			  return TMP;
		end shiter;
		
		begin
			carry:='0';
			
			if(input_B = "0000000000000000") then
			
			outputHigh <= "0000000000000000";
			outputLow  <= "0000000000000000";
			howMuch 	  := "0000000000000001";
			
			else
			
				rest := "0000000000000000";
				inte := "0000000000000000";
			
				for i in 15 downto 0 loop
					
					rest := shiter(rest);
						
					rest(0) := input_A(i);
					
					if(rest >= input_B) then
					
						rest := rest - input_B;
						inte(i) := '1';
					
					end if;
				
				
				end loop;			
					
			outputHigh <= rest;
			outputLow <= inte;
			
			end if;
		
			carryOut	<= '0';
			
		end process;	
		
end skeleton;



	